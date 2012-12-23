//
//  LoginVC.h
//  MyDoc
//
//  Created by Sudhan Raj on 24/10/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *email;
@property (retain, nonatomic) IBOutlet UITextField *password;

- (IBAction)backgroundTouched:(id)sender;
- (IBAction)textFieldReturn:(id)sender;

- (IBAction)cancelBtn:(id)sender;
- (IBAction)loginUser:(id)sender;

@end
