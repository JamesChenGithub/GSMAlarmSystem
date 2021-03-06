//
//  NSObject+KVOCategory.m
//  iLunch
//
//  Created by James on 5/16/14.
//  Copyright (c) 2014 James. All rights reserved.
//

#import "NSObject+KVOCategory.h"

@implementation NSObject (KVOCategory)

- (void)observedBy:(NSObject *)observer forKeyPaths:(NSArray *)keyPaths
{
    [self observedBy:observer forKeyPaths:keyPaths options:NSKeyValueObservingOptionNew];
}

- (void)observedBy:(NSObject *)observer forKeyPaths:(NSArray *)keyPaths options:(NSKeyValueObservingOptions)options
{
    if (observer)
    {
        for (NSString *keyPath in keyPaths)
        {
            [self addObserver:observer forKeyPath:keyPath options:options context:nil];
        }
    }
}

- (void)cancelObservedBy:(NSObject *)observer forKeyPaths:(NSArray *)keyPaths
{
    if (observer)
    {
        for (NSString *keyPath in keyPaths)
        {
            [self removeObserver:observer forKeyPath:keyPath];
        }
    }
}

@end
