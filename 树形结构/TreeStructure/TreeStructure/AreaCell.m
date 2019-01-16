//
//  AreaCell.m
//  TreeStructure
//
//  Created by 乐升平 on 2018/12/26.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "AreaCell.h"
#import "AreaModel.h"
#import "IconEdgeInsetsLabel.h"

@interface AreaCell ()

@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *expendedColor;
@property (nonatomic, strong) UIColor *finalColor;

@property (nonatomic, strong) UIView              *leftSideView;
@property (nonatomic, strong) IconEdgeInsetsLabel *label;

@end
@implementation AreaCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.expendedColor   = [[UIColor redColor] colorWithAlphaComponent:0.95f];
        self.normalColor = [[UIColor blackColor] colorWithAlphaComponent:0.75f];
        self.finalColor    = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5f];
        
        [self buildSubview];
    }
    return self;
}

- (void)setModel:(AreaModel *)model {
    _model = model;
    self.label.text = model.text;
    [self.label sizeToFitWithText:model.text];
    
    CGRect labelFrame = self.label.frame;
    labelFrame.origin.x = 15.f + model.level * 35.f;
    self.label.frame = labelFrame;
    
    CGPoint labelCenter = self.label.center;
    labelCenter.y = self.bounds.size.height / 2.0;
    self.label.center = labelCenter;
    
    if (model.children) {
        self.label.textColor              = [UIColor darkTextColor];
        self.leftSideView.backgroundColor = model.extend ? self.expendedColor : self.normalColor;
        self.contentView.backgroundColor  = model.extend ? [UIColor whiteColor] : [[UIColor lightGrayColor] colorWithAlphaComponent:0.15];
    } else {
        self.label.textColor              = [UIColor lightGrayColor];
        self.leftSideView.backgroundColor = self.finalColor;
        self.contentView.backgroundColor  = [UIColor whiteColor];
    }
}

- (void)buildSubview {
    
    self.leftSideView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 4, 16.f)];
    self.leftSideView.backgroundColor = [UIColor blackColor];
    
    self.label           = [[IconEdgeInsetsLabel alloc] init];
    self.label.font      = [UIFont fontWithName:@"HYQiHei-BEJF" size:18.f];
    self.label.direction = kIconAtLeft;
    self.label.gap       = 5.f;
    self.label.iconView  = self.leftSideView;
    [self.contentView addSubview:self.label];
}

- (void)handleSelectedEvent {
    
    AreaModel *model = self.model;
    
    if (model.children.count) {
        
        self.label.textColor = [UIColor darkTextColor];
        
        [UIView animateWithDuration:0.25f delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            
            self.leftSideView.backgroundColor = model.extend ? self.expendedColor : self.normalColor;
            self.contentView.backgroundColor  = model.extend ? [UIColor whiteColor] : [[UIColor lightGrayColor] colorWithAlphaComponent:0.15];
            
        } completion:nil];
        
    } else {
        
        self.label.textColor              = [UIColor lightGrayColor];
        self.leftSideView.backgroundColor = self.finalColor;
        self.contentView.backgroundColor  = [UIColor whiteColor];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

}


@end
