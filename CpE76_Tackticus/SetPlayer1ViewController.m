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

- (IBAction)HideBKP:(id)sender {
    [_P1Name_tf resignFirstResponder];
}
@end
