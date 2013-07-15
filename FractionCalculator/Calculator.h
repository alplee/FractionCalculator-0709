//
//  Calculator.h
//  FractionCalculator
//
//  Created by 李鹏 on 13-7-8.
//  Copyright (c) 2013年 李鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "fraction.h"
@interface Calculator : NSObject
@property (nonatomic,strong)Fraction * operand1, * operand2, *accumulator;

-(void)clear;
-(Fraction *)performOperation : (char)op;


@end
