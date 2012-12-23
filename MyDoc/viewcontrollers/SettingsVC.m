//
//  SettingsVC.m
//  MyDoc
//
//  Created by Sudhan Raj on 4/11/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import "SettingsVC.h"

#import "DataManager.h"

@interface SettingsVC ()

@end

@implementation SettingsVC

@synthesize logoutBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([[DataManager sharedInstance] isLoggedIn]) {
        logoutBtn.hidden = NO;
    }
    else {
        logoutBtn.hidden = YES;
    }
    [self performLoginIfRequired];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) performLoginIfRequired {
    DataManager *dm = [DataManager sharedInstance];
    if (![dm isLoggedIn]) {
        UIStoryboard *sb = [UIApplication sharedApplication].delegate.window.rootViewController.storyboard;
        UIViewController *loginVC = [sb instantiateViewControllerWithIdentifier:@"LoginVC"];
        [dm setSettingVC: [self.navigationController viewControllers]];
        [self.navigationController setViewControllers:@[loginVC]];
    }
}

- (IBAction)logoutUser:(id)sender {
    [[DataManager sharedInstance] loginUser:NO];
    [self performLoginIfRequired];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
}
- (void)viewDidUnload {
    [self setLogoutBtn:nil];
    [super viewDidUnload];
}
@end
