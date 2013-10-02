//
//  SetPlayer1ViewController.m
//  CpE76_Tackticus
//
//  Created by Administrator on 10/2/13.
//  Copyright (c) 2013 Line of Awesome. All rights reserved.
// 

#import "SetPlayer1ViewController.h"
#import "SetPlayer2ViewController.h"

@interface SetPlayer1ViewController ()

@end

@implementation SetPlayer1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"SetP1"])
    {
        SetPlayer2ViewController *destViewController = segue.destinationViewController;
        destViewController.P1Name = _P1Name_tf.text;
    }
}

- (IBAction)HideBKP:(id)sender
{
    [_P1Name_tf resignFirstResponder];
}

- (IBAction)UnitType_segAction:(id)sender
{
    int seg = _UnitType_segOutlet.selectedSegmentIndex;

    if(seg==0){
        _UnitDescription_tv.text=[NSString stringWithFormat:@"The Mage is a spellcaster that masters the dark arts, their power can either bring chaos or harmony."];
    }
    if(seg==1){
        _UnitDescription_tv.text=[NSString stringWithFormat:@"The Knight practices the way of the sword and with its armour that grants them more vitality."];
    }
    if(seg==2){
        _UnitDescription_tv.text=[NSString stringWithFormat:@"The Archer, with elvish eyes, grants them sight beyond sight and accuracy which tagets the enemies vital points."];
    }
    
}
@end
