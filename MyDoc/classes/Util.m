//
//  Util.m
//  MyDoc
//
//  Created by Sudhan Raj on 2/11/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import "Util.h"

@implementation Util


+ (NSString*) getUDID {
    return [[UIDevice currentDevice] uniqueIdentifier];
}

+ (NSString*) getVersion {
    return @"100";
}

@end
