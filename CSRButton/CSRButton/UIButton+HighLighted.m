//
//  UIButton+HighLighted.m
//  test
//
//  Created by apple on 14/11/2.
//  Copyright (c) 2014年 wx. All rights reserved.
//

#import "UIButton+HighLighted.h"

@implementation UIButton (HighLighted)

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state
{
    [self setBackgroundImage:[self buttonImageFromColor:color] forState:state];
}

- (UIImage *)buttonImageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1000, 1000);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
