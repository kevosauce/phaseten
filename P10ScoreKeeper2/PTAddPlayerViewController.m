//
//  PTAddPlayerViewController.m
//  P10ScoreKeeper2
//
//  Created by Kevin Ullmann on 12/29/13.
//  Copyright (c) 2013 Kevin Ullmann. All rights reserved.
//

#import "PTAddPlayerViewController.h"

#import "PTPlayer.h"

@interface PTAddPlayerViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation PTAddPlayerViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.nameTextField becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([self.nameTextField.text length]) {
        PTPlayer *player = [PTPlayer new];
        player.name = self.nameTextField.text;
        [_players addObject:player];
        [self dismissViewControllerAnimated:YES completion:nil];
        return YES;
    }
    return NO;
}

@end
