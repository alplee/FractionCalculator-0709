//
//  Calculator.m
//  FractionCalculator
//
//  Created by 李鹏 on 13-7-8.
//  Copyright (c) 2013年 李鹏. All rights reserved.
//

#import "Calculator.h"
#import "Fraction.h"

@implementation Calculator 
@synthesize accumulator , operand2 , operand1;





-(void)clear
{
    accumulator.numberator = 0;
    accumulator.denominator = 0;
}
-(Fraction *)performOperation : (char)op
{
    
}

@end
