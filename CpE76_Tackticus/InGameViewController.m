//
//  InGameViewController.m
//  CpE76_Tackticus
//
//  Created by Administrator on 9/21/13.
//  Copyright (c) 2013 Line of Awesome. All rights reserved.
//

#import "InGameViewController.h"

@interface InGameViewController ()

@end

@implementation InGameViewController{
    NSArray *Board;
    Unit *MAGE, *KNIGHT, *SCOUT;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/* This function is always called when the user goes to the InGame scene */
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.navigationItem.hidesBackButton = YES;
    
    /* INIT BASE STATS OF UNITS */
    MAGE = [[Unit alloc] initType:@"mage" hp: 5 bDamage: 1 sDamage: -3 moveRange: 2 atkRange: 2 skillRange: 2];
    KNIGHT = [[Unit alloc] initType:@"knight" hp: 10 bDamage: 2 sDamage: 3 moveRange: 1 atkRange: 2 skillRange: 2];
    SCOUT = [[Unit alloc] initType:@"scout" hp: 5 bDamage: 3 sDamage: 5 moveRange: 2 atkRange: 2 skillRange: 2];
    
    Tile  *emptyTile = [[Tile alloc] initWithOwner:@"none" AndUnit:nil AndCurrentHP:0];
    Board = [NSArray arrayWithObjects: emptyTile, emptyTile, emptyTile,
             emptyTile, emptyTile, emptyTile, emptyTile,
             emptyTile, emptyTile, emptyTile, emptyTile,
             emptyTile, emptyTile, emptyTile, emptyTile, emptyTile, nil];
    
    //load the position of each unit of a player here.. (change Board data)
    //updateBoard() - updates the buttons/board based on the Board array
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tile:(id)sender {
    NSInteger tag = [sender tag];
    NSLog(@"tile: %i", tag);
}

- (IBAction)playerAction:(id)sender {
    
    NSInteger index = [sender selectedSegmentIndex];
    NSString *action = [sender titleForSegmentAtIndex:index];;
    NSLog(@"index: %i %@", index, action);
}
@end
