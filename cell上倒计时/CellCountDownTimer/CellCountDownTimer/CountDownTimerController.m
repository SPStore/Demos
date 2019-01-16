//
//  CountDownTimerController.m
//  CellCountDownTimer
//
//  Created by 乐升平 on 2018/12/28.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "CountDownTimerController.h"
#import "TimeModel.h"
#import "CountDownTimeCell.h"

@interface CountDownTimerController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation CountDownTimerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[CountDownTimeCell class] forCellReuseIdentifier:@"timeCell"];

    NSArray *array  = @[TimeModelWithTitle(@"YouXianMing", @20034),
                        TimeModelWithTitle(@"Aaron"      , @31),
                        TimeModelWithTitle(@"Nicholas"   , @1003),
                        TimeModelWithTitle(@"Nathaniel"  , @8089),
                        TimeModelWithTitle(@"Quentin"    , @394),
                        TimeModelWithTitle(@"Samirah"    , @345345),
                        TimeModelWithTitle(@"Serafina"   , @233),
                        TimeModelWithTitle(@"Shanon"     , @4649),
                        TimeModelWithTitle(@"Sophie"     , @3454),
                        TimeModelWithTitle(@"Steven"     , @54524),
                        TimeModelWithTitle(@"Saadiya"    , @235)];

    
    self.dataSource = array;
    
    [self createTimer];
}

#pragma mark - TimerEvent

- (void)createTimer {
    
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerEvent) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)timerEvent {
    
    for (int count = 0; count < self.dataSource.count; count++) {
        
        TimeModel *model = self.dataSource[count];
        [model countDown];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NSNotificationCountDownTimeCell object:nil];
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CountDownTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"timeCell" forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.f;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CountDownTimeCell *tmpCell = (CountDownTimeCell *)cell;
    tmpCell.display     = YES;
    tmpCell.model = self.dataSource[indexPath.row];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath {
    
    CountDownTimeCell *tmpCell = (CountDownTimeCell *)cell;
    tmpCell.display     = NO;
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [self.timer invalidate];
    [super viewDidDisappear:animated];
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


@end
