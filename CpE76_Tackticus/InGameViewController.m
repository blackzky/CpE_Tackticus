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
    Tile *selected;
    
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
    MAGE = [[Unit alloc] initType:@"MAGE" hp: 5 mp: 3 bDamage: 1 sDamage: -3 moveRange: 2 atkRange: 2 skillRange: 2];
    KNIGHT = [[Unit alloc] initType:@"KNIGHT" hp: 10 mp: 2 bDamage: 2 sDamage: 3 moveRange: 1 atkRange: 2 skillRange: 2];
    SCOUT = [[Unit alloc] initType:@"SCOUT" hp: 5 mp: 1 bDamage: 3 sDamage: 5 moveRange: 2 atkRange: 2 skillRange: 2];
    
    Tile  *emptyTile = [[Tile alloc] initWithOwner:@"none" AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Board = [NSMutableArray arrayWithObjects: emptyTile, emptyTile, emptyTile,
             emptyTile, emptyTile, emptyTile, emptyTile,
             emptyTile, emptyTile, emptyTile, emptyTile,
             emptyTile, emptyTile, emptyTile, emptyTile, emptyTile, nil];
    
    /*PLAYER ONE INIT */
    p1_name = @"Player One";
    Tile  *p1_mage = [[Tile alloc] initWithOwner:p1_name AndUnit:MAGE AndCurrentHP:MAGE.baseHP AndCurrentMP:MAGE.baseMP];
    Tile  *p1_knight = [[Tile alloc] initWithOwner:p1_name AndUnit:KNIGHT AndCurrentHP:KNIGHT.baseHP AndCurrentMP:KNIGHT.baseMP];
    Tile  *p1_scout = [[Tile alloc] initWithOwner:p1_name AndUnit:SCOUT AndCurrentHP:SCOUT.baseHP AndCurrentMP:SCOUT.baseMP];
    
    [Board replaceObjectAtIndex:0 withObject:p1_mage];
    [Board replaceObjectAtIndex:2 withObject:p1_knight];
    [Board replaceObjectAtIndex:3 withObject:p1_scout];
    
    /* END PLAYER ONE */
    
    
    /*PLAYER ONE INIT */
    p2_name = @"Player Two";
    Tile  *p2_mage = [[Tile alloc] initWithOwner:p2_name AndUnit:MAGE AndCurrentHP:MAGE.baseHP AndCurrentMP:MAGE.baseMP];
    Tile  *p2_knight = [[Tile alloc] initWithOwner:p2_name AndUnit:KNIGHT AndCurrentHP:KNIGHT.baseHP AndCurrentMP:KNIGHT.baseMP];
    Tile  *p2_scout = [[Tile alloc] initWithOwner:p2_name AndUnit:SCOUT AndCurrentHP:SCOUT.baseHP AndCurrentMP:SCOUT.baseMP];
    
    [Board replaceObjectAtIndex:12 withObject:p2_mage];
    [Board replaceObjectAtIndex:14 withObject:p2_knight];
    [Board replaceObjectAtIndex:15 withObject:p2_scout];
    

    
    /* END PLAYER ONE */
    
    //updateBoard() - updates the buttons/board based on the Board array
    [self updateBoard];
}

-(NSString *)getImageStr:(Tile *)tile{
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
    if(![imageStr isEqualToString:@"grass.png" ] && ![tile.status isEqualToString:@"idle"])
        imageStr = [[tile.status lowercaseString] stringByAppendingFormat:@"_%@", imageStr];
    
    return imageStr;
}
/*
 Note: The tag of the top left tile is 1
 */
-(void) updateBoard{
    int tile_tag = 0;
    Tile *tile;
    NSString *imageStr;
    UIImage *unit_image;
    UIButton *tile_ui;
    
    int count = [Board count];
    
    for(int i = 0; i < count; i++){
        tile = [Board objectAtIndex:i];
        tile_tag = i + 1;
        imageStr = [self getImageStr:tile];
        
        unit_image = [UIImage imageNamed:imageStr];
        tile_ui = (UIButton *)[self.view viewWithTag: tile_tag];
        [tile_ui setBackgroundImage:unit_image forState:UIControlStateNormal];
    }
}

-(void)clearSelected{
    Tile *tile;
    int count = [Board count];
    for(int i = 0; i < count; i++){
        tile = [Board objectAtIndex:i];
        tile.status = @"idle";
    }
}

-(void)viewTile:(Tile *)tile{
    NSString *owner = @"", *imageStr = @"";
    int atk = 0, skill_cost = 0, mr = 0, ar = 0;
    float hp = 1, mp = 1;
    
    if(![tile.owner isEqualToString:@"none"]){
        owner = tile.owner;
        skill_cost = 1;
        atk = tile.unit.baseDamage;
        mr = tile.unit.moveRange;
        ar = tile.unit.attackRange;
        imageStr = @"icon.png";
        imageStr = [[tile.unit.type lowercaseString] stringByAppendingFormat:@"_%@", imageStr];
        hp = tile.currentHP/tile.unit.baseHP;
        mp = tile.currentMP/tile.unit.baseMP;
    }else{
        imageStr = @"blank.png";
    }
    UIImage *unit_icon = [UIImage imageNamed:imageStr];
    UIImageView *icon = (UIImageView *)[self.view viewWithTag: 100];
    [icon setImage:unit_icon];
    
    
    _curUnitOwner.text = owner;
    _curUnitAtk.text = [NSString stringWithFormat:@"%d", atk];
    _curUnitSkillCost.text = [NSString stringWithFormat:@"%d", skill_cost];
    _curUnitMR.text = [NSString stringWithFormat:@"%d", mr];
    _curUnitAR.text = [NSString stringWithFormat:@"%d", ar];
    [_curUnitHp setProgress: hp];
    [_curUnitMp setProgress: mp];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tile:(id)sender {
    NSInteger index = ([sender tag] - 1);
    Tile *cur = ((Tile *)[Board objectAtIndex:index]); //get current tile
    
    [self clearSelected];
    cur.status = @"selected";
    selected = cur;
    
    [self viewTile:selected];
    [self updateBoard];
    
    
}

- (IBAction)playerAction:(id)sender {
    
    NSInteger index = [sender selectedSegmentIndex];
    NSString *action = [sender titleForSegmentAtIndex:index];
    NSLog(@"index: %i %@", index, action);
}
@end
