//
//  PTPlayerCell.h
//  P10ScoreKeeper2
//
//  Created by Kevin Ullmann on 12/29/13.
//  Copyright (c) 2013 Kevin Ullmann. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PTPlayer;
@class PTPlayerCell;

@protocol PTPlayerCellDelegate <NSObject>

- (void)playerCellDidTapAddScoreButton:(PTPlayerCell *)cell;
- (void)playerCellDidTapIncrementPhaseButton:(PTPlayerCell *)cell;
- (void)playerCellDidTapDecrementPhaseButton:(PTPlayerCell *)cell;

- (void)playerCellDidTapNameLabel:(PTPlayerCell *)cell;
- (void)playerCellDidTapPhaseLabel:(PTPlayerCell *)cell;
- (void)playerCellDidTapScoreLabel:(PTPlayerCell *)cell;

@end

@interface PTPlayerCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phaseLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *decrementPhaseButton;
@property (weak, nonatomic) IBOutlet UIButton *incrementPhaseButton;

@property (nonatomic) PTPlayer *player;
@property (nonatomic, weak) IBOutlet id<PTPlayerCellDelegate> delegate;

@end