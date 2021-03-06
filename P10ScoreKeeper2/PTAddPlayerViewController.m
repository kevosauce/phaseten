//
//  PTAddPlayerViewController.m
//  P10ScoreKeeper2
//
//  Created by Kevin Ullmann on 12/29/13.
//  Copyright (c) 2013 Kevin Ullmann. All rights reserved.
//

#import "PTAddPlayerViewController.h"

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
        [self _addPlayer];
        [self dismissViewControllerAnimated:YES completion:nil];
        return YES;
    }
    return NO;
}

- (void)_addPlayer
{
    [self.delegate addPlayerNamed:self.nameTextField.text];
}

- (IBAction)cancelTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addTapped:(id)sender
{
    [self _addPlayer];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
