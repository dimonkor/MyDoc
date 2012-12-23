//
//  APIEngine.h
//  MyDoc
//
//  Created by Sudhan Raj on 19/11/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import "MKNetworkEngine.h"

#import "Init.h"

@interface APIEngine : MKNetworkEngine


typedef void (^AppInitBlock) (Init *data);

- (MKNetworkOperation*) onCompletion:(AppInitBlock) completionBlock
                             onError:(MKNKErrorBlock) errorBlock;


typedef void (^DocSearchBlock) (NSArray *results);

- (MKNetworkOperation*) docName: (NSString *) name
                  docSpeciality: (NSString*) speciality
                    docLocation: (NSString*) location
                   onCompletion:(DocSearchBlock) completionBlock
                        onError:(MKNKErrorBlock) errorBlock;

@end
