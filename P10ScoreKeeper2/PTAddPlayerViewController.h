//
//  PTAddPlayerViewController.h
//  P10ScoreKeeper2
//
//  Created by Kevin Ullmann on 12/29/13.
//  Copyright (c) 2013 Kevin Ullmann. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PTAddPlayerDelegate <NSObject>

- (void)addPlayerNamed:(NSString *)name;

@end

@interface PTAddPlayerViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) id<PTAddPlayerDelegate> delegate;

@end
