//
//  calculateViewController.h
//  FractionCalculator
//
//  Created by 李鹏 on 13-7-8.
//  Copyright (c) 2013年 李鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface calculateViewController : UIViewController
@property (strong,nonatomic) IBOutlet UILabel *display;

-(void)processDigit : (int) digit;
-(void)processOp :(char) theOp;
-(void)storeFracPart;


//number keys
-(IBAction)clickDigit :(UIButton *)sender;
-(IBAction)clickPlus;
-(IBAction)clickSub;
-(IBAction)clickMult;
-(IBAction)clickDev;


//act keys
-(IBAction)clickOver;
-(IBAction)clickEqual;
-(IBAction)clickClear;

@end
