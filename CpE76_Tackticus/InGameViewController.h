//
//  InGameViewController.h
//  CpE76_Tackticus
//
//  Created by Administrator on 9/21/13.
//  Copyright (c) 2013 Line of Awesome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tile.h"
#import "Unit.h"

@interface InGameViewController : UIViewController
- (IBAction)tile:(id)sender;
- (IBAction)playerAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *tileOutlet;

@property (strong, nonatomic) IBOutlet UILabel *curUnitOwner;
@property (strong, nonatomic) IBOutlet UIImageView *curUnitType;
@property (strong, nonatomic) IBOutlet UIProgressView *curUnitHp;
@property (strong, nonatomic) IBOutlet UIProgressView *curUnitMp;
@property (strong, nonatomic) IBOutlet UILabel *curUnitAtk;
@property (strong, nonatomic) IBOutlet UILabel *curUnitMR;
@property (strong, nonatomic) IBOutlet UILabel *curUnitAR;
@property (strong, nonatomic) IBOutlet UILabel *curUnitSkillCost;
@property (strong, nonatomic) IBOutlet UILabel *cur_player;


-(void)clearSelected;
-(void) updateBoard;
-(NSString *)getImageStr:(Tile *)tile;
-(void)viewTileInfo:(Tile *)tile;
-(void)highlightAdjacent;
-(NSString *)getOwner:(int)owner;
-(NSString *)getAlliedColor;

-(void)moveCurTileTo:(Tile *)tile withIndex:(int)index;
-(void)attackTile:(Tile *)tile;
-(void)useSkillOnTile:(Tile *)tile;
-(void)selectTile:(Tile *)tile andIndex:(int)index;

-(void)setNextPlayer;
-(int)getRow:(int)index;
-(int)getCol:(int)index;
-(int)getIndexWithRow:(int)row andCol:(int)col;
    
@property (strong, nonatomic) NSString *P1Name;
@property (strong, nonatomic) NSString *P2Name;

@end
