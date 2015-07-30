//
//  ViewController.m
//  RollingBall
//
//  Created by Nguyen Minh Khue on 7/29/15.
//  Copyright (c) 2015 Nguyen Minh Khue. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *ball;
    NSTimer *timer;
    CGFloat angle;
    CGFloat ballRadius;
    CGFloat maxWidth;
    CGFloat maxHeight;
    CGFloat toadoX,toadoY;
    CGFloat chieu;
    CGFloat chieuX,chieuY;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self drawBG];
    [self addBall];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                             target:self
                                           selector:@selector(rollBall)
                                           userInfo:nil
                                            repeats:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) addBall {
    CGSize mainViewSize = self.view.bounds.size;
    
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Football32.png"]];
    ballRadius = 32.0;
    chieu=1;
    chieuX=1;
    chieuY=1;
    toadoX =mainViewSize.width * 0.5;
    toadoY =mainViewSize.height * 0.5;
    
    ball.center = CGPointMake(toadoX, toadoY);
    maxWidth = mainViewSize.width - ballRadius;
    maxHeight = mainViewSize.height - ballRadius;
    [self.view addSubview:ball];
}

-(void) rollBall{
    CGFloat deltaAngle=0.1;

    toadoX = ball.center.x + chieu * ballRadius * deltaAngle;
    angle += chieu * deltaAngle;
    
    toadoY = ball.center.y;
    
    if (toadoX>maxWidth )
    {
        chieu=-chieu;
        toadoX=maxWidth;
    }
    else if (toadoX<ballRadius)
    {
        chieu=-chieu;
        toadoX=ballRadius;
    }
    
    ball.transform = CGAffineTransformMakeRotation(angle);
    
    ball.center = CGPointMake(toadoX,
                              toadoY);
}

- (void)drawBG{
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    
    background.frame = self.view.bounds;
    background.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:background];
    
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}

@end
