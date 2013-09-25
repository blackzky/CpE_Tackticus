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
    NSMutableArray *Board;
    Unit *MAGE, *KNIGHT, *SCOUT;
    
    NSString *p1_name, *p2_name;
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
    MAGE = [[Unit alloc] initType:@"MAGE" hp: 5 bDamage: 1 sDamage: -3 moveRange: 2 atkRange: 2 skillRange: 2];
    KNIGHT = [[Unit alloc] initType:@"KNIGHT" hp: 10 bDamage: 2 sDamage: 3 moveRange: 1 atkRange: 2 skillRange: 2];
    SCOUT = [[Unit alloc] initType:@"SCOUT" hp: 5 bDamage: 3 sDamage: 5 moveRange: 2 atkRange: 2 skillRange: 2];
    
    Tile  *emptyTile = [[Tile alloc] initWithOwner:@"none" AndUnit:nil AndCurrentHP:0];
    Board = [NSMutableArray arrayWithObjects: emptyTile, emptyTile, emptyTile,
             emptyTile, emptyTile, emptyTile, emptyTile,
             emptyTile, emptyTile, emptyTile, emptyTile,
             emptyTile, emptyTile, emptyTile, emptyTile, emptyTile, nil];
    
    /*PLAYER ONE INIT */
    p1_name = @"Player One";
    Tile  *p1_mage = [[Tile alloc] initWithOwner:p1_name AndUnit:MAGE AndCurrentHP:MAGE.baseHP];
    Tile  *p1_knight = [[Tile alloc] initWithOwner:p1_name AndUnit:KNIGHT AndCurrentHP:KNIGHT.baseHP];
    Tile  *p1_scout = [[Tile alloc] initWithOwner:p1_name AndUnit:SCOUT AndCurrentHP:SCOUT.baseHP];
    
    [Board replaceObjectAtIndex:0 withObject:p1_mage];
    [Board replaceObjectAtIndex:2 withObject:p1_knight];
    [Board replaceObjectAtIndex:3 withObject:p1_scout];
    
    [self updateBoard:0];
    [self updateBoard:2];
    [self updateBoard:3];
    /* END PLAYER ONE */
    
    
    /*PLAYER ONE INIT */
    p2_name = @"Player Two";
    Tile  *p2_mage = [[Tile alloc] initWithOwner:p2_name AndUnit:MAGE AndCurrentHP:MAGE.baseHP];
    Tile  *p2_knight = [[Tile alloc] initWithOwner:p2_name AndUnit:KNIGHT AndCurrentHP:KNIGHT.baseHP];
    Tile  *p2_scout = [[Tile alloc] initWithOwner:p2_name AndUnit:SCOUT AndCurrentHP:SCOUT.baseHP];
    
    [Board replaceObjectAtIndex:12 withObject:p2_mage];
    [Board replaceObjectAtIndex:14 withObject:p2_knight];
    [Board replaceObjectAtIndex:15 withObject:p2_scout];
    
    [self updateBoard:12];
    [self updateBoard:14];
    [self updateBoard:15];
    /* END PLAYER ONE */
    
    //load the position of each unit of a player here.. (change Board data)
    //updateBoard() - updates the buttons/board based on the Board array
}
/*
 Note: The tag of the top left tile is 1
 */
-(void) updateBoard:(int)index{
    //@TODO: based image from board (Loop the contents of the board)
    int tile_tag = index + 1;
    Tile *tile = [Board objectAtIndex:index];
    Unit *unit = tile.unit;
    NSString *imageStr = @"";
    
    if([tile.owner isEqualToString:p1_name]){
        if([unit.type isEqualToString:@"MAGE"]){
            imageStr = @"black_mage.png";
        }else if([unit.type isEqualToString:@"KNIGHT"]){
            imageStr = @"black_knight.png";
        }else if([unit.type isEqualToString:@"SCOUT"]){
            imageStr = @"black_archer.png";
        }else{
            imageStr = @"grass.png";
        }
    }else{
        if([unit.type isEqualToString:@"MAGE"]){
            imageStr = @"white_mage.png";
        }else if([unit.type isEqualToString:@"KNIGHT"]){
            imageStr = @"white_knight.png";
        }else if([unit.type isEqualToString:@"SCOUT"]){
            imageStr = @"white_archer.png";
        }else{
            imageStr = @"grass.png";
        }
    }
    
    UIImage *unit_image = [UIImage imageNamed:imageStr];
    UIButton *tile_ui = (UIButton *)[self.view viewWithTag: tile_tag];
    [tile_ui setBackgroundImage:unit_image forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tile:(id)sender {
    NSInteger tag = ([sender tag] - 1);
    Tile *cur = ((Tile *)[Board objectAtIndex:tag]); //get current tile
    
    NSLog(@"tile: %i %@", tag, cur.owner);
}

- (IBAction)playerAction:(id)sender {
    
    NSInteger index = [sender selectedSegmentIndex];
    NSString *action = [sender titleForSegmentAtIndex:index];
    NSLog(@"index: %i %@", index, action);
}
@end
