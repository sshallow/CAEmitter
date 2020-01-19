//
//  LayerViewController.m
//  CAEmitterLayer
//
//  Created by smart on 2020/1/3.
//  Copyright © 2020 smart. All rights reserved.
//

#import "LayerViewController.h"

@interface LayerViewController ()

//雪花
@property (nonatomic, strong) CAEmitterLayer *snowflakeEmitterLayer;

@property (nonatomic, strong) CAEmitterCell  *snowflakeEmitterCell;


//火焰
@property (nonatomic, strong) CAEmitterLayer *flameEmitterLayer;

@property (nonatomic, strong) CAEmitterCell  *flameEmitterCell;


//五彩纸屑
@property (nonatomic, assign) NSInteger      dimension;

@property (nonatomic, copy  ) NSArray        *velocities;

@property (nonatomic, copy  ) NSArray        *imagesNames;

@property (nonatomic, copy  ) NSArray        *colors;

@property (nonatomic, strong) CAEmitterLayer *confettiViewEmitterLayer;

@property (nonatomic, strong) CAEmitterCell  *confettiViewEmitterCell;


//烟花
@property (nonatomic, strong) CAEmitterLayer *emitterLayer;

@property (nonatomic, strong) CAEmitterCell *emitterCell;

@property (nonatomic, strong) CAEmitterCell *trailCell;

@property (nonatomic, strong) CAEmitterCell *fireworkCell;




@end

@implementation LayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.layer.contents = (id)[UIImage imageNamed:@"IMG_1329.JPG"].CGImage;
    
    [self changetestMethod];
}

- (void)changetestMethod {
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

- (void)TemptestMethod {
    NSLog(@"***** testMethod *****");
    //地面发射器
    CAEmitterLayer *emLayer = [CAEmitterLayer layer];
    emLayer.emitterPosition = CGPointMake(self.view.center.x, self.view.bounds.size.height - 100);
    emLayer.renderMode = kCAEmitterLayerAdditive;
    
    //地面升空点 1
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.contents = (id) [[UIImage imageNamed:@"snow"] CGImage];
    cell.birthRate = 1;
    cell.lifetime = 2;
    cell.velocity = 300;
    cell.scale = 0.25;
    cell.emissionLongitude = - M_PI_2;
    cell.emissionRange = M_PI_2 / 2;
    cell.redRange = 1.0;
    cell.greenRange = 1.0;
    cell.blueRange = 1.0;
    
    //拖尾cell 1
    CAEmitterCell *subCell = [CAEmitterCell emitterCell];
    subCell.contents = (id) [[UIImage imageNamed:@"box"] CGImage];
    subCell.scale = 0.2;
    subCell.birthRate = 10;
    subCell.lifetime = 0.618;
    subCell.velocity = 20;
    subCell.alphaSpeed = -0.16;
    subCell.emissionRange = M_PI_2 / 2;
    
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
    fireworkCell.contents = (id) [[UIImage imageNamed:@"quxian"] CGImage];
    fireworkCell.scale = 2.5;
    fireworkCell.birthRate = 500;
    fireworkCell.lifetime = 1.8;
    fireworkCell.velocity = 80;
    fireworkCell.alphaSpeed = -0.1;
    fireworkCell.emissionRange = M_PI;
    
    oneCell.emitterCells = @[fireworkCell];
    cell.emitterCells = @[subCell,oneCell];
    emLayer.emitterCells = @[cell];
    [self.view.layer addSublayer:emLayer];
    
}

- (void)testMethod {
    NSLog(@"***** testMethod *****");
    //地面发射器
    CAEmitterLayer *emLayer = [CAEmitterLayer layer];
    emLayer.emitterPosition = CGPointMake(self.view.center.x, self.view.bounds.size.height - 100);
    emLayer.renderMode = kCAEmitterLayerAdditive;
    
    //地面升空点 1
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.contents = (id) [[UIImage imageNamed:@"snow"] CGImage];
    cell.birthRate = 1;
    cell.lifetime = 2;
    cell.velocity = 100;
    cell.velocityRange = 100;
    cell.scale = 0.5;
    cell.scaleSpeed = .1;
    cell.emissionLongitude = - M_PI_2;
    cell.emissionRange = M_PI_2 / 4;
    cell.redRange = 1.0;
    cell.greenRange = 1.0;
    cell.blueRange = 1.0;
    
    //拖尾cell 1
    CAEmitterCell *subCell = [CAEmitterCell emitterCell];
    subCell.contents = (id) [[UIImage imageNamed:@"box"] CGImage];
    subCell.scale = 0.2;
    subCell.birthRate = 10;
    subCell.lifetime = 0.618;
    subCell.velocity = 200;
    subCell.alphaSpeed = -0.16;
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
    fireworkCell.contents = (id) [[UIImage imageNamed:@"star-2"] CGImage];
    fireworkCell.scale = 2.5;
    fireworkCell.birthRate = 10;
    fireworkCell.lifetime = 1.8;
    fireworkCell.velocity = 80;
    fireworkCell.alphaSpeed = -0.1;
    fireworkCell.emissionRange = M_PI;
    
    oneCell.emitterCells = @[fireworkCell];
    cell.emitterCells = @[subCell,oneCell];
    emLayer.emitterCells = @[cell];
    [self.view.layer addSublayer:emLayer];
    
}

- (void)snow {
    NSLog(@"***** testMethod *****");
    [self setupSnowflakeEmitterLayer];
    [self setupSnowflakeEmitterCell];
    self.snowflakeEmitterLayer.emitterCells = @[self.snowflakeEmitterCell];
    [self.view.layer addSublayer:self.snowflakeEmitterLayer];
}

- (void)setupSnowflakeEmitterLayer {
    NSLog(@"***** setupSnowflakeEmitterLayer *****");
    self.snowflakeEmitterLayer = [CAEmitterLayer layer];
    self.snowflakeEmitterLayer.emitterSize = CGSizeMake(400, 400);
    self.snowflakeEmitterLayer.emitterShape = kCAEmitterLayerRectangle;
    self.snowflakeEmitterLayer.emitterPosition = CGPointMake(self.view.center.x, self.view.center.y);
}

- (void)setupSnowflakeEmitterCell {
    NSLog(@"***** setupSnowflakeEmitterCell *****");
    self.snowflakeEmitterCell = [CAEmitterCell emitterCell];
    self.snowflakeEmitterCell.color = [[UIColor whiteColor] CGColor];
    self.snowflakeEmitterCell.contents = (id) [[UIImage imageNamed:@"snow"] CGImage];
    self.snowflakeEmitterCell.lifetime = 5.5;
    self.snowflakeEmitterCell.birthRate = 200;
    self.snowflakeEmitterCell.blueRange = 0.15;
    self.snowflakeEmitterCell.alphaRange = 0.4;
    self.snowflakeEmitterCell.velocity = 10;
    self.snowflakeEmitterCell.velocityRange = 300;
    self.snowflakeEmitterCell.scale = 0.4;
    self.snowflakeEmitterCell.scaleRange = 1.3;
    self.snowflakeEmitterCell.emissionRange = M_PI / 2;
    self.snowflakeEmitterCell.emissionLongitude = M_PI;
    self.snowflakeEmitterCell.yAcceleration = -70;
    self.snowflakeEmitterCell.scaleSpeed = -0.1;
    self.snowflakeEmitterCell.alphaSpeed = -0.05;
}




- (void)Flame {
    NSLog(@"***** testMethod *****");
    [self setupFlameEmitterLayer];
    [self setupFlameEmitterCell];
    self.flameEmitterLayer.emitterCells = @[self.flameEmitterCell];
    [self.view.layer addSublayer:self.flameEmitterLayer];
}

- (void)setupFlameEmitterLayer {
    NSLog(@"***** setupSnowflakeEmitterLayer *****");
    self.flameEmitterLayer = [CAEmitterLayer layer];
    self.flameEmitterLayer.emitterSize = CGSizeMake(400, 400);
    self.flameEmitterLayer.emitterPosition = CGPointMake(self.view.center.x, self.view.center.y);
    self.flameEmitterLayer.renderMode = kCAEmitterLayerAdditive;
}

- (void)setupFlameEmitterCell {
    NSLog(@"***** setupSnowflakeEmitterCell *****");
    self.flameEmitterCell = [CAEmitterCell emitterCell];
    self.flameEmitterCell.color = [[UIColor colorWithRed:1 green:0.5 blue:0.2 alpha:1] CGColor];
    self.flameEmitterCell.contents = (id) [[UIImage imageNamed:@"xuehua"] CGImage];;
    self.flameEmitterCell.lifetime = 5.0;
    self.flameEmitterCell.birthRate = 150;
    self.flameEmitterCell.alphaSpeed = -0.4;
    self.flameEmitterCell.velocity = 50;
    self.flameEmitterCell.velocityRange = 50;
    self.flameEmitterCell.emissionRange = M_PI * 2;

}




- (void)Confetti {
    self.dimension = 4;
    self.velocities = @[@50, @100, @150, @200];
    self.imagesNames = @[@"box", @"circle", @"spiral", @"triangle"];
    self.colors = @[[UIColor redColor],[UIColor greenColor],[UIColor blueColor],[UIColor magentaColor]];
    
    [self setupConfettiEmitterLayer];
    self.confettiViewEmitterLayer.emitterCells = [self generateConfettiEmitterCells];
    [self.view.layer addSublayer:self.confettiViewEmitterLayer];
}

- (void)setupConfettiEmitterLayer {
    NSLog(@"***** setupSnowflakeEmitterLayer *****");
    self.confettiViewEmitterLayer = [CAEmitterLayer layer];
    self.confettiViewEmitterLayer.emitterSize = CGSizeMake(400, 2);
    self.confettiViewEmitterLayer.emitterShape = kCAEmitterLayerLine;
    self.confettiViewEmitterLayer.emitterPosition = CGPointMake(self.view.center.x, 0);
}

- (NSArray<CAEmitterCell *> *)generateConfettiEmitterCells {
    NSMutableArray *cells = [[NSMutableArray alloc]initWithCapacity:10];
    
    for (int i = 0; i < 10; i ++) {
        CAEmitterCell *cell = [CAEmitterCell emitterCell];
        cell.color = [self nextColor:i];
        cell.contents = (id) [self nextImage:i];
        cell.birthRate = 4.0;
        cell.lifetime = 14.0;
        cell.lifetimeRange = 0;
        cell.scale = 0.5;
        cell.scaleRange = 0.25;
        cell.velocity = [[self randomVelocity] floatValue];
        cell.velocityRange = 0;
        cell.emissionLongitude = M_PI;
        cell.emissionRange = 0.5;
        cell.spin = 3.5;
        cell.spinRange = 1;
    
        [cells addObject:cell];
    }
    
    NSLog(@"***** 打cells印值: %@ *****",cells);
    return cells;
}

- (CGColorRef)nextColor:(NSInteger)i {
    return [(self.colors[i % self.dimension]) CGColor];
}

- (CGImageRef)nextImage:(NSInteger)i {
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imagesNames[i % self.dimension]]];
    return [image CGImage];
}

- (id)randomVelocity {
    uint32_t num = arc4random_uniform((uint32_t)self.dimension);
    return self.velocities[num];
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
    NSLog(@"***** testMethod *****");
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
    self.fireworkCell.birthRate = 20000;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
