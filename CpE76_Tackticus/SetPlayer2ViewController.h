//
//  SetPlayer2ViewController.h
//  CpE76_Tackticus
//
//  Created by Administrator on 10/2/13.
//  Copyright (c) 2013 Line of Awesome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetPlayer2ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *P2Name_tf;
@property (strong, nonatomic) IBOutlet UITextView *UnitDescription_tv;
@property (strong, nonatomic) IBOutlet UISegmentedControl *UnitType_segOutlet;


@property (strong, nonatomic) NSString *P1Name;
@property (strong, nonatomic) NSString *P2Name;

- (IBAction)HideBKP:(id)sender;
- (IBAction)UnitType_segAction:(id)sender;

@end
