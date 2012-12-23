//
//  SettingsVC.h
//  MyDoc
//
//  Created by Sudhan Raj on 4/11/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsVC : UIViewController

@property (retain, nonatomic) IBOutlet UIButton *logoutBtn;

- (IBAction) logoutUser:(id)sender;

@end
