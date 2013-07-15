//
//  calculateViewController.m
//  FractionCalculator
//
//  Created by 李鹏 on 13-7-8.
//  Copyright (c) 2013年 李鹏. All rights reserved.
//

#import "calculateViewController.h"
#import "Calculator.h"

@interface calculateViewController ()

@end

@implementation calculateViewController
{
    int currentnumber;
    char op;
    BOOL isfirstoprend,isnumberator;
    Calculator * myCalculator;
    NSMutableString * displaystring;
    
}
@synthesize display = _display;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    isfirstoprend = YES;
    isnumberator = YES;
    myCalculator = [[Calculator alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)processDigit : (int) digit
{
    //构建可被计算的数字整型
    currentnumber = currentnumber * 10 + digit;
    NSLog(@"%i",currentnumber);
    
    //构建可供显示的数字字符
    [displaystring stringByAppendingString:[NSString stringWithFormat:@"%i",digit]];
    _display.text = displaystring;
    
    
}

//让计算符号显示正常
-(void)processOp :(char) theOp
{
    NSString * opStr;
    
    op = theOp;
    switch (theOp) {
        case '+':
            opStr = @"+";
            break;
        case '-':
            opStr = @"-";
            break;
        case '*':
            opStr = @"*";
            break;
        case '/':
            opStr = @"/";
            break;
        default:
            break;
    }
    [self storeFracPart];
    isfirstoprend = NO;
    isnumberator = YES;
    
    [displaystring stringByAppendingString:opStr];
    _display.text = displaystring;
}

//构建分数
-(void)storeFracPart
{
    if (isfirstoprend) {
        if (isnumberator) {
            myCalculator.operand1.numberator = currentnumber;
            myCalculator.operand2.denominator = 1;
            
        }
        else
        {
            myCalculator.operand1.denominator = currentnumber;
        }
    }
    else
    {
        if (isnumberator) {
            myCalculator.operand2.numberator = currentnumber;
            myCalculator.operand2.denominator = 1;
        }
    else
    {
        myCalculator.operand2.denominator = currentnumber;
        isfirstoprend = YES;
    }
        }
}


//number keys
-(IBAction)clickDigit :(UIButton *)sender
{
    int digit = sender.tag;
    [self processDigit:digit];
    
}
-(IBAction)clickPlus
{
    [self processOp:'+'];
}
-(IBAction)clickSub
{
    [self processOp:'-'];   
}
-(IBAction)clickMult
{
    [self processOp:'*'];
}
-(IBAction)clickDev
{
    [self processOp:'/'];
}


//act keys
-(IBAction)clickOver
{
    [self storeFracPart];
    isnumberator = NO;
    [displaystring stringByAppendingString:@"/"];
    
    _display.text = displaystring;
    
}
-(IBAction)clickEqual
{
    if (isfirstoprend == NO) {
        [self storeFracPart];
        [myCalculator performOperation : op];
        
        [displaystring stringByAppendingString:@"="];
        [displaystring stringByAppendingString:[myCalculator.accumulator conventToString]];
        
        _display.text = displaystring;
        
        
        
        currentnumber = 0;
        isfirstoprend = YES;
        isnumberator = YES;
        [displaystring setString:@""];
    }
}
-(IBAction)clickClear
{
    isnumberator = YES;
    isfirstoprend = YES;
    currentnumber = 0;
    [myCalculator clear];
    
    [displaystring setString:@""];
    _display.text = displaystring;
}

@end
