//
//  CSRButton.m
//  CSRButton
//
//  Created by mac on 2017/2/28.
//  Copyright © 2017年 LeoAiolia. All rights reserved.
//

#import "CSRButton.h"

/*! 定义宏：按钮中文本和图片的间隔 */
#define CSR_PADDING        0
//#define CSR_BTN_RADIO       0.6
/*! 获得按钮的大小 */
#define CSR_BTN_WIDTH       self.bounds.size.width
#define CSR_BTN_HEIGHT      self.bounds.size.height
/*! 获得按钮中UILabel文本的大小 */
#define CSR_LABEL_WIDTH     self.titleLabel.bounds.size.width
#define CSR_LABEL_HEIGHT    self.titleLabel.bounds.size.height
/*! 获得按钮中image图标的大小 */
#define CSR_IMG_WIDTH     self.imageView.bounds.size.width
#define CSR_IMG_HEIGHT    self.imageView.bounds.size.height

/*! 图标在上，文本在下按钮的图文间隔比例（0-1），默认0.8 */
#define CSR_BTN_TOP_RADIO 0.7

/*! 图标在下，文本在上按钮的图文间隔比例（0-1），默认0.5 */
#define CSR_BTN_BOTTOM_RADIO 0.5

@implementation CSRButton


- (void)setButtonStatus:(CSRButtonStatus)buttonStatus
{
    _buttonStatus = buttonStatus;
}

#pragma mark - 左对齐
- (void)alignmentLeft
{
    /*! 获得按钮的文本的frame */
    CGRect titleFrame = self.titleLabel.frame;
    /*! 设置按钮的文本的x坐标为0-－－左对齐 */
    titleFrame.origin.x = 0;
    /*! 获得按钮的图片的frame */
    CGRect imageFrame = self.imageView.frame;
    /*! 设置按钮的图片的x坐标紧跟文本的后面 */
    imageFrame.origin.x = CGRectGetWidth(titleFrame);
    
    self.titleLabel.frame = titleFrame;
    self.imageView.frame = imageFrame;
}

#pragma mark - 右对齐【文字在左，图片在右】
- (void)alignmentRight
{
    CGRect frame = [self getTitleLabelWith];
    CGRect imageFrame = self.imageView.frame;
    imageFrame.origin.x = CSR_BTN_WIDTH - CSR_IMG_WIDTH;
    CGRect titleFrame = self.titleLabel.frame;
    titleFrame.origin.x = imageFrame.origin.x - frame.size.width;
    
    /*! 重写赋值frame */
    self.titleLabel.frame = titleFrame;
    self.imageView.frame = imageFrame;
}

#pragma mark - 计算文本的的宽度
- (CGRect)getTitleLabelWith
{
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = self.titleLabel.font;
    CGRect frame = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dictM context:nil];
    
    return frame;
}

#pragma mark - 居中对齐
- (void)alignmentCenter
{
    /*! 设置文本的坐标 */
    CGFloat labelX = (CSR_BTN_WIDTH - CSR_LABEL_WIDTH - CSR_IMG_WIDTH - CSR_PADDING) * 0.5;
    CGFloat labelY = (CSR_BTN_HEIGHT - CSR_LABEL_HEIGHT) * 0.5;
    /*! 设置label的frame */
    self.titleLabel.frame = CGRectMake(labelX, labelY, CSR_LABEL_WIDTH, CSR_LABEL_HEIGHT);
    
    /*! 设置图片的坐标 */
    CGFloat imageX = CGRectGetMaxX(self.titleLabel.frame) + CSR_PADDING;
    CGFloat imageY = (CSR_BTN_HEIGHT - CSR_IMG_HEIGHT) * 0.5;
    /*! 设置图片的frame */
    self.imageView.frame = CGRectMake(imageX, imageY, CSR_IMG_WIDTH, CSR_IMG_HEIGHT);
}

#pragma mark - 图标在上，文本在下(居中)
- (void)alignmentTop
{
    CGRect frame = [self getTitleLabelWith];
    
    CGFloat imageX = (CSR_BTN_WIDTH - CSR_IMG_WIDTH) * 0.5;
    self.imageView.frame = CGRectMake(imageX, CSR_BTN_HEIGHT * 0.5 - CSR_IMG_HEIGHT * CSR_BTN_TOP_RADIO, CSR_IMG_WIDTH, CSR_IMG_HEIGHT);
    self.titleLabel.frame = CGRectMake((self.center.x - frame.size.width) * 0.5, CSR_BTN_HEIGHT * 0.5 + CSR_LABEL_HEIGHT * CSR_BTN_TOP_RADIO, CSR_BTN_WIDTH, CSR_LABEL_HEIGHT);
    CGPoint labelCenter = self.titleLabel.center;
    labelCenter.x = self.imageView.center.x;
    self.titleLabel.center = labelCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

#pragma mark - 图标在下，文本在上(居中)
- (void)alignmentBottom
{
    CGRect frame = [self getTitleLabelWith];
    
    CGFloat imageX = (CSR_BTN_WIDTH - CSR_IMG_WIDTH) * 0.5;
    self.titleLabel.frame = CGRectMake((self.center.x - frame.size.width) * 0.5, CSR_BTN_HEIGHT * 0.5 - CSR_LABEL_HEIGHT * (1 + CSR_BTN_BOTTOM_RADIO), CSR_BTN_WIDTH, CSR_LABEL_HEIGHT);
    self.imageView.frame = CGRectMake(imageX, CSR_BTN_HEIGHT * 0.5, CSR_IMG_WIDTH, CSR_IMG_HEIGHT);
    CGPoint labelCenter = self.titleLabel.center;
    labelCenter.x = self.imageView.center.x;
    self.titleLabel.center = labelCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)setButtonCornerRadius:(CGFloat)buttonCornerRadius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = buttonCornerRadius;
}

/*! 布局子控件 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_buttonStatus == CSRButtonStatusNormal)
    {
    }
    else if (_buttonStatus == CSRButtonStatusLeft)
    {
        [self alignmentLeft];
    }
    else if (_buttonStatus == CSRButtonStatusCenter)
    {
        [self alignmentCenter];
    }
    else if (_buttonStatus == CSRButtonStatusRight)
    {
        [self alignmentRight];
    }
    else if (_buttonStatus == CSRButtonStatusTop)
    {
        [self alignmentTop];
    }
    else if (_buttonStatus == CSRButtonStatusBottom)
    {
        [self alignmentBottom];
    }
}

@end
