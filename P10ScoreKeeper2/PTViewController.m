//
//  PTViewController.m
//  P10ScoreKeeper2
//
//  Created by Kevin Ullmann on 12/29/13.
//  Copyright (c) 2013 Kevin Ullmann. All rights reserved.
//

#import "PTViewController.h"

#import "PTAddPlayerViewController.h"
#import "PTAddScoreViewController.h"
#import "PTPlayer.h"
#import "PTPlayerCell.h"

@interface PTViewController () <PTPlayerCellDelegate, UIActionSheetDelegate>

@property (nonatomic) NSMutableArray *players;
@end

@implementation PTViewController

- (void)_addTestPlayers
{
    NSInteger numPlayers = 3;
    for (NSInteger playerIdx = 0; playerIdx < numPlayers; playerIdx++) {
        PTPlayer *player = [PTPlayer new];
        player.name = [NSString stringWithFormat:@"Player %d", playerIdx];
        player.phase = 1;
        player.score = 500;
        [_players addObject:player];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.tableView.tableFooterView = [UIView new];
    _players = [NSMutableArray new];

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(_addPlayerTapped:)];
    UIBarButtonItem *newGameButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(_newGameTapped:)];
    self.navigationItem.rightBarButtonItems = @[addButton, newGameButton];
#warning remove
    [self _addTestPlayers];

}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [_players count];
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        PTPlayerCell *cell = (PTPlayerCell *)[tableView dequeueReusableCellWithIdentifier:@"playerCell"];
        cell.player = _players[indexPath.row];
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addPlayerCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
    } else {
        return 60;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section == 0;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_players removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Actions

- (void)_newGameTapped:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"New Game?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Remove All Players" otherButtonTitles:@"Reset Scores", nil];
    [actionSheet showFromBarButtonItem:sender animated:YES];
}

- (void)_addPlayerTapped:(id)sender
{
    PTAddPlayerViewController *addPlayerVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addPlayerViewController"];
    addPlayerVC.players = _players;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:addPlayerVC];
    [self presentViewController:navController animated:YES completion:nil];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        // reset scores
        for (PTPlayer *player in _players) {
            player.score = 0;
        }
    } else if (buttonIndex == 0) {
        _players = [NSMutableArray new];
    }
    [self.tableView reloadData];
}

#pragma mark - PTPlayerCellDelegate

- (void)playerCellDidTapIncrementPhaseButton:(PTPlayerCell *)cell
{
    cell.player.phase++;
    [cell setNeedsLayout];
}

- (void)playerCellDidTapAddScoreButton:(PTPlayerCell *)cell
{
    PTAddScoreViewController *addScoreVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addScoreViewController"];
    addScoreVC.player = cell.player;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:addScoreVC];
    [self presentViewController:navController animated:YES completion:nil];
}

@end
