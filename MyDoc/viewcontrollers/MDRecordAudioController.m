//
// Created by dmitrykorotchenkov on 21.11.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <AVFoundation/AVFoundation.h>
#import "MDRecordAudioController.h"

#define FILE_PATH [NSString stringWithFormat:@"%@/%@.caf", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] , @"tmp_record"];

typedef enum {
    MDRecordingStateRecord,
    MDRecordingStatePause,
    MDRecordingStateComplete,
    MDRecordingStateEmpty
} MDRecordingState;

@interface MDRecordAudioController ()

@property(nonatomic, strong) AVAudioRecorder *recorder;

@property(nonatomic) MDRecordingState state;

@property(nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation MDRecordAudioController


-(AVAudioRecorder *)recorder {
    if (!_recorder){
        NSError *error = nil;
        NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];

        [recordSetting setValue :[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
        [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
        [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];

        [recordSetting setValue :[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
        [recordSetting setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
        [recordSetting setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];
        NSString * path = FILE_PATH;
        _recorder = [[AVAudioRecorder alloc] initWithURL:[NSURL fileURLWithPath:path]
                                                    settings:recordSetting
                                                       error:&error];
        _recorder.delegate = self;
        self.state = MDRecordingStateEmpty;
    }
    return _recorder;
}


- (void)loadView {
    [super loadView];
    [self.recordBtn addTarget:self action:@selector(record) forControlEvents:UIControlEventTouchUpInside];
    [self.pauseBtn addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    [self.stopBtn addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.sendBtn addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    [self.playBtn addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    self.state = MDRecordingStateEmpty;
    [self updateButtonStates];
}

-(void)updateButtonStates{
    if (self.state == MDRecordingStateEmpty){
        self.recordBtn.enabled = YES;
        self.playBtn.enabled = NO;
        self.pauseBtn.enabled = NO;
        self.stopBtn.enabled = NO;
        self.sendBtn.enabled = NO;
        [self.pauseBtn setTitle:@"Pause" forState:UIControlStateNormal];
    }
    else if(self.state == MDRecordingStateRecord){
        self.recordBtn.enabled = NO;
        self.playBtn.enabled = NO;
        self.pauseBtn.enabled = YES;
        self.stopBtn.enabled = YES;
        self.sendBtn.enabled = NO;
        [self.pauseBtn setTitle:@"Pause" forState:UIControlStateNormal];
    }
    else if(self.state == MDRecordingStatePause){
        self.recordBtn.enabled = NO;
        self.playBtn.enabled = NO;
        self.pauseBtn.enabled = YES;
        self.stopBtn.enabled = YES;
        self.sendBtn.enabled = NO;
        [self.pauseBtn setTitle:@"Continue" forState:UIControlStateNormal];
    }
    else if (self.state == MDRecordingStateComplete){
        self.recordBtn.enabled = YES;
        self.playBtn.enabled = YES;
        self.pauseBtn.enabled = NO;
        self.stopBtn.enabled = NO;
        self.sendBtn.enabled = YES;
        [self.pauseBtn setTitle:@"Pause" forState:UIControlStateNormal];
    }
}

-(void)changeCurrentStateTo:(MDRecordingState)state{
    if (state != self.state){
        self.state = state;
        [self updateButtonStates];
    }
}

-(IBAction)dismissViewController:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)send{
    if (self.state != MDRecordingStateComplete){
        [self stop];
    }
    [self sendUrlToMessage];
}

-(void)sendUrlToMessage{
    NSString * path = FILE_PATH;
    if (self.completionBlock){
        self.completionBlock(path);
    }
    [self dismissModalViewControllerAnimated:YES];
}

-(void)record{
    [self.recorder recordForDuration:10];
    [self changeCurrentStateTo:MDRecordingStateRecord];
}

-(void)stop{
    [self.recorder stop];
}

-(void)pause{
    if (self.state == MDRecordingStatePause){
        [self record];
    }
    else{
        [self.recorder pause];
        [self changeCurrentStateTo:MDRecordingStatePause];
    }
}

-(void)play{
    NSString * path = FILE_PATH;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]
                                                         error:nil];
    [self.audioPlayer play];
}

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
    [self changeCurrentStateTo:MDRecordingStateComplete];
}

- (void)viewDidUnload {
    [self setRecordBtn:nil];
    [self setPauseBtn:nil];
    [self setStopBtn:nil];
    [self setSendBtn:nil];
    [super viewDidUnload];
}
@end