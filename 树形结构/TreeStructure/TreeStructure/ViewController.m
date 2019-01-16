//
//  ViewController.m
//  TreeStructure
//
//  Created by 乐升平 on 2018/12/26.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "ViewController.h"
#import "AreaModel.h"
#import "AreaCell.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView                  *tableView;
@property (nonatomic, strong) NSMutableArray <AreaModel *> *datas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"树形结构";
    // Tree type data.
    NSArray *treeDatas = @[@{@"text":@"河北省",
                             @"level":@"0",
                             @"children":@[@{@"text":@"衡水市",
                                              @"level":@"1",
                                              @"children":@[@{@"text":@"阜城县",
                                                               @"level":@"2",
                                                               @"children":@[@{@"text":@"大白乡",
                                                                                @"level":@"3",},
                                                                              @{@"text":@"建桥乡",
                                                                                @"level":@"3",},
                                                                              @{@"text":@"古城镇",
                                                                                @"level":@"3",}]},
                                                             @{@"text":@"武邑县",
                                                               @"level":@"2",},
                                                             @{@"text":@"景县",
                                                               @"level":@"2",}]},
                                            @{@"text":@"廊坊市",
                                              @"level":@"1",
                                              @"children":@[@{@"text":@"固安县",
                                                               @"level":@"2",},
                                                             @{@"text":@"三河市",
                                                               @"level":@"2",},
                                                             @{@"text":@"霸州市",
                                                               @"level":@"2",}]}]},
                           @{@"text":@"山东省",
                             @"level":@"0",
                             @"children":@[@{@"text":@"德州市",
                                              @"level":@"1",
                                              @"children":@[@{@"text":@"临邑县",
                                                               @"level":@"2",},
                                                             @{@"text":@"齐河县",
                                                               @"level":@"2",},
                                                             @{@"text":@"平原县",
                                                               @"level":@"2",}]},
                                            @{@"text":@"烟台市",
                                              @"level":@"1",
                                              @"children":@[@{@"text":@"蓬莱市",
                                                               @"level":@"2",},
                                                             @{@"text":@"招远市",
                                                               @"level":@"2",},
                                                             @{@"text":@"海阳市",
                                                               @"level":@"2",}]}]},];
    // DataSource.
    self.datas = [NSMutableArray array];
    for (id obj in treeDatas) {
        AreaModel *model = [[AreaModel alloc] initWithDictionary:obj];
        [self.datas addObject:model];
    }
    
    // TableView.
    self.tableView                = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate       = self;
    self.tableView.dataSource     = self;
    self.tableView.rowHeight      = 50.f;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[AreaCell class] forCellReuseIdentifier:@"areaCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AreaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"areaCell" forIndexPath:indexPath];
    cell.model = self.datas[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AreaModel *model = self.datas[indexPath.row];
    
    if (!model.isExtend) { // 如果没有展开
        
        NSMutableArray *allChildren = model.childrenAndExtendedChildrenOfChildren;
        NSIndexSet *indexes = [NSIndexSet indexSetWithIndexesInRange:((NSRange){indexPath.row + 1, allChildren.count})];
        [_datas insertObjects:allChildren atIndexes:indexes];
        
        NSMutableArray *indexPaths = [NSMutableArray new];
        for (int i = 0; i < allChildren.count; i++) {
            [indexPaths addObject:[NSIndexPath indexPathForRow:indexPath.row + 1 + i inSection:indexPath.section]];
        }
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        
    } else { // 当前是展开状态
        
        NSMutableArray *allChildren = model.childrenAndExtendedChildrenOfChildren;
        [_datas removeObjectsInArray:allChildren];
        
        NSMutableArray *indexPaths = [NSMutableArray new];
        for (int i = 0; i < allChildren.count; i++) {
            [indexPaths addObject:[NSIndexPath indexPathForRow:indexPath.row + 1 + i inSection:indexPath.section]];
        }
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
    model.extend = !model.isExtend;
    
    AreaCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell handleSelectedEvent];
}

@end
