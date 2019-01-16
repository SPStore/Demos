//
//  ViewController.m
//  CellCountDownTimer
//
//  Created by 乐升平 on 2018/12/28.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "ViewController.h"
#import "CountDownTimerController.h"

@interface ViewController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)buttonClick:(UIButton *)sender {
    CountDownTimerController *countDownVc = [[CountDownTimerController alloc] init];
    [self.navigationController pushViewController:countDownVc animated:YES];
}


@end
