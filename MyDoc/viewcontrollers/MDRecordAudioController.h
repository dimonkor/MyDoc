//
// Created by dmitrykorotchenkov on 21.11.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface MDRecordAudioController : UIViewController <AVAudioRecorderDelegate>
@property (strong, nonatomic) IBOutlet UIButton *recordBtn;
@property (strong, nonatomic) IBOutlet UIButton *pauseBtn;
@property (strong, nonatomic) IBOutlet UIButton *stopBtn;
@property (strong, nonatomic) IBOutlet UIButton *sendBtn;
@property (strong, nonatomic) IBOutlet UIButton *playBtn;
@property(nonatomic, strong) void (^completionBlock)(NSString *);
@end