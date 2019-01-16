//
//  LineLayoutCollectionViewCell.m
//  Animations
//
//  Created by YouXianMing on 2017/10/30.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

#import "LineLayoutCollectionViewCell.h"
#import "LineLayoutModel.h"
#import "Masonry.h"
#import "AutolayoutPlaceholderImageView.h"

@interface LineLayoutCollectionViewCell ()

@property (nonatomic, strong) UIView                         *areaView;
@property (nonatomic, strong) AutolayoutPlaceholderImageView *iconImageView;

@end

@implementation LineLayoutCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildSubview];
    }
    return self;
}

- (void)buildSubview {
    
    self.iconImageView                  = [AutolayoutPlaceholderImageView new];
    self.iconImageView.placeholderImage = [UIImage imageNamed:@"详情默认图"];
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(3);
        make.right.mas_equalTo(-3);
        make.top.mas_equalTo(3);
        make.bottom.mas_equalTo(-3);
    }];
}

- (void)setModel:(LineLayoutModel *)model {
    _model = model;
    self.iconImageView.urlString = _model.urlString.length ? _model.urlString : @"";
}


@end
