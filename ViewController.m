//
//  ViewController.m
//  CCEmitterDemo
//
//  Created by Daniujia on 2017/2/4.
//  Copyright © 2017年 CC. All rights reserved.
//

#import "ViewController.h"
#import  <CoreGraphics/CoreGraphics.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addEmitter];
}


- (void)addEmitter {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height)];
    imageView.image = [UIImage imageNamed:@"huajiTree"];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imageView];
    
    
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    //例子发射位置
    emitterLayer.emitterPosition = CGPointMake(self.view.center.x, 50);
    //发射源的尺寸大小
    emitterLayer.emitterSize = CGSizeMake(1,1);
    //发射模式
    emitterLayer.emitterMode = kCAEmitterLayerSurface;
    //发射源的形状
    emitterLayer.emitterShape = kCAEmitterLayerLine;
    
    //创建雪花类型的粒子
    CAEmitterCell *huajiCell = [CAEmitterCell emitterCell];
    //粒子的名字
    huajiCell.name = @"huaji";
    //粒子参数的速度乘数因子
    huajiCell.birthRate = 3.0;
    huajiCell.lifetime = 120.0;
    //粒子速度
    huajiCell.velocity =10.0;
    //粒子的速度范围
    huajiCell.velocityRange = 10;
    //粒子y方向的加速度分量
    huajiCell.yAcceleration = 5;
    //周围发射角度
    huajiCell.emissionRange = 1 * M_PI;
    //子旋转角度范围
    huajiCell.spinRange = 0.1 * M_PI;
    huajiCell.contents = (id)[[UIImage imageNamed:@"image_emoticon25"] CGImage];

    
    emitterLayer.emitterCells = [NSArray arrayWithObjects:huajiCell,nil];
    [imageView.layer insertSublayer:emitterLayer atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
