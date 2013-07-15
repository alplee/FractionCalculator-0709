//
//  Fraction.m
//  FractionCalculator
//
//  Created by 李鹏 on 13-7-9.
//  Copyright (c) 2013年 李鹏. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction
@synthesize denominator = _denominator, numberator = _numberator;

-(void)print
{
    NSLog(@"%i/%i",_numberator,_denominator);
}
-(void)setto : (int)n over: (int)d
{
    _denominator = d;
    _numberator = n;
}

//设定四则运算的计算方式
// a/b+c/d=(ad+bc)/bd

-(Fraction *)add : (Fraction *)f
{
    Fraction * result = [[Fraction alloc] init];
    
    result.numberator = _numberator * f.denominator + _denominator * f.numberator;
    result.denominator = _denominator * f.denominator;
    
    [result reduce];
    return result;
    
}

//a/b-c/d=(ad-bc)/bd
-(Fraction *)sub : (Fraction *)f
{
    Fraction * result = [[Fraction alloc] init];
    
    result.numberator = _numberator * f.denominator - _denominator * f.numberator;
    result.denominator = _denominator * f.denominator;
    
    [result reduce];
    return result;

}

//a/b*c/d=ac/bd
-(Fraction *)mut : (Fraction *)f
{
    Fraction * result = [[Fraction alloc] init];
    
    result.numberator = _numberator * f.numberator;
    result.denominator = _denominator * f.denominator;
    
    [result reduce];
    return result;

}

//a/b/c/d=ad/bc
-(Fraction *)dev : (Fraction *)f
{
    Fraction * result = [[Fraction alloc] init];
    
    result.numberator = _numberator * f.denominator;
    result.denominator = _denominator * f.numberator;
    
    [result reduce];
    return result;

}

-(void)reduce
{
    int u = _numberator;
    int v = _denominator;
    int temp;
    
    if (u == 0) {
        return;
    }
    else if (u<0)
    {
        u = -u;
    }
    
    while (v != 0) {
        temp = u%v;
        u = v;
        v = temp;
    }
}
-(double)conventToNumber
{
    if (_denominator != 0) {
        return (double)_numberator/_denominator;
    }
    
        else
        {
            return NAN;
        }
    
}
-(NSString *)conventToString
{
    if (_numberator == _denominator) {
        if (_numberator == 0) {
            return @"0";
        }
        else
        {
            return @"1";
        }
    }
    else if (_denominator == 1) {
        return [NSString stringWithFormat:@"%i",_numberator];
        }
    else
    {
        return [NSString stringWithFormat:@"%i/%i",_numberator,_denominator];
    }
    
}
@end
