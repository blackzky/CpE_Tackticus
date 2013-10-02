//
//  InGameViewController.m
//  CpE76_Tackticus
//
//  Created by Administrator on 9/21/13.
//  Copyright (c) 2013 Line of Awesome. All rights reserved.
//

#import "InGameViewController.h"
#import "SetPlayer2ViewController.h"

@interface InGameViewController ()

@end

@implementation InGameViewController
{
    NSMutableArray *Board;
    Unit *MAGE, *KNIGHT, *SCOUT;
    int SELECTED;
    NSString *ACTION;
    int PLAYER;
    
    NSString *p1_name, *p2_name;
}
@synthesize P1Name;
@synthesize P2Name;


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
    
    
    p1_name = P1Name;
    p2_name = P2Name;
    
    PLAYER = 1;//set player 1 as first;
    ACTION = @"Move";
    
    /* INIT BASE STATS OF UNITS */
    MAGE = [[Unit alloc] initType:@"MAGE" hp: 5 mp: 3 bDamage: 1 sDamage: -3 moveRange: 2 atkRange: 2 skillRange: 2];
    KNIGHT = [[Unit alloc] initType:@"KNIGHT" hp: 10 mp: 2 bDamage: 2 sDamage: 3 moveRange: 1 atkRange: 2 skillRange: 2];
    SCOUT = [[Unit alloc] initType:@"SCOUT" hp: 5 mp: 1 bDamage: 3 sDamage: 5 moveRange: 2 atkRange: 2 skillRange: 2];
    
    Tile  *emptyTile1 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Tile  *emptyTile2 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Tile  *emptyTile3 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Tile  *emptyTile4 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Tile  *emptyTile5 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Tile  *emptyTile6 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Tile  *emptyTile7 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Tile  *emptyTile8 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Tile  *emptyTile9 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Tile  *emptyTile10 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Tile  *emptyTile11 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Tile  *emptyTile12 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Tile  *emptyTile13 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Tile  *emptyTile14 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Tile  *emptyTile15 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    Tile  *emptyTile16 = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
    
    
    Board = [NSMutableArray arrayWithObjects: emptyTile1, emptyTile2, emptyTile3,
             emptyTile4, emptyTile5, emptyTile6, emptyTile7,
             emptyTile8, emptyTile9, emptyTile10, emptyTile11,
             emptyTile12, emptyTile13, emptyTile14, emptyTile15, emptyTile16, nil];
    
    /*PLAYER ONE INIT */
    
    Tile  *p1_mage = [[Tile alloc] initWithOwner:1 AndUnit:MAGE AndCurrentHP:MAGE.baseHP AndCurrentMP:MAGE.baseMP];
    Tile  *p1_knight = [[Tile alloc] initWithOwner:1 AndUnit:KNIGHT AndCurrentHP:KNIGHT.baseHP AndCurrentMP:KNIGHT.baseMP];
    Tile  *p1_scout = [[Tile alloc] initWithOwner:1 AndUnit:SCOUT AndCurrentHP:SCOUT.baseHP AndCurrentMP:SCOUT.baseMP];
    
    [Board replaceObjectAtIndex:0 withObject:p1_mage];
    [Board replaceObjectAtIndex:2 withObject:p1_knight];
    [Board replaceObjectAtIndex:3 withObject:p1_scout];
    
    /* END PLAYER ONE */
    
    
    /*PLAYER ONE INIT */
    
    Tile  *p2_mage = [[Tile alloc] initWithOwner:2 AndUnit:MAGE AndCurrentHP:MAGE.baseHP AndCurrentMP:MAGE.baseMP];
    Tile  *p2_knight = [[Tile alloc] initWithOwner:2 AndUnit:KNIGHT AndCurrentHP:KNIGHT.baseHP AndCurrentMP:KNIGHT.baseMP];
    Tile  *p2_scout = [[Tile alloc] initWithOwner:2 AndUnit:SCOUT AndCurrentHP:SCOUT.baseHP AndCurrentMP:SCOUT.baseMP];
    
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
    if(tile.owner == 1){
        if([unit.type isEqualToString:@"MAGE"]){
            imageStr = @"black_mage.png";
        }else if([unit.type isEqualToString:@"KNIGHT"]){
            imageStr = @"black_knight.png";
        }else if([unit.type isEqualToString:@"SCOUT"]){
            imageStr = @"black_archer.png";
        }else{
            imageStr = @"grass.png";
        }
    }else if(tile.owner == 2){
        if([unit.type isEqualToString:@"MAGE"]){
            imageStr = @"white_mage.png";
        }else if([unit.type isEqualToString:@"KNIGHT"]){
            imageStr = @"white_knight.png";
        }else if([unit.type isEqualToString:@"SCOUT"]){
            imageStr = @"white_archer.png";
        }else{
            imageStr = @"grass.png";
        }
    }else{
        imageStr = @"grass.png";
    }
    if(![imageStr isEqualToString:@"grass.png" ] && ![tile.status isEqualToString:@"idle"]){
        imageStr = [[tile.status lowercaseString] stringByAppendingFormat:@"_%@", imageStr];
    }else if([imageStr isEqualToString:@"grass.png" ]  && [tile.status isEqualToString:@"highlighted"]){
        imageStr = [[tile.status lowercaseString] stringByAppendingFormat:@"%d_%@", PLAYER, imageStr];
    }
        
    
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
-(NSString *)getOwner:(int)owner{
    if(owner == 1){
        return p1_name;
    }else if(owner == 2){
        return p2_name;
    }else{
        return @"none";
    }
}

-(void)viewTile:(Tile *)tile{
    NSString *owner = @"", *imageStr = @"";
    int atk = 0, skill_cost = 0, mr = 0, ar = 0;
    float hp = 1, mp = 1;
    
    if(tile.owner != 0){
        owner = [self getOwner:tile.owner];
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

-(void)highlightAdjacent{
    int ROWS = 4; int COLS = 4;
    int index = SELECTED;
    
    Tile *tile;
    //UIButton *tile_ui = (UIButton *)[self.view viewWithTag: (index + 1)];
    
    int range = 1;//tile.unit.moveRange;
    int row = index / ROWS;
    int col = index % COLS;
    
    int sr = row - range;
    int sc = col - range;
    
    int er = row + range;
    int ec = col + range;
    
    //NSLog(@"index: %d, c: %d, r: %d, s: %d, e: %d", index, col, row);
    int i = 0;

    for(int r = sr; r <= er; r++){
        for(int c = sc; c <= ec; c++){
            i = (r * ROWS) + c;
            if(i >= 0 && i < 16){
                if(i != index){
                    tile = [Board objectAtIndex:i];
                    
                    if([ACTION isEqualToString:@"Move"]  && tile.unit == NULL){
                        tile.status = @"highlighted";
                        //highligth the grass only
                    }else if([ACTION isEqualToString:@"Attack"] && tile.unit != NULL){
                        //highlight the enemy only
                        tile.status = @"highlighted";
                    }else if([ACTION isEqualToString:@"Akill"] && tile.unit != NULL){
                        //highlight the enemy only
                        tile.status = @"highlighted";
                    }
                    
                }
            }
        }
    }
    
    
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
    SELECTED = index;
    
    
    [self viewTile:cur];
    if(cur.unit != NULL){
        [self highlightAdjacent];
    }
    
    
    [self updateBoard];
    
    
}

- (IBAction)playerAction:(id)sender {
    
    NSInteger index = [sender selectedSegmentIndex];
    ACTION = [sender titleForSegmentAtIndex:index];
}
@end
