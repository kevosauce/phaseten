//
//  PTPlayer.h
//  P10ScoreKeeper2
//
//  Created by Kevin Ullmann on 12/29/13.
//  Copyright (c) 2013 Kevin Ullmann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTPlayer : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSUInteger phase;
@property (nonatomic) NSUInteger score;

- (instancetype)initWithName:(NSString *)name;

@end
