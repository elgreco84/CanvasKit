//
//  CKIClient+CKIPoll.m
//  CanvasKit
//
//  Created by Rick Roberts on 5/8/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

#import "CKIClient+CKIPoll.h"
#import "ReactiveCocoa.h"

@implementation CKIClient (CKIPoll)

- (RACSignal *)fetchPollsForCurrentUser
{
    NSString *path = [CKIRootContext.path stringByAppendingPathComponent:@"polls"];
    return [self fetchResponseAtPath:path parameters:nil modelClass:[CKIPoll class] context:nil];
}

- (RACSignal *)createPoll:(CKIPoll *)poll
{
    NSString *path = [CKIRootContext.path stringByAppendingPathComponent:@"polls"];
    NSDictionary *params = @{@"polls": @[
                                            @{@"question": poll.question}
                                        ]};
    return [self createModelAtPath:path parameters:params modelClass:[CKIPoll class] context:CKIRootContext];
}

- (RACSignal *)deletePoll:(CKIPoll *)poll
{
    return [self deleteObjectAtPath:poll.path modelClass:[CKIPoll class] parameters:nil context:poll];
}

@end
