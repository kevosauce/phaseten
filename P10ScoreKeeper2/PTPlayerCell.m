//
//  PTPlayerCell.m
//  P10ScoreKeeper2
//
//  Created by Kevin Ullmann on 12/29/13.
//  Copyright (c) 2013 Kevin Ullmann. All rights reserved.
//

#import "PTPlayerCell.h"

#import "PTPlayer.h"

@implementation PTPlayerCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scoreLabel.text = [NSString stringWithFormat:@"%@", @(_player.score)];
    self.phaseLabel.text = [NSString stringWithFormat:@"%@", @(_player.phase)];
    self.nameLabel.text = _player.name;
}

- (IBAction)incrementPhaseTapped:(id)sender {
    [self.delegate playerCellDidTapIncrementPhaseButton:self];
}

- (IBAction)addScoreTapped:(id)sender {
    [self.delegate playerCellDidTapAddScoreButton:self];
}

@end
