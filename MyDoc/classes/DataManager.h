//
//  DataManager.h
//  MyDoc
//
//  Created by Sudhan Raj on 2/11/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "APIEngine.h"
#import "Init.h"

@interface DataManager : NSObject {
    BOOL loggedInStatus;
    NSArray *searchVC;
    NSArray *apptVC;
    NSArray *diaryVC;
    NSArray *favVC;
    NSArray *settingVC;
    
    Init    *initData;
}

@property (retain, nonatomic) NSArray *searchVC;
@property (retain, nonatomic) NSArray *apptVC;
@property (retain, nonatomic) NSArray *diaryVC;
@property (retain, nonatomic) NSArray *favVC;
@property (retain, nonatomic) NSArray *settingVC;

@property (nonatomic, retain) Init *initData;

@property (nonatomic, retain) APIEngine *apiEngine;

+ (id) sharedInstance;

- (void) initialize;

- (BOOL) isLoggedIn;
- (void) loginUser: (BOOL) loginStatus;

- (NSArray *) getDocName;
- (NSArray *) getDocAdd;

- (void)sendMessage:(NSString *)textMessage image:(UIImage *)image audioPath:(NSString *)audioPath;


@end
