//
//  NSArray+AAA.m
//
//  Copyright (c) 2014 Evan Moran and James Lawton. All rights reserved.
//

#import "NSArray+AAA.h"
#import "NSNumber+AAA.h"

@implementation NSArray (AAA)

- (id)aaa_first:(AAAPredicate)pred;
{
    for (id obj in self) {
        if (pred(obj)) {
            return obj;
        }
    }
    return nil;
}

- (NSArray *)aaa_all:(AAAPredicate)pred;
{
    NSMutableArray *ans = [NSMutableArray array];
    for (id obj in self) {
        if (pred(obj)) {
            [ans addObject:obj];
        }
    }
    return ans;
}

- (id)aaa_randomItem;
{
    if([self count] == 0)
        return nil;
    NSUInteger ix = [NSNumber aaa_randomIndexForCount:[self count]];
    return [self objectAtIndex:ix];
}


@end
