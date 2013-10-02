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
@synthesize P1Name;


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
    if([segue.identifier isEqualToString:@"SetP2"])
    {
        SetPlayer2ViewController *destViewController = segue.destinationViewController;
        destViewController.P2Name = _P2Name_tf.text;
        destViewController.P1Name = P1Name;
    }
}

- (IBAction)HideBKP:(id)sender {
    [_P2Name_tf resignFirstResponder];
}
@end
