//
// Created by dmitrykorotchenkov on 20.11.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "MDAddEntryController.h"
#import "MDRecordAudioController.h"
#import "DataManager.h"

#define CAMERA_TITLE @"Camera"
#define LIBRARY_TITLE @"Library"

@interface MDAddEntryController()

@property (nonatomic, copy) NSString * attachedAudio;
@property (nonatomic, strong) UIImage * attachedImage;

@end

@implementation MDAddEntryController

@synthesize attachedAudio = _attachedAudio;


#pragma mark choise photo

- (void)loadView {
    [super loadView];
    [self.photoBtn addTarget:self action:@selector(choisePhoto) forControlEvents:UIControlEventTouchUpInside];
    [self.sendBtn addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
}

-(IBAction)send{
    [[DataManager sharedInstance] sendMessage:self.textField.text
                                        image:self.attachedImage
                                    audioPath:self.attachedAudio];
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)choisePhoto {
    BOOL camera = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    BOOL library = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
    UIActionSheet *actionSheet = nil;
    if (library && camera) {
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:CAMERA_TITLE, LIBRARY_TITLE, nil];
    } else if (library) {
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:LIBRARY_TITLE, nil];
    } else if (camera) {
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:CAMERA_TITLE, nil];
    } else {
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:nil];
    }
    [actionSheet showFromToolbar:self.navigationController.toolbar];

}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *const clickedButton = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([clickedButton isEqualToString:LIBRARY_TITLE]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        picker.allowsEditing = YES;
        [self presentViewController:picker animated:YES completion:nil];
    } else if ([clickedButton isEqualToString:CAMERA_TITLE]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:nil];
    }

}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    NSLog(@"choisePhoto");
    self.attachedImage = image;
    [self disableAttachButtons];
    [picker dismissModalViewControllerAnimated:YES];
}

#pragma mark choise audio

-(void)choiseAudioComplete:(NSString *)path{
    self.attachedAudio = path;
    [self disableAttachButtons];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    if ([segue.destinationViewController isKindOfClass:[MDRecordAudioController class]]){
        [(MDRecordAudioController *)segue.destinationViewController setCompletionBlock:^(NSString *path){
            [self choiseAudioComplete:path];
        }];
    }
}

-(void)disableAttachButtons{
    self.photoBtn.enabled = NO;
    self.audioBtn.enabled = NO;
}


- (void)viewDidUnload {
    [self setSendBtn:nil];
    [self setPhotoBtn:nil];
    [self setAudioBtn:nil];
    [super viewDidUnload];
}
@end