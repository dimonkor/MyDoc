//
//  SearchVC.m
//  MyDoc
//
//  Created by Sudhan Raj on 23/10/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import "SearchVC.h"

#import "DataManager.h"

@interface SearchVC ()

@end

@implementation SearchVC

@synthesize DocName, DocSpeciality, DocLocation;

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
    
    CGRect frameRect = DocName.frame;
    frameRect.size.height = 40;
    DocName.frame = frameRect;
    
    frameRect = DocSpeciality.frame;
    frameRect.size.height = 40;
    DocSpeciality.frame = frameRect;
    
    frameRect = DocLocation.frame;
    frameRect.size.height = 40;
    DocLocation.frame = frameRect;
    
	// Do any additional setup after loading the view.
}

- (IBAction)backgroundTouched:(id)sender {
    [DocName resignFirstResponder];
    [DocSpeciality resignFirstResponder];
    [DocLocation resignFirstResponder];
}

- (IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction) search:(id)sender {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
}

- (void)viewDidUnload {
    [self setDocName:nil];
    [self setDocSpeciality:nil];
    [self setDocLocation:nil];
    [super viewDidUnload];
}
@end
