//
//  LineLayoutViewController.m
//  LineLayout
//
//  Created by 乐升平 on 2018/12/27.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "LineLayoutViewController.h"
#import "LineLayout.h"
#import "ComplexLineLayout.h"
//#import "LineLayoutCollectionViewDebugCell.h"
#import "LineLayoutCollectionViewCell.h"
#import "LineLayoutModel.h"
#import "Masonry.h"


@interface LineLayoutViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray <LineLayoutModel *> *dataSource;
@property (nonatomic, strong) UICollectionView                   *collectionView;
@property (nonatomic, strong) UICollectionViewLayout             *layout;

@end

@implementation LineLayoutViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *urls = @[@"http://img.kaiyanapp.com/c8053cc58e79b060c7ad741c7b19a55b.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http:/img.kaiyanapp.com/2908c01391c91b8ac2866d02450dfd8f.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/c372b82b4912b6a4e1574b591b44f5f0.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/50e24ccdc1be51bee8ef832f32ad4f90.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/2363b8e357d4a8c7ea1c53c0e089116e.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/b132114219a2d25cdf31f964f45df0ea.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/7be08a6a01d0ec82185660bdc94d0fd6.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/c6b821f2ea71f7ed8cd8da47fac67e9c.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/b4770658a531444433b46cd2b74fd6e4.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/af225c0a0a5a48c40d934276fd443a81.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/c9a39cfc001485b6e87fd2cb2408938e.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/40ad76cb505bc69aebcf962c54933b8c.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/8982a96938b064b58f0b658d0e21ab82.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/b097edc51663a56c0d1930e56c09462e.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/4127a79097ce6cd136b23b2569b38ea4.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/8f387a6785e22c7442f0e8528bb30d0b.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/e59f6a014164762f854a18fd7802fe76.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/97f621408797ad050a3bbc6c4eeae5a6.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/76ee6a3ec5d0a5fcdae87c8d6fb3e169.jpeg?imageMogr2/quality/60/format/jpg",
                      @"http://img.kaiyanapp.com/9c9b87a3e3e23c92ed8da0225ba5f0fa.png?imageMogr2/quality/60/format/jpg",
                      ];
    self.dataSource = [NSMutableArray array];
    // 数据源
    for (int i = 0; i < urls.count; i++) {
        LineLayoutModel *model = [[LineLayoutModel alloc] init];
        model.urlString = urls[i];
        [self.dataSource addObject:model];
    }
    
    // 布局文件
    self.layout                         = _layoutType == 0 ? [LineLayout new] : [ComplexLineLayout new];
    self.collectionView                 = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
    self.collectionView.delegate        = self;
    self.collectionView.dataSource      = self;
    self.collectionView.contentInset    = UIEdgeInsetsMake(10, 50, 10, 50);
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[LineLayoutCollectionViewCell class] forCellWithReuseIdentifier:@"lineLayoutCell"];
    
    // collectionView的一些配置
    self.collectionView.layer.borderWidth = 0.5f;
    self.collectionView.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.5f].CGColor;
    self.collectionView.showsVerticalScrollIndicator   = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
        make.height.equalTo(self.view).multipliedBy(0.3f);
    }];
    
    // debug用,显示UICollectionView的contentInset区域
    if (_isDebug) {
        
        UIView *debugView                = [UIView new];
        debugView.backgroundColor        = [[UIColor yellowColor] colorWithAlphaComponent:0.05f];
        debugView.userInteractionEnabled = NO;
        debugView.layer.borderWidth      = 0.5f;
        debugView.layer.borderColor      = [[UIColor grayColor] colorWithAlphaComponent:0.15f].CGColor;
        [self.view addSubview:debugView];
        [debugView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            UIEdgeInsets contentInsets = self.collectionView.contentInset;
            
            make.center.equalTo(self.view);
            make.left.equalTo(self.collectionView.mas_left).offset(contentInsets.left);
            make.right.equalTo(self.collectionView.mas_right).offset(-contentInsets.right);
            make.top.equalTo(self.collectionView.mas_top).offset(contentInsets.top);
            make.bottom.equalTo(self.collectionView.mas_bottom).offset(-contentInsets.bottom);
        }];
    }
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LineLayoutCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"lineLayoutCell" forIndexPath:indexPath];
    cell.model                         = self.dataSource[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

@end
