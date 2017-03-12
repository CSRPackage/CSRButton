//
//  ViewController.m
//  CSRButton
//
//  Created by mac on 2017/2/28.
//  Copyright © 2017年 LeoAiolia. All rights reserved.
//

#import "ViewController.h"
#import "CSRButton.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self btnTest];
}
- (void)btnTest
{
    CSRButton *btn = [[CSRButton alloc] init];
    btn.backgroundColor = [UIColor greenColor];;
    [btn setImage:[UIImage imageNamed:@"icon-search"] forState:UIControlStateNormal];
    [btn setTitle:@"搜索" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.buttonStatus = CSRButtonStatusNormal;
    btn.buttonCornerRadius = 5.0;
    btn.frame = CGRectMake(50, 50, 200, 50);
    /* 文字和图片的间距用这两行代码更改就行了 */
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, btn.titleLabel.frame.size.width+5);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:btn];
    
    CSRButton *btn2 = [[CSRButton alloc] init];
    [btn2 setBackgroundColor:[UIColor greenColor]];
    [btn2 setImage:[UIImage imageNamed:@"icon-search"] forState:UIControlStateNormal];
    [btn2 setTitle:@"搜索" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.buttonStatus = CSRButtonStatusCenter;
    btn2.buttonCornerRadius = 5.0;
//    btn2.titleLabel.font = [UIFont systemFontOfSize:14];
    btn2.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn.frame) + 10, 250, 50);
    [self.view addSubview:btn2];
    
    CSRButton *btn3 = [[CSRButton alloc] init];
    [btn3 setBackgroundColor:[UIColor greenColor]];
    [btn3 setImage:[UIImage imageNamed:@"icon-search"] forState:UIControlStateNormal];
    [btn3 setTitle:@"搜索" forState:UIControlStateNormal];
//    btn3.titleLabel.font = [UIFont systemFontOfSize:10];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn3.buttonStatus = CSRButtonStatusRight;
    btn3.buttonCornerRadius = 5.0;
    btn3.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn2.frame) + 10, 200, 50);
    [self.view addSubview:btn3];
    
    CSRButton *btn4 = [[CSRButton alloc] init];
    btn4.buttonStatus = CSRButtonStatusLeft;
    [btn4 setBackgroundColor:[UIColor greenColor]];
    [btn4 setImage:[UIImage imageNamed:@"icon-search"] forState:UIControlStateNormal];
    [btn4 setTitle:@"搜索" forState:UIControlStateNormal];
//    btn4.titleLabel.font = [UIFont systemFontOfSize:10];
    btn4.buttonCornerRadius = 5.0;
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn4.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn3.frame) + 10, 200, 50);
    [self.view addSubview:btn4];
    
    CSRButton *btn5 = [[CSRButton alloc] init];
    btn5.buttonStatus = CSRButtonStatusTop;
    [btn5 setBackgroundColor:[UIColor greenColor]];
    [btn5 setImage:[UIImage imageNamed:@"icon-search"] forState:UIControlStateNormal];
    [btn5 setTitle:@"搜索" forState:UIControlStateNormal];
    btn5.titleLabel.font = [UIFont systemFontOfSize:14];
    btn5.buttonCornerRadius = 5.0;
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn5.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn4.frame) + 10, 200, 80);
    [self.view addSubview:btn5];
    
    CSRButton *btn6 = [[CSRButton alloc] init];
    btn6.buttonStatus = CSRButtonStatusBottom;
    [btn6 setBackgroundColor:[UIColor greenColor]];
    [btn6 setImage:[UIImage imageNamed:@"icon-search"] forState:UIControlStateNormal];
    [btn6 setTitle:@"搜索" forState:UIControlStateNormal];
    btn6.titleLabel.font = [UIFont systemFontOfSize:14];
    btn6.buttonCornerRadius = 5.0;
    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn6.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn5.frame) + 10, 150, 80);
    [self.view addSubview:btn6];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
