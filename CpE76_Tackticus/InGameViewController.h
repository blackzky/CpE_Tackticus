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


-(void) updateBoard:(int)index;

@end
