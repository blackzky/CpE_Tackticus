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

@property (strong, nonatomic) NSString *P1Name;

- (IBAction)HideBKP:(id)sender;
@end
