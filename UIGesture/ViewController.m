//
//  ViewController.m
//  UIGesture
//
//  Created by Civet on 2019/5/21.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //加载图像对象，从本地硬盘加载到内存
    UIImage *image = [UIImage imageNamed:@"7.jpg"];
    //创建图像视图
    _imageView = [[UIImageView alloc] init];
    //将图像视图的图像赋值
    _imageView.image = image;
    _imageView.frame = CGRectMake(50, 80, 200, 300);
    [self.view addSubview:_imageView];
    //开启交互事件响应开关，默认为NO,关闭响应
    _imageView.userInteractionEnabled = YES;
    
    //创建一个点击手势对象
    //UITapGestureRecognizer:点击手势类
    //功能：识别点击手势事件
    //P1:响应事件的拥有者对象，self表示当前视图控制器
    //P2:响应事件的函数
    UITapGestureRecognizer *tapOneGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOneAct:)];
    //表示手势识别事件的事件类型：几次点击时触发,默认为1
    tapOneGes.numberOfTapsRequired = 1;
    //表示几个手指点击触发此事件函数，默认为1
    tapOneGes.numberOfTouchesRequired = 1;
    //将点击事件添加到视图中，视图即可响应事件
    [_imageView addGestureRecognizer:tapOneGes];
    
    //双击事件
    UITapGestureRecognizer *tapTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTwo:)];
    //表示手势识别事件的事件类型：几次点击时触发,默认为1
    tapTwo.numberOfTapsRequired = 2;
    //表示几个手指点击触发此事件函数，默认为1
    tapTwo.numberOfTouchesRequired = 1;
    //将点击事件添加到视图中，视图即可响应事件
    [_imageView addGestureRecognizer:tapTwo];
    //单击操作遇到双击操作时，单击操作失效
    [tapOneGes requireGestureRecognizerToFail:tapTwo];
    
}
//单击事件响应
- (void)tapOneAct:(UITapGestureRecognizer *) tap{
    NSLog(@"单击操作!");
    //获取手势监控的视图对象
    UIImageView *imageView = (UIImageView *)tap.view;
    //开始动画过程
    [UIView beginAnimations:nil context:nil];
    
    //设置动画过渡时间
    [UIView setAnimationDuration:2];
    imageView.frame = CGRectMake(0, 0, 320, 568);
    
    //结束动画过程
    [UIView commitAnimations];
    
}
//双击事件响应
- (void)tapTwo:(UITapGestureRecognizer *) tap{
    NSLog(@"双击操作!");
    //获取手势监控的视图对象
    UIImageView *imageView = (UIImageView *)tap.view;
    //开始动画过程
    [UIView beginAnimations:nil context:nil];
    
    //设置动画过渡时间
    [UIView setAnimationDuration:1];
    imageView.frame = CGRectMake(50, 80, 200, 300);
    
    //结束动画过程
    [UIView commitAnimations];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
