//
//  DataManager.m
//  MyDoc
//
//  Created by Sudhan Raj on 2/11/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import "DataManager.h"

#import "Util.h"

@implementation DataManager

@synthesize searchVC, apptVC, diaryVC, favVC, settingVC;
@synthesize initData;

@synthesize apiEngine = _apiEngine;

static DataManager *sharedInstance = nil;

+ (DataManager*) sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedInstance;
}

- (void) initialize {
    NSMutableDictionary *headerFields = [NSMutableDictionary dictionary];
    [headerFields setValue:@"application/json" forKey:@"Accept"];
    [headerFields setValue:[Util getUDID] forKey:@"Device-Identifier"];
    [headerFields setValue:[Util getVersion] forKey:@"Version"];
    
    self.apiEngine = [[APIEngine alloc] initWithHostName:@"54.251.36.197/serve" customHeaderFields:headerFields];
    [self.apiEngine useCache];
    
    [self.apiEngine onCompletion:^(Init *data) {
        self.initData = data;
    }
                         onError:^(NSError* error) {
                             [UIAlertView showWithError:error];
                         }
     ];
    
}

- (BOOL) isLoggedIn {
    return loggedInStatus;
}

- (void) loginUser:(BOOL)loginStatus {
    loggedInStatus = loginStatus;
}

- (NSArray *) getDocName {
    return [[NSMutableArray alloc] initWithObjects:@"Dr. Chris Ingram - MD", @"Dr. Alla Shustarovich - MD", @"Dr. Edward H. Lowe - MD", @"Dr. Douglas Bailyn - MD", @"Dr. Glenn Gandelman - MD, FACC, MPH", nil];
}

- (NSArray *) getDocAdd {
    return [[NSMutableArray alloc] initWithObjects:@"Dr. Chris Ingram - MD", @"Dr. Alla Shustarovich - MD", @"Dr. Edward H. Lowe - MD", @"Dr. Douglas Bailyn - MD", @"Dr. Glenn Gandelman - MD, FACC, MPH", nil];
}

-(void)sendMessage:(NSString *)textMessage image:(UIImage *)image audioPath:(NSString *)audioPath{
    // TODO: send message to server
    NSLog(@"text : %@ \nimage : %@ \naudio : %@", textMessage, image , audioPath);
}

@end
