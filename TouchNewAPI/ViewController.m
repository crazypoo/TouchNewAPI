//
//  ViewController.m
//  TouchNewAPI
//
//  Created by 邓杰豪 on 15/9/29.
//  Copyright © 2015年 邓杰豪. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGPoint touchPoint;
    UIImageView *canDraw;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    canDraw = [[UIImageView alloc] initWithFrame:self.view.bounds];
    canDraw.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:canDraw];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    touchPoint = [touch locationInView:canDraw];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:canDraw];

    UIGraphicsBeginImageContext(canDraw.frame.size);
    [canDraw.image drawInRect:CGRectMake(0.0, 0.0, canDraw.frame.size.width, canDraw.frame.size.height)];

    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);

    float lineWidthc = 10.0;
    if ([touch respondsToSelector:@selector(force)]) {
        NSLog(@"force:%f", touch.force);
        lineWidthc = lineWidthc * touch.force;
    }
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), lineWidthc);

    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), touchPoint.x, touchPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    canDraw.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    touchPoint = currentPoint;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
