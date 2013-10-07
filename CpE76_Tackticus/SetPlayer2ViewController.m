//
//  SetPlayer2ViewController.m
//  CpE76_Tackticus
//
//  Created by Administrator on 10/2/13.
//  Copyright (c) 2013 Line of Awesome. All rights reserved.
//

#import "SetPlayer2ViewController.h"
#import "SetPlayer1ViewController.h"

@interface SetPlayer2ViewController ()

@end

@implementation SetPlayer2ViewController
{
    NSString *Unit, *P2Units;
    int count, prev;
}
@synthesize P1Name;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    P2Units=@"";
    count = 2, prev=0;
    
    /* This code disables the next button if the count if his units is greater than 0 */
    UIBarButtonItem *button = self.navigationItem.rightBarButtonItem;
    button.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"SetP2"])
    {
        SetPlayer2ViewController *destViewController = segue.destinationViewController;
        destViewController.P2Name = _P2Name_tf.text;
        destViewController.P1Name = P1Name;
        destViewController.P1Units = P1Units;
        destViewController.P2Units = P2Units;
    }
}

- (IBAction)HideBKP:(id)sender {
    [_P2Name_tf resignFirstResponder];
}

- (IBAction)UnitType_segAction:(id)sender {
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

- (IBAction)AddUnit:(id)sender {
    int tag = [sender tag];
    int seg = _UnitType_segOutlet.selectedSegmentIndex;
    
    NSString *unit_with_index;
    
    if(seg==0){Unit = @"Mage";}
    if(seg==1){Unit = @"Knight";}
    if(seg==2){Unit = @"Scout";}
    
    if(count>0){
        if(tag==prev){
            UIAlertView *alertDialog;
            alertDialog= [[UIAlertView alloc] initWithTitle:@"Cannot Add Unit" message:@"Another Unit is already on the platform" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertDialog show];
            prev = tag;
        }
        else{
            unit_with_index = [Unit stringByAppendingFormat:@"-%d ", (tag-1)];
            count -= 1;
            P2Units = [unit_with_index stringByAppendingFormat:@"%@", P2Units];
            prev = tag;
            
            NSString *imageStr = [NSString stringWithFormat:@"white_%@.png", [Unit lowercaseString]];
            UIImage *unit_image = [UIImage imageNamed:imageStr];
            UIButton *tile_ui = (UIButton *)[self.view viewWithTag: tag];
            [tile_ui setBackgroundImage:unit_image forState:UIControlStateNormal];
            
            if(count < 1){
                UIBarButtonItem *button = self.navigationItem.rightBarButtonItem;
                button.enabled = YES;
            }
            
        }
    }
    
    else{
        UIAlertView *alertDialog2;
        alertDialog2= [[UIAlertView alloc] initWithTitle:@"Cannot Add More Units" message:@"You have reached the maximum number of units" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertDialog2 show];
    }

}
@end
