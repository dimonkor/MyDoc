//
//  RegisterVC.h
//  MyDoc
//
//  Created by Sudhan Raj on 1/11/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterVC : UIViewController {
    IBOutlet UIScrollView *regScroll;
}

@property (retain, nonatomic) IBOutlet UITextField *nameField;
@property (retain, nonatomic) IBOutlet UITextField *emailField;
@property (retain, nonatomic) IBOutlet UITextField *pwdField;
@property (retain, nonatomic) IBOutlet UITextField *pwdCfmField;
@property (retain, nonatomic) IBOutlet UITextField *contactField;
@property (retain, nonatomic) IBOutlet UITextField *genderField;
@property (retain, nonatomic) IBOutlet UITextField *dobField;
@property (retain, nonatomic) IBOutlet UITextView *allergyTV;
@property (retain, nonatomic) IBOutlet UITextView *historyTV;

- (IBAction)backgroundTouched:(id)sender;
- (IBAction)textFieldReturn:(id)sender;

- (IBAction) cancelButton:(id)sender;
- (IBAction) tncButton:(id)sender;
- (IBAction) registerButton:(id)sender;

@end
