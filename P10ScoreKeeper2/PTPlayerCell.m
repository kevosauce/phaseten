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

- (void)_updateButtonStates
{
    // 1 <= phase <= 10
    if (_player.phase >= 10) {
        self.incrementPhaseButton.enabled = NO;
        self.decrementPhaseButton.enabled = YES;
    } else if (_player.phase <= 1) {
        self.incrementPhaseButton.enabled = YES;
        self.decrementPhaseButton.enabled = NO;
    } else {
        self.incrementPhaseButton.enabled = YES;
        self.decrementPhaseButton.enabled = YES;
    }

    // 0 <= score
    if (_player.score <= 0) {
        _player.score = 0; // just enforce this
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self _updateButtonStates];
    self.scoreLabel.text = [NSString stringWithFormat:@"%@", @(_player.score)];
    self.phaseLabel.text = [NSString stringWithFormat:@"%@", @(_player.phase)];
    self.nameLabel.text = _player.name;
}

- (IBAction)incrementPhaseTapped:(id)sender {
    [self.delegate playerCellDidTapIncrementPhaseButton:self];
    [self _updateButtonStates];
}

- (IBAction)decrementPhaseTapped:(id)sender {
    [self.delegate playerCellDidTapDecrementPhaseButton:self];
    [self _updateButtonStates];
}

- (IBAction)addScoreTapped:(id)sender {
    [self.delegate playerCellDidTapAddScoreButton:self];
    [self _updateButtonStates];
}

@end
