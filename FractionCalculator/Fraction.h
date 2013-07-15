//
//  Fraction.h
//  FractionCalculator
//
//  Created by 李鹏 on 13-7-9.
//  Copyright (c) 2013年 李鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
@property int numberator,denominator;

-(void)print;
-(void)setto : (int)n over: (int)d;

//设定四则运算的计算方式
-(Fraction *)add : (Fraction *)f;
-(Fraction *)sub : (Fraction *)f;
-(Fraction *)mut : (Fraction *)f;
-(Fraction *)dev : (Fraction *)f;

-(void)reduce;
-(double)conventToNumber;
-(NSString *)conventToString;

@end
