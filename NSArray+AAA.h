//
//  NSArray+AAA.h
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^AAAPredicate)(id);

@interface NSArray (AAA)

- (id)aaa_first:(AAAPredicate)pred;

- (NSArray *)aaa_all:(AAAPredicate)pred;

- (id)aaa_randomItem;

@end
