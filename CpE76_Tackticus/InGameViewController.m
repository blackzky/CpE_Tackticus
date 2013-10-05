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
    NSString *p1_name, *p2_name;
    NSString *ACTION;
    Unit *MAGE, *KNIGHT, *SCOUT;
    
    int ROWS;
    int COLS;
    
    int SELECTED_INDEX;
    Tile *CUR_TILE;
    
    int PLAYER;
    
    BOOL AFTER_AN_ACTION;
}
@synthesize P1Name;
@synthesize P2Name;
@synthesize P1Units;
@synthesize P2Units;


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
    
    AFTER_AN_ACTION = false;
    
    p1_name = P1Name;
    p2_name = P2Name;
    
    ROWS = 4;
    COLS =4;
    int random = (arc4random() % 100);
    
    PLAYER = (random > 50) ? 1 : 2; //GENERATE RANDOM TURN (OPPOSITE PLAYER WILL BE CHOOSEN)
    [self setNextPlayer];
    ACTION = @"Move";
    
    /* INIT BASE STATS OF UNITS */
    MAGE = [[Unit alloc] initType:@"MAGE" hp: 5 mp: 3 bDamage: 1 sDamage: -3 moveRange: 2 atkRange: 2 skillRange: 2];
    KNIGHT = [[Unit alloc] initType:@"KNIGHT" hp: 10 mp: 2 bDamage: 2 sDamage: 3 moveRange: 1 atkRange: 1 skillRange: 2];
    SCOUT = [[Unit alloc] initType:@"SCOUT" hp: 5 mp: 1 bDamage: 3 sDamage: 5 moveRange: 2 atkRange: 2 skillRange: 2];
    
    Board = [[NSMutableArray alloc] init];
    for(int i = 0; i < 16; i++){
        Tile  *emptyTile = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
        [Board addObject:emptyTile];
    }
    
    /*PLAYER ONE INIT */
    NSArray *p1_units = [P1Units componentsSeparatedByString:@" "];
    NSString *p1_unit1 = [ [[p1_units objectAtIndex:0] componentsSeparatedByString:@"-"] objectAtIndex:0];
    int p1_unit1_i = [ [[[p1_units objectAtIndex:0] componentsSeparatedByString:@"-"] objectAtIndex:1] integerValue];
    NSString *p1_unit2 = [ [[p1_units objectAtIndex:1] componentsSeparatedByString:@"-"] objectAtIndex:0];
    int p1_unit2_i = [ [[[p1_units objectAtIndex:1] componentsSeparatedByString:@"-"] objectAtIndex:1] integerValue];
    
    Tile  *unit1_p1 = [self createUnit:[self getUnitUsingType:p1_unit1] withOwner:1];
    Tile  *unit2_p1 = [self createUnit:[self getUnitUsingType:p1_unit2] withOwner:1];
    
    [Board replaceObjectAtIndex:p1_unit1_i withObject:unit1_p1];
    [Board replaceObjectAtIndex:p1_unit2_i withObject:unit2_p1];
    /* END PLAYER ONE */
    
    
    /*PLAYER TWO INIT */
 
    NSArray *p2_units = [P2Units componentsSeparatedByString:@" "];
    NSString *p2_unit1 = [ [[p2_units objectAtIndex:0] componentsSeparatedByString:@"-"] objectAtIndex:0];
    int p2_unit1_i = [ [[[p2_units objectAtIndex:0] componentsSeparatedByString:@"-"] objectAtIndex:1] integerValue];
    NSString *p2_unit2 = [ [[p2_units objectAtIndex:1] componentsSeparatedByString:@"-"] objectAtIndex:0];
    int p2_unit2_i = [ [[[p2_units objectAtIndex:1] componentsSeparatedByString:@"-"] objectAtIndex:1] integerValue];
    
    Tile  *unit1_p2 = [self createUnit:[self getUnitUsingType:p2_unit1] withOwner:2];
    Tile  *unit2_p2 = [self createUnit:[self getUnitUsingType:p2_unit2] withOwner:2];
    
    [Board replaceObjectAtIndex:p2_unit1_i withObject:unit1_p2];
    [Board replaceObjectAtIndex:p2_unit2_i withObject:unit2_p2];

    /* END PLAYER TWO */
    
    [self updateBoard];
}

-(Unit *)getUnitUsingType:(NSString *)type{
    Unit *unit;
    if([type isEqualToString:@"Mage"]){
        unit = MAGE;
    }else if([type isEqualToString:@"Knight"]){
        unit = KNIGHT;
    }else if([type isEqualToString:@"Scout"]){
        unit = SCOUT;
    }
    return unit;
}

-(Tile *)createUnit:(Unit *)unit withOwner:(int)owner{
    Tile *tile = [[Tile alloc] initWithOwner:owner AndUnit:unit AndCurrentHP:unit.baseHP AndCurrentMP:unit.baseMP];
    return tile;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
/* OK */
-(NSString *)getImageStr:(Tile *)tile{
    Unit *unit = tile.unit;
    NSString *imageStr = @"";
    if(tile.owner == 1){
        if([unit.type isEqualToString:@"MAGE"]){
            imageStr = @"black_mage.png";
        }else if([unit.type isEqualToString:@"KNIGHT"]){
            imageStr = @"black_knight.png";
        }else if([unit.type isEqualToString:@"SCOUT"]){
            imageStr = @"black_scout.png";
        }else{
            imageStr = @"grass.png";
        }
    }else if(tile.owner == 2){
        if([unit.type isEqualToString:@"MAGE"]){
            imageStr = @"white_mage.png";
        }else if([unit.type isEqualToString:@"KNIGHT"]){
            imageStr = @"white_knight.png";
        }else if([unit.type isEqualToString:@"SCOUT"]){
            imageStr = @"white_scout.png";
        }else{
            imageStr = @"grass.png";
        }
    }else{
        imageStr = @"grass.png";
    }
    if(![imageStr isEqualToString:@"grass.png" ] && ![tile.status isEqualToString:@"idle"]){
        imageStr = [[tile.status lowercaseString] stringByAppendingFormat:@"_%@", imageStr];
    }else if([imageStr isEqualToString:@"grass.png" ]  && [tile.status isEqualToString:@"highlighted"]){
        imageStr = [[tile.status lowercaseString] stringByAppendingFormat:@"_%@", imageStr];
    }
    return imageStr;
}
/* Note: The tag of the top left tile is 1 */
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
-(NSString *)getAlliedColor{
    return PLAYER == 1 ? @"BLACK" : @"WHITE";
}

-(void)setNextPlayer{
    PLAYER = (PLAYER == 1) ? 2 : 1;
    NSString *owner = [self getOwner:PLAYER];
    NSString *allies = [self getAlliedColor];
    _cur_player.text = [NSString stringWithFormat:@"Player: %@ [%@]", owner, allies];
    
    NSString *msg =[NSString stringWithFormat:@"%@'s turn\nThe color of your units is %@", owner, allies];
    [_playerAction setSelectedSegmentIndex:0];
    ACTION = @"Move";
    
    UIAlertView *alertDialog;
    alertDialog= [[UIAlertView alloc] initWithTitle:@"Current Player"
                                           message:msg
                                          delegate:nil
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles: nil];
    [alertDialog show];
}
-(int)getRow:(int)index{
    return (index / ROWS);
}
-(int)getCol:(int)index{
    return (index % COLS);
}
-(int)getIndexWithRow:(int)row andCol:(int)col{
    return ( (row * ROWS) + col );
}

/* OK */
-(NSMutableArray *)getAdjTilesbyRange:(int)range andIndex:(int)index{
    NSMutableArray *adj_tiles = [[NSMutableArray alloc] init];
    
    int col = [self getCol:index];
    int row = [self getRow:index];
    int sc = (col - range) >= 0 ? (col - range) : 0;
    int sr = (row - range) >= 0 ? (row - range) : 0;
    //int ec = (col + range) < COLS ? (col + range) : COLS;
    //int er = (row + range) < ROWS ? (row + range) : ROWS;
    
    NSString *str_index;
    int temp, tile_index;
    bool add1 = false, add2 = false;
    
    for(int r = sr; r < ROWS; r++){
        for(int c = sc; c < COLS; c++){
            if(c == col){
                temp = abs(row - r);
                if(temp <= range){      add1 = true;}
            }else if(c != col){
                temp = abs(row - r);
                if(temp <= (range-1)){  add1 = true;}
            }
            
            if(r == row){
                temp = abs(col - c);
                if(temp <= range){      add2 = true;}
            }else if(r != row){
                temp = abs(col - c);
                if(temp <= (range-1)){  add2 = true;}
            }

            if(add1 && add2){
                tile_index = [self getIndexWithRow:r andCol:c];
                if(tile_index != index){
                    str_index = [NSString stringWithFormat:@"%d", tile_index];
                    [adj_tiles addObject: str_index];
                }
            }
            add1=false;
            add2=false;
        }
    }

    return adj_tiles;
    
}

-(void)highlightAdjacent{
    if(CUR_TILE.owner == PLAYER){
        NSMutableArray *tiles;
        if([ACTION isEqualToString:@"Move"]){
            tiles = [self getAdjTilesbyRange:CUR_TILE.unit.moveRange andIndex:SELECTED_INDEX];
        }else if([ACTION isEqualToString:@"Attack"]){
            tiles = [self getAdjTilesbyRange:CUR_TILE.unit.attackRange andIndex:SELECTED_INDEX];
        }else if([ACTION isEqualToString:@"Skill"]){
            tiles = [self getAdjTilesbyRange:CUR_TILE.unit.skillRange andIndex:SELECTED_INDEX];
        }
        
        int tile_count = [tiles count], adj_index;
        Tile *tile;
        
        for(int i = 0; i < tile_count; i++){
            adj_index = [[tiles objectAtIndex:i] integerValue];
            tile = [Board objectAtIndex:adj_index];
            
            if([ACTION isEqualToString:@"Move"]  && tile.unit == NULL){
                tile.status = @"highlighted";
            }else if([ACTION isEqualToString:@"Attack"] && tile.unit != NULL){
                tile.status = @"highlighted";
            }else if([ACTION isEqualToString:@"Skill"] && tile.unit != NULL){
                tile.status = @"highlighted";
            }
        }
    }
}

-(BOOL)gameOver{
    BOOL gameover = false;
    int count = [Board count];
    Tile *tile;
    int p1_units_count = 0;
    int p2_units_count = 0;
    for(int i = 0; i < count; i++){
        tile = [Board objectAtIndex:i];
        if(tile.owner == 1){
            p1_units_count++;
        }else if(tile.owner == 2){
            p2_units_count++;
        }
    }
    if(p1_units_count == 0 || p2_units_count == 0){
        gameover = true;
    }
    
    return gameover;
}

-(void)moveCurTileTo:(Tile *)tile withIndex:(int)index{
    [Board replaceObjectAtIndex:SELECTED_INDEX withObject:tile];
    [Board replaceObjectAtIndex:index withObject:CUR_TILE];
    SELECTED_INDEX = index;
}

-(void)attackTile:(Tile *)tile inIndex:(int)index{
    tile.currentHP = tile.currentHP - CUR_TILE.unit.baseDamage;
    if(tile.currentHP <= 0){
        Tile  *emptyTile = [[Tile alloc] initWithOwner:0 AndUnit:nil AndCurrentHP:0 AndCurrentMP:0];
        [Board replaceObjectAtIndex:index withObject:emptyTile];
    }
}

-(void)useSkillOnTile:(Tile *)tile{
    tile.currentHP = tile.currentHP - CUR_TILE.unit.skillDamage;
}


/* OK */
-(void)viewTileInfo:(Tile *)tile{
    NSString *owner = @"", *imageStr = @"";
    int atk = 0, skill_cost = 0, mr = 0, ar = 0;
    float hp = 1.0, mp = 1.0;
    
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
/* ok */
-(void)selectTile:(Tile *)tile andIndex:(int)index{
    [self clearSelected];
    tile.status = @"selected";
    CUR_TILE = tile;
    SELECTED_INDEX = index;
    [self viewTileInfo:tile];
    
    if(CUR_TILE.unit == NULL){
        [_playerAction setSelectedSegmentIndex:0];
        ACTION = @"Move";
    }else{
        [self highlightAdjacent];
    }
}
/* OK */
- (IBAction)tile:(id)sender {
    NSInteger index = ([sender tag] - 1);
    Tile *tile = ((Tile *)[Board objectAtIndex:index]);
    
    if([tile.status isEqualToString:@"highlighted"]){
        if([ACTION isEqualToString:@"Move"]){
            [self moveCurTileTo: tile withIndex: index];
        }else if([ACTION isEqualToString:@"Attack"]){
            [self attackTile: tile inIndex:index];
            tile = NULL;
        }if([ACTION isEqualToString:@"Skill"]){
            [self useSkillOnTile:tile];
        }
        [self clearSelected];
        
        if([self gameOver]){
            UIAlertView *alertDialog;
            NSString *msg =[NSString stringWithFormat:@"%@ won the game!", [self getOwner:PLAYER]];
            alertDialog= [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
            [alertDialog show];
            
            //DO SOMETHING AFTER GAME OVER
            
            //UIViewController *menu = [self.storyboard instantiateViewControllerWithIdentifier:@"menu"];
            //[self presentViewController:menu animated:YES completion:NULL];
        }else{
            [self setNextPlayer];
        }
        AFTER_AN_ACTION = true;
    }else{
        [self selectTile:tile andIndex: index];
        AFTER_AN_ACTION = false;
    }
    
    [self updateBoard];
}
/* OK */
- (IBAction)playerAction:(id)sender {
    NSInteger index = [sender selectedSegmentIndex];
    ACTION = [sender titleForSegmentAtIndex:index];
    
    if(CUR_TILE.unit != NULL){
        [self clearSelected];
        [self highlightAdjacent];
        if(!AFTER_AN_ACTION) CUR_TILE.status = @"selected";
        [self updateBoard];
    }
}
@end
