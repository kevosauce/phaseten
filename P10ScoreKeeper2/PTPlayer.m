//
//  PTPlayer.m
//  P10ScoreKeeper2
//
//  Created by Kevin Ullmann on 12/29/13.
//  Copyright (c) 2013 Kevin Ullmann. All rights reserved.
//

#import "PTPlayer.h"

@implementation PTPlayer

- (instancetype)initWithName:(NSString *)name
{
    if (self = [super init]) {
        self.name = name;
        self.phase = 1;
        self.score = 0;
    }
    return self;
}

@end
