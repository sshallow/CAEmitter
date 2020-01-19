//
//  TestViewController.m
//  CAEmitterLayer
//
//  Created by smart on 2020/1/17.
//  Copyright © 2020 smart. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()
//烟花
@property (nonatomic, strong) CAEmitterLayer *emitterLayer;

@property (nonatomic, strong) CAEmitterCell *emitterCell;

@property (nonatomic, strong) CAEmitterCell *trailCell;

@property (nonatomic, strong) CAEmitterCell *fireworkCell;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testMethod];
}
     
- (void)testMethod {
    NSLog(@"***** testMethod *****");
    //地面发射器
    CAEmitterLayer *emLayer = [CAEmitterLayer layer];
    emLayer.emitterPosition = CGPointMake(self.view.center.x, self.view.bounds.size.height - 40);
    emLayer.renderMode = kCAEmitterLayerAdditive;
    
    //地面升空点 1
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.contents = (id) [[UIImage imageNamed:@"snow"] CGImage];
    cell.birthRate = 1;
    cell.lifetime = 1.02;
    cell.velocity = 800;
    cell.velocityRange = 200;
    cell.yAcceleration = 298;
    cell.scale = 0.3;
    cell.scaleSpeed = 0.2;
    cell.emissionLongitude = - M_PI_2;
    cell.emissionRange = M_PI_2 / 4;
    cell.redRange = 0.9;
    cell.greenRange = 0.9;
    cell.blueRange = 0.9;
    
    //拖尾cell 1
    CAEmitterCell *subCell = [CAEmitterCell emitterCell];
    subCell.contents = (id) [[UIImage imageNamed:@"shuidi"] CGImage];
    subCell.birthRate = 45;
    subCell.lifetime = 0.3;
    subCell.velocity = 150;
    subCell.scale = 0.3;
    subCell.scaleSpeed = -0.2;
    subCell.alphaSpeed = -0.618;
    subCell.emissionRange = M_PI_2 / 10;
    
    //爆炸产生点 2
    CAEmitterCell *oneCell = [CAEmitterCell emitterCell];
    oneCell.contents = (id) [[UIImage imageNamed:@"Star"] CGImage];
    oneCell.scale = 0.2;
    oneCell.birthRate = 1;
    oneCell.lifetime = 1;
    oneCell.velocity = 20;
    oneCell.alphaSpeed = -0.16;
    oneCell.emissionRange = M_PI_2 / 2;
    
    //爆炸粒子 3
    CAEmitterCell *fireworkCell = [CAEmitterCell emitterCell];
    fireworkCell.contents = (id) [[UIImage imageNamed:@"particle-1"] CGImage];
    fireworkCell.scale = 0.382;
    fireworkCell.birthRate = 1000;
    fireworkCell.lifetime = 1.3;
    fireworkCell.lifetimeRange = 1;
    fireworkCell.velocity = 100;
    fireworkCell.yAcceleration = 98 / 2;
//    fireworkCell.alphaSpeed = -0.2;
    fireworkCell.emissionRange = M_PI;
    fireworkCell.duration = 1;
    
    //爆炸粒子 3 的下落拖尾
    CAEmitterCell *tralCell = [CAEmitterCell emitterCell];
    tralCell.contents = (id) [[UIImage imageNamed:@"shuidi"] CGImage];
    tralCell.birthRate = 666;
    tralCell.lifetime = 1;
    tralCell.velocity = 150;
    tralCell.scale = 3;
    tralCell.scaleSpeed = -0.2;
    tralCell.alphaSpeed = -0.618;
    tralCell.emissionRange = M_PI_2 / 10;
    
//    fireworkCell.emitterCells = @[tralCell];
    oneCell.emitterCells = @[fireworkCell];
    cell.emitterCells = @[subCell,oneCell];
    emLayer.emitterCells = @[cell];
    [self.view.layer addSublayer:emLayer];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
