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
	/* Tile format: [Owner Type HP Damage MoveRange ActackRage SkillDamage SkillRange] */
    Board = [NSArray arrayWithObjects:@"none none 0 0 0 0 0 0",
             @"none none 0 0 0 0 0 0",
             @"none none 0 0 0 0 0 0",
             @"none none 0 0 0 0 0 0",
             @"none none 0 0 0 0 0 0",
             @"none none 0 0 0 0 0 0",
             @"none none 0 0 0 0 0 0",
             @"none none 0 0 0 0 0 0",
             @"none none 0 0 0 0 0 0",
             @"none none 0 0 0 0 0 0",
             @"none none 0 0 0 0 0 0",
             @"none none 0 0 0 0 0 0",
             @"none none 0 0 0 0 0 0",
             @"none none 0 0 0 0 0 0",
             @"none none 0 0 0 0 0 0",
             @"none none 0 0 0 0 0 0",
             nil];
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
