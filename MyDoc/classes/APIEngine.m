//
//  APIEngine.m
//  MyDoc
//
//  Created by Sudhan Raj on 19/11/12.
//  Copyright (c) 2012 MyDoc. All rights reserved.
//

#import "APIEngine.h"

#import "Init.h"

@implementation APIEngine

- (MKNetworkOperation*) onCompletion:(AppInitBlock) completionBlock
                             onError:(MKNKErrorBlock) errorBlock {
    
    MKNetworkOperation *op = [self operationWithPath:[NSString stringWithFormat:@"init/"]
                                              params:nil
                                          httpMethod:@"GET"];
    
    [op onCompletion:^(MKNetworkOperation *completedOperation)
     {
         if([completedOperation isCachedResponse]) {
             DLog(@"Data from cache %@", [completedOperation responseJSON]);
         }
         else {
             DLog(@"Data from server %@", [completedOperation responseJSON]);
         }
         
//         NSArray *jsonResponse = [completedOperation responseJSON];
         NSDictionary *response = [completedOperation responseJSON];
         Init *init = [[Init alloc] init];
//         for (NSDictionary *response in jsonResponse) {
             init.tncUrl = [response objectForKey:@"tnc_url"];
             init.supportPhone = [response objectForKey:@"support_phone"];
             init.supportEmail = [response objectForKey:@"support_email"];
//         }
         completionBlock(init);
         
     }onError:^(NSError* error) {
         errorBlock(error);
     }];
    
    [self enqueueOperation:op];
    
    return op;
}

-(MKNetworkOperation*) docName:(NSString *)name
                 docSpeciality:(NSString *)speciality
                   docLocation:(NSString *)location
                  onCompletion:(DocSearchBlock)completionBlock
                       onError:(MKNKErrorBlock)errorBlock {
    
    MKNetworkOperation *op = [self operationWithPath:[NSString stringWithFormat:@"doctors/"]
                                              params:nil
                                          httpMethod:@"GET"];
    
    [op onCompletion:^(MKNetworkOperation *completedOperation)
     {
         if([completedOperation isCachedResponse]) {
             DLog(@"Data from cache %@", [completedOperation responseJSON]);
         }
         else {
             DLog(@"Data from server %@", [completedOperation responseJSON]);
         }
         
         completionBlock(@"complete");
         
     }onError:^(NSError* error) {
         errorBlock(error);
     }];
    
    [self enqueueOperation:op];
    
    return op;
}

@end