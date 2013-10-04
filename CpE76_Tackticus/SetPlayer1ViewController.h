//
//  SetPlayer1ViewController.h
//  CpE76_Tackticus
//
//  Created by Administrator on 10/2/13.
//  Copyright (c) 2013 Line of Awesome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetPlayer1ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *P1Name_tf;
@property (strong, nonatomic) IBOutlet UITextView *UnitDescription_tv;
@property (strong, nonatomic) IBOutlet UISegmentedControl *UnitType_segOutlet;

- (IBAction)HideBKP:(id)sender;
- (IBAction)UnitType_segAction:(id)sender;
- (IBAction)AddUnit:(id)sender;


@end
