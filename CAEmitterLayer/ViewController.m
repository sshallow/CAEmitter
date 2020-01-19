//
//  ViewController.m
//  CAEmitterLayer
//
//  Created by smart on 2019/12/25.
//  Copyright © 2019 smart. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CAEmitterLayer * fireworksLayer;

//烟花
@property (nonatomic, strong) CAEmitterLayer *emitterLayer;

@property (nonatomic, strong) CAEmitterCell *emitterCell;

@property (nonatomic, strong) CAEmitterCell *trailCell;

@property (nonatomic, strong) CAEmitterCell *fireworkCell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self Firework];
}

- (void)Firework {
    [self setupEmitterLayer];
    [self setupEmitterCell];
    [self setupTrailCell];
    [self setupFireworkCell];
    
    self.emitterCell.emitterCells = @[self.trailCell, self.fireworkCell];
    self.emitterLayer.emitterCells = @[self.emitterCell];
    
    [self.view.layer addSublayer:self.emitterLayer];
}

- (void)setupEmitterLayer {
    NSLog(@"***** setupEmitterLayer *****");
    self.emitterLayer = [CAEmitterLayer layer];
    self.emitterLayer.emitterSize = self.view.bounds.size;
    self.emitterLayer.emitterPosition = CGPointMake(self.view.center.x, 0);
    self.emitterLayer.renderMode = kCAEmitterLayerAdditive;
}


- (void)setupEmitterCell {
    self.emitterCell = [CAEmitterCell emitterCell];
    self.emitterCell.color = [[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5] CGColor];
    self.emitterCell.redRange = 0.9;
    self.emitterCell.greenRange = 0.9;
    self.emitterCell.blueRange = 0.9;
    self.emitterCell.lifetime = 2.5;
    self.emitterCell.birthRate = 5;
    self.emitterCell.velocity = 300;
    self.emitterCell.velocityRange = 100;
    self.emitterCell.emissionRange = M_PI / 4;
    self.emitterCell.emissionLongitude = M_PI / 2;
    self.emitterCell.yAcceleration = 100;
}

- (void)setupTrailCell {
    self.trailCell = [CAEmitterCell emitterCell];
    self.trailCell.contents = (id) [[UIImage imageNamed:@"particle"] CGImage];
    self.trailCell.lifetime = 0.5;
    self.trailCell.birthRate = 45;
    self.trailCell.velocity = 80;
    self.trailCell.scale = 0.4;
    self.trailCell.alphaSpeed = -0.7;
    self.trailCell.scaleSpeed = -0.1;
    self.trailCell.scaleRange = 0.1;
    self.trailCell.beginTime = 0.01;
    self.trailCell.duration = 1.7;
    self.trailCell.emissionRange = M_PI / 8;
    self.trailCell.emissionLongitude = M_PI * 2;
    self.trailCell.yAcceleration = -350;;
}

- (void)setupFireworkCell {
    self.fireworkCell = [CAEmitterCell emitterCell];
    self.fireworkCell.contents = (id) [[UIImage imageNamed:@"particle"] CGImage];
    self.fireworkCell.lifetime = 100;
    self.fireworkCell.birthRate = 10000;
    self.fireworkCell.velocity = 130;
    self.fireworkCell.scale = 0.6;
    self.fireworkCell.spin = 2;
    self.fireworkCell.alphaSpeed = -0.2;
    self.fireworkCell.scaleSpeed = -0.1;
    self.fireworkCell.beginTime = 1.5;
    self.fireworkCell.duration = 0.1;
    self.fireworkCell.emissionRange = M_PI * 2;
    self.fireworkCell.yAcceleration = -80;
}

- (void)animation2:(UIButton *)btn{
    //粒子发射器
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = CGPointMake(btn.bounds.size.width/2.0, btn.bounds.size.height/2.0);
    snowEmitter.emitterSize        = btn.bounds.size;
    snowEmitter.emitterMode        = kCAEmitterLayerOutline;
    snowEmitter.emitterShape    = kCAEmitterLayerRectangle;
    snowEmitter.seed              = (arc4random() % 100) + 1;
    
    
    CAEmitterCell * spark = [CAEmitterCell emitterCell];
    spark.birthRate            = 30;
    spark.velocity            = 80;
    spark.emissionRange        = 2* M_PI;// 360 度
    spark.lifetime            = 1.0;
    spark.contents            = (id) [[UIImage imageNamed:@"xuehua"] CGImage];
    spark.scaleSpeed        = -0.8;
    spark.alphaSpeed        = -.9;
    spark.spin                = M_PI_2;
    spark.spinRange            = M_PI_2;
    
    //粒子发射器
    CAEmitterLayer *snowEmitter1 = [CAEmitterLayer layer];
    snowEmitter1.emitterPosition = CGPointMake(btn.bounds.size.width/2.0, btn.bounds.size.height/2.0);
    snowEmitter1.emitterSize        = btn.bounds.size;
    snowEmitter1.emitterMode        = kCAEmitterLayerOutline;
    snowEmitter1.emitterShape    = kCAEmitterLayerRectangle;
    snowEmitter1.seed              = (arc4random() % 100) + 1;
    
    
    CAEmitterCell * spark1 = [CAEmitterCell emitterCell];
    spark1.birthRate            = 30;
    spark1.velocity            = 100;
    spark1.emissionRange        = 2* M_PI;    // 360 度
    spark1.lifetime            = 1.0;
    spark1.contents            = (id) [[UIImage imageNamed:@"xuehua"] CGImage];
    spark1.scaleSpeed        = -0.8;
    spark1.alphaSpeed        = -.9;
    spark1.spin                = M_PI_2;
    spark1.spinRange            = M_PI_2;
    
    // 将粒子添加到粒子发射器上
    snowEmitter.emitterCells = [NSArray arrayWithObject:spark];
    snowEmitter1.emitterCells = [NSArray arrayWithObject:spark1];
    
    [btn.layer addSublayer:snowEmitter];
    [btn.layer addSublayer:snowEmitter1];
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC));
    
    dispatch_time_t popTime2 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    
    __weak typeof(snowEmitter) weakselEmitter = snowEmitter;
    __weak typeof(snowEmitter1) weakselEmitter1 = snowEmitter1;
    
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        __strong typeof(weakselEmitter) strongEmitter = weakselEmitter;
        __strong typeof(weakselEmitter1) strongEmitter1 = weakselEmitter1;
        strongEmitter.birthRate = 0;
        strongEmitter1.birthRate = 0;
    });
    
    dispatch_after(popTime2, dispatch_get_main_queue(), ^{
        __strong typeof(weakselEmitter) strongEmitter = weakselEmitter;
        __strong typeof(weakselEmitter1) strongEmitter1 = weakselEmitter1;
        [strongEmitter removeFromSuperlayer];
        [strongEmitter1 removeFromSuperlayer];
    });
}

- (void)animation1{
    // Cells spawn in the bottom, moving up
    //分为3种粒子，子弹粒子，爆炸粒子，散开粒子
    CAEmitterLayer *fireworksEmitter = [CAEmitterLayer layer];
    CGRect viewBounds = self.view.layer.bounds;
    fireworksEmitter.emitterPosition = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height);
    fireworksEmitter.emitterSize    = CGSizeMake(200, 200);
    fireworksEmitter.emitterMode    = kCAEmitterLayerPoints;
    fireworksEmitter.emitterShape    = kCAEmitterLayerPoint;
    fireworksEmitter.renderMode        = kCAEmitterLayerBackToFront;
//    fireworksEmitter.seed = (arc4random()%100)+1;
    
    // Create the rocket
    CAEmitterCell* rocket = [CAEmitterCell emitterCell];
    
    rocket.birthRate        = 1.0;
    rocket.emissionRange    = 0.125 * M_PI;  // some variation in angle
    rocket.emissionLongitude = - M_PI_2;
    rocket.velocity            = 380;
    rocket.velocityRange    = 100;
    rocket.yAcceleration    = 75;
    rocket.lifetime            = 1.02;    // we cannot set the birthrate < 1.0 for the burst
    
    //星星图片
    rocket.contents            = (id)[[UIImage imageNamed:@"xuehua"] CGImage];
    rocket.scale            = 0.2;
    rocket.color            = [[UIColor redColor] CGColor];
    rocket.greenRange        = 1.0;        // different colors
    rocket.redRange            = 1.0;
    rocket.blueRange        = 1.0;
    rocket.spinRange        = M_PI;        // slow spin
    
    // the burst object cannot be seen, but will spawn the sparks
    // we change the color here, since the sparks inherit its value
    CAEmitterCell* burst = [CAEmitterCell emitterCell];
    
    burst.birthRate            = 1.0;        // at the end of travel
    burst.velocity            = 0;        //速度为0
    burst.scale                = 2.5;      //大小
    burst.redSpeed            =-1.5;        // shifting
    burst.blueSpeed            =+1.5;        // shifting
    burst.greenSpeed        =+1.0;        // shifting
    burst.lifetime            = 0.35;     //存在时间
    
    // and finally, the sparks
    CAEmitterCell* spark = [CAEmitterCell emitterCell];
    
    spark.birthRate            = 400;
    spark.velocity            = 125;
    spark.emissionRange        = 2* M_PI;    // 360 度
    spark.yAcceleration        = 75;        // gravity
    spark.lifetime            = 3;
    //星星图片
    spark.contents            = (id) [[UIImage imageNamed:@"xuehua"] CGImage];
    spark.scaleSpeed        =-0.2;
    spark.greenSpeed        =-0.1;
    spark.redSpeed            = 0.4;
    spark.blueSpeed            =-0.1;
    spark.alphaSpeed        =-0.25;
    spark.spin                = 2* M_PI;
    spark.spinRange            = 2* M_PI;
    
    // 3种粒子组合，可以根据顺序，依次烟花弹－烟花弹粒子爆炸－爆炸散开粒子
    fireworksEmitter.emitterCells    = [NSArray arrayWithObject:rocket];
    rocket.emitterCells                = [NSArray arrayWithObject:burst];
    burst.emitterCells                = [NSArray arrayWithObject:spark];
    [self.view.layer addSublayer:fireworksEmitter];
}
- (void)yanhua {
    
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.emitterPosition = CGPointMake(self.view.center.x, 800);
    emitterLayer.emitterSize = CGSizeMake(300, 300);
    emitterLayer.emitterMode = kCAEmitterLayerOutline;
    emitterLayer.emitterShape= kCAEmitterLayerLine;
    
    //1
    CAEmitterCell *cell = [CAEmitterCell alloc];
    cell.contents = CFBridgingRelease([UIImage imageNamed:@"xuehua"].CGImage);
    
    cell.birthRate = 1 ;
    cell.lifetime = 1 + 0.02 ;
    cell.velocity = 500;
    cell.scale = 0.5;
//    cell.yAcceleration = 30;//重力加速度
//    cell.emissionLongitude = M_PI_2 * 3;
    cell.emissionRange = M_PI_4 / 3;
    cell.color = [[UIColor orangeColor]CGColor];
    
    //2
    CAEmitterCell *cell0 = [CAEmitterCell alloc];
    cell0.birthRate = 1 ;
    cell0.lifetime = 1;
    cell0.velocity = 20;
    cell0.scale = 0.5;
    cell0.redRange = 15;
    cell0.blueRange = 15;
    cell0.greenSpeed = 10;
    cell0.redSpeed = 1.5;
    cell0.blueSpeed = 1.5;
    cell0.greenSpeed = 1.0;
//  cell.yAcceleration = 30;//重力加速度
//    cell0.emissionRange = M_PI;
    cell0.contents = CFBridgingRelease([UIImage imageNamed:@"xuehua"].CGImage);
    
    //3
    CAEmitterCell *cell1 = [CAEmitterCell alloc];
    cell1.birthRate = 100;
    cell1.lifetime = 0.618;
    cell1.velocity = 250;
    cell1.scale = 0.5;
    cell1.yAcceleration = 100;//重力加速度
    cell1.emissionRange = M_PI;
    cell1.contents = CFBridgingRelease([UIImage imageNamed:@"xuehua"].CGImage);
    cell1.alphaSpeed = -0.3;


    cell0.emitterCells = @[cell1];
    cell.emitterCells = @[cell0];
    emitterLayer.emitterCells = @[cell];
    
    [self.view.layer addSublayer:emitterLayer];
    
}

- (void)testMethod {
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.emitterPosition = CGPointMake(self.view.center.x, 800);
    emitterLayer.emitterSize = CGSizeMake(1, 1);
    emitterLayer.emitterMode = kCAEmitterLayerOutline;
    emitterLayer.emitterShape = kCAEmitterLayerLine;
    emitterLayer.renderMode = kCAEmitterLayerAdditive;

    //1
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.birthRate = 1 ;
    cell.emissionRange = 0.12 * M_PI;
    cell.velocity = 400;
    cell.velocityRange = 150;
    cell.yAcceleration = 0;
    cell.lifetime = 2.02 ;

    cell.contents = CFBridgingRelease([UIImage imageNamed:@"weibiaoti-"].CGImage);
    cell.scale = 0.2;
    cell.greenRange = 1.0;
    cell.redRange = 1.0;
    cell.blueRange = 1.0;
    
    cell.spinRange = M_PI;
    
    
    //2
    CAEmitterCell *cell0 = [CAEmitterCell emitterCell];
    cell0.birthRate = 1.0 ;
    cell0.velocity = 0;
    cell0.scale = 2.5;
    cell0.redSpeed = -1.5;
    cell0.blueSpeed = 1.5;
    cell0.greenSpeed = 1.0;
    cell0.lifetime = 0.35;

    //3
    CAEmitterCell *cell1 = [CAEmitterCell emitterCell];
    
    cell1.birthRate = 666;
    cell1.velocity = 125;
    cell1.emissionRange = M_PI * 2;
    cell1.yAcceleration = 75;
    cell1.lifetime = 3;

    cell1.contents = CFBridgingRelease([UIImage imageNamed:@"shuidi"].CGImage);
    cell1.scale = 0.5;
    cell1.scaleSpeed = -0.2;
    cell1.greenSpeed = -0.1;
    cell1.redSpeed = 0.4;
    cell1.blueSpeed = -0.1;
    cell1.alphaSpeed = -0.5;

    emitterLayer.emitterCells = @[cell];
    cell.emitterCells = @[cell0];
    cell0.emitterCells = @[cell1];
    
    [self.view.layer addSublayer:emitterLayer];
    
}

- (void)testMethod1 {
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.emitterPosition = CGPointMake(self.view.center.x, 800);
    emitterLayer.emitterSize = CGSizeMake(1, 1);
    emitterLayer.emitterMode = kCAEmitterLayerOutline;
    emitterLayer.emitterShape = kCAEmitterLayerLine;
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    
    //rocket
    CAEmitterCell *rocket = [CAEmitterCell emitterCell];
    rocket.birthRate = 1.0;
    rocket.emissionRange = 0.12 * M_PI;
    rocket.velocity = 400;
    rocket.velocityRange = 150;
    rocket.yAcceleration = 0;
    rocket.lifetime = 2.02;
    
    rocket.contents = (id)[UIImage imageNamed:@"ball"].CGImage;
    rocket.scale = 0.2;
    rocket.greenRange = 1.0;
    rocket.redRange = 1.0;
    rocket.blueRange = 1.0;
    
    rocket.spinRange = M_PI;
    
    
    //burst
    CAEmitterCell *burst = [CAEmitterCell emitterCell];
    burst.birthRate = 1.0;
    burst.velocity = 0;
    burst.scale = 2.5;
    burst.redSpeed = -1.5;
    burst.blueSpeed = 1.5;
    burst.greenSpeed = 1.0;
    burst.lifetime = 0.35;
    
    //spark
    CAEmitterCell *spark = [CAEmitterCell emitterCell];
    
    spark.birthRate = 666;
    spark.velocity = 125;
    spark.emissionRange = 2 * M_PI;
    spark.yAcceleration = 75;
    spark.lifetime = 3;
    
    spark.contents= (id)[UIImage imageNamed:@"fire"].CGImage;
    spark.scale = 0.5;
    spark.scaleSpeed = -0.2;
    spark.greenSpeed = -0.1;
    spark.redSpeed = 0.4;
    spark.blueSpeed = -0.1;
    spark.alphaSpeed = -0.5;
    spark.spin = 2 * M_PI;
    spark.spinRange = 2 * M_PI;
    
    //together
    emitterLayer.emitterCells = @[rocket];
    rocket.emitterCells = @[burst];
    burst.emitterCells = @[spark];
    
    [self.view.layer addSublayer:emitterLayer];
    
}

@end
