//
//  ViewController.m
//  MaskShape
//
//  Created by 乐升平 on 2018/12/27.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "ViewController.h"
#import "CutOutClearView.h"
#define  Width      UIScreen.mainScreen.bounds.size.width
#define  Height     UIScreen.mainScreen.bounds.size.height
@interface ViewController ()
@property (nonatomic, strong) UIImageView  *upView;
@property (nonatomic, strong) UIImageView  *downView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    CGFloat gap    = 4.f;
    CGFloat offset = 50.f;
    
    {
        CutOutClearView *areaView = [[CutOutClearView alloc] initWithFrame:CGRectMake(0, 0, Width, Height / 2.f + offset - gap)];
        areaView.fillColor        = [UIColor clearColor];
        areaView.areaColor        = [UIColor blackColor];
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(gap, gap)];
        [path addLineToPoint:CGPointMake(Width - gap, gap)];
        [path addLineToPoint:CGPointMake(Width - gap, areaView.frame.size.height)];
        [path addLineToPoint:CGPointMake(gap, areaView.frame.size.height - (offset - gap) * 2 - gap)];
        [path closePath];
        areaView.paths = @[path];
        
        self.upView                     = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Width, Height / 2.f + offset - gap)];
        self.upView.image = [UIImage imageNamed:@"pic_1"];
        self.upView.layer.masksToBounds = YES;
        self.upView.maskView            = areaView;
        [self.view addSubview:self.upView];
    }
    
    {
        CutOutClearView *areaView = [[CutOutClearView alloc] initWithFrame:CGRectMake(0, 0, Width, Height / 2.f + (offset - gap))];
        areaView.fillColor        = [UIColor clearColor];
        areaView.areaColor        = [UIColor greenColor];
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(gap, 0)];
        [path addLineToPoint:CGPointMake(gap, areaView.frame.size.height - gap)];
        [path addLineToPoint:CGPointMake(Width - gap, areaView.frame.size.height - gap)];
        [path addLineToPoint:CGPointMake(Width - gap, (offset - gap) * 2 + gap)];
        [path closePath];
        areaView.paths = @[path];
    
        
        self.downView                     = [[UIImageView alloc] initWithFrame:CGRectMake(0, Height - (Height / 2.f + offset - gap), Width, Height / 2.f + offset - gap)];
        self.downView.image = [UIImage imageNamed:@"pic_2"];
        self.downView.layer.masksToBounds = YES;
        self.downView.maskView            = areaView;
        [self.view addSubview:self.downView];
    }
    
}


@end
