//
//  RegisterVC.m
//  MyDoc
//
//  Created by Sudhan Raj on 1/11/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import "RegisterVC.h"

#import "DataManager.h"
#import <QuartzCore/QuartzCore.h>

@interface RegisterVC ()

@end

@implementation RegisterVC

@synthesize nameField, emailField, pwdField, pwdCfmField, contactField, genderField, dobField, allergyTV, historyTV;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [regScroll setScrollEnabled:YES];
    [regScroll setContentSize:CGSizeMake(320,911)];
    
    allergyTV.layer.cornerRadius = 5;
    allergyTV.clipsToBounds = YES;
    [allergyTV.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [allergyTV.layer setBorderWidth:2.0];
    
    historyTV.layer.cornerRadius = 5;
    historyTV.clipsToBounds = YES;
    [historyTV.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [historyTV.layer setBorderWidth:2.0];
    
	// Do any additional setup after loading the view.
}

- (IBAction)backgroundTouched:(id)sender {
    [nameField resignFirstResponder];
    [emailField resignFirstResponder];
    [pwdField resignFirstResponder];
    [pwdCfmField resignFirstResponder];
    [contactField resignFirstResponder];
    [allergyTV resignFirstResponder];
    [historyTV resignFirstResponder];
    [genderField resignFirstResponder];
    [dobField resignFirstResponder];
}

- (IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction) cancelButton:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction) tncButton:(id)sender {
    
}

- (IBAction) registerButton:(id)sender {
    [[DataManager sharedInstance] loginUser:YES];
    [self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
}
- (void)viewDidUnload {
    [self setNameField:nil];
    [self setEmailField:nil];
    [self setPwdField:nil];
    [self setPwdCfmField:nil];
    [self setContactField:nil];
    [self setGenderField:nil];
    [self setDobField:nil];
    [self setAllergyTV:nil];
    [self setHistoryTV:nil];
    [super viewDidUnload];
}
@end
