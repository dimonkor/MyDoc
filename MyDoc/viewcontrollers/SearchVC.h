//
//  SearchVC.h
//  MyDoc
//
//  Created by Sudhan Raj on 23/10/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchVC : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *DocName;
@property (retain, nonatomic) IBOutlet UITextField *DocSpeciality;
@property (retain, nonatomic) IBOutlet UITextField *DocLocation;

- (IBAction)backgroundTouched:(id)sender;
- (IBAction)textFieldReturn:(id)sender;

- (IBAction) search:(id)sender;

@end
