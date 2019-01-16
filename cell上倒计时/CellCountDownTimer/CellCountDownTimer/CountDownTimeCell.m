//
//  CountDownTimeCell.m
//  CellCountDownTimer
//
//  Created by 乐升平 on 2018/12/28.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "CountDownTimeCell.h"
#import "TimeModel.h"

@interface CountDownTimeCell ()

@property (nonatomic, strong) UIView   *backView;
@property (nonatomic, strong) UILabel  *titleLabel;
@property (nonatomic, strong) UILabel  *countdownLabel;

@end

@implementation CountDownTimeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCell];
        [self buildSubview];
    }
    return self;
}

- (void)setupCell {
    
    [self registerNSNotificationCenter];
    self.selectionStyle  = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2f];
}

- (void)buildSubview {
    
    CGFloat Width = [UIScreen mainScreen].bounds.size.width;
    self.backView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 59.5f)];
    self.backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.backView];
    
    {
        self.titleLabel           = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, Width - 20, 40)];
        self.titleLabel.textColor = [UIColor grayColor];
        self.titleLabel.font      = [UIFont fontWithName:@"HYQiHei-BEJF" size:20.f];;
        [self.backView addSubview:self.titleLabel];
        
        self.countdownLabel               = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, Width - 20, 40)];
        self.countdownLabel.textColor     = [UIColor grayColor];
        self.countdownLabel.textAlignment = NSTextAlignmentRight;
        self.countdownLabel.font          = [UIFont fontWithName:@"Avenir" size:15.f];
        [self.backView addSubview:self.countdownLabel];
    }
}

- (void)setModel:(TimeModel *)model {
    _model = model;
    self.titleLabel.text     = model.title;
    self.countdownLabel.text = [model currentTimeString];
}

- (void)dealloc {
    
    [self removeNSNotificationCenter];
}

#pragma mark - 通知中心
- (void)registerNSNotificationCenter {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationCenterEvent:)
                                                 name:NSNotificationCountDownTimeCell
                                               object:nil];
}

- (void)removeNSNotificationCenter {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSNotificationCountDownTimeCell object:nil];
}

- (void)notificationCenterEvent:(id)sender {
    
    if (self.display) {
        
        self.model = self.model;
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
