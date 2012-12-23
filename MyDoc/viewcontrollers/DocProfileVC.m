//
//  DocProfileVC.m
//  MyDoc
//
//  Created by Sudhan Raj on 3/11/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import "DocProfileVC.h"

@interface DocProfileVC ()

@end

@implementation DocProfileVC

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
    
    [profileScroll setScrollEnabled:YES];
    [profileScroll setContentSize:CGSizeMake(320,971)];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
