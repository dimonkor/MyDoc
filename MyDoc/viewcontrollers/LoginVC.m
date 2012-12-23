//
//  LoginVC.m
//  MyDoc
//
//  Created by Sudhan Raj on 24/10/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import "LoginVC.h"

#import "AppDelegate.h"
#import "DataManager.h"

@interface LoginVC ()

@end

@implementation LoginVC

@synthesize email, password;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:NO];
    
    if ([[DataManager sharedInstance] isLoggedIn])
        [self sortViews:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect frameRect = email.frame;
    frameRect.size.height = 40;
    email.frame = frameRect;
    frameRect = password.frame;
    frameRect.size.height = 40;
    password.frame = frameRect;
    
    switch (self.tabBarController.selectedIndex) {
        case 1:
            self.navigationController.navigationBar.topItem.title = @"Appointments";
            break;
        
        case 2:
            self.navigationController.navigationBar.topItem.title = @"Health Diary";
            break;
            
        case 3:
            self.navigationController.navigationBar.topItem.title = @"Favourites";
            break;
            
        case 4:
            self.navigationController.navigationBar.topItem.title = @"Settings";
            break;
            
        default:
            break;
    }
	// Do any additional setup after loading the view.
}

- (IBAction)backgroundTouched:(id)sender {
    [email resignFirstResponder];
    [password resignFirstResponder];
}

- (IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)cancelBtn:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)loginUser:(id)sender {
    DataManager *dm = [DataManager sharedInstance];
    [dm loginUser:YES];
    
    [self sortViews:YES];
}

- (void) sortViews: (BOOL)anim {
    DataManager *dm = [DataManager sharedInstance];
    
    switch (self.tabBarController.selectedIndex) {
        case 1:
            [self.navigationController setViewControllers: [dm apptVC] animated: anim];
            break;
        case 2:
            [self.navigationController setViewControllers: [dm diaryVC] animated: anim];
            break;
        case 3:
            [self.navigationController setViewControllers: [dm favVC] animated: anim];
            break;
        case 4:
            [self.navigationController setViewControllers: [dm settingVC] animated: anim];
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
}
- (void)viewDidUnload {
    [self setEmail:nil];
    [self setPassword:nil];
    [super viewDidUnload];
}
@end
