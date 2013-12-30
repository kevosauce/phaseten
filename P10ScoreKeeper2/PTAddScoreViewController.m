//
//  PTAddScoreViewController.m
//  P10ScoreKeeper2
//
//  Created by Kevin Ullmann on 12/29/13.
//  Copyright (c) 2013 Kevin Ullmann. All rights reserved.
//

#import "PTAddScoreViewController.h"

#import "PTPlayer.h"

@implementation PTAddScoreViewController

- (void)viewWillAppear:(BOOL)animated
{
    [self.scoreTextField becomeFirstResponder];
}

- (IBAction)cancelTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneTapped:(id)sender {
    self.player.score += [self.scoreTextField.text integerValue];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
