//
//  PTAddScoreViewController.h
//  P10ScoreKeeper2
//
//  Created by Kevin Ullmann on 12/29/13.
//  Copyright (c) 2013 Kevin Ullmann. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PTPlayer;

@interface PTAddScoreViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *scoreTextField;

@property (nonatomic) PTPlayer *player;

@end
