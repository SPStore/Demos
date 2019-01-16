//
//  ViewController.m
//  LineLayout
//
//  Created by 乐升平 on 2018/12/27.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "ViewController.h"
#import "LineLayoutViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)debugAction:(UIButton *)sender {
    LineLayoutViewController *lineLayoutVc = [[LineLayoutViewController alloc] init];
    lineLayoutVc.isDebug = YES;
    [self.navigationController pushViewController:lineLayoutVc animated:YES];
}

- (IBAction)lineLayoutAction:(UIButton *)sender {
    LineLayoutViewController *lineLayoutVc = [[LineLayoutViewController alloc] init];
    lineLayoutVc.layoutType = 0;
    [self.navigationController pushViewController:lineLayoutVc animated:YES];
}

- (IBAction)complexLineAction:(UIButton *)sender {
    LineLayoutViewController *lineLayoutVc = [[LineLayoutViewController alloc] init];
    lineLayoutVc.layoutType = 1;
    [self.navigationController pushViewController:lineLayoutVc animated:YES];
}


@end
