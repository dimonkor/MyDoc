//
//  VideoCallVC.h
//  MyDoc
//
//  Created by Sudhan Raj on 11/11/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Opentok/Opentok.h>

@interface VideoCallVC : UIViewController<OTSessionDelegate, OTSubscriberDelegate, OTPublisherDelegate>
- (void)doConnect;
- (void)doPublish;
- (void)showAlert:(NSString*)string;

@end
