//
//  CountDownTimeCell.h
//  CellCountDownTimer
//
//  Created by 乐升平 on 2018/12/28.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString  *NSNotificationCountDownTimeCell = @"NSNotificationCountDownTimeCell";

@class TimeModel;
@interface CountDownTimeCell : UITableViewCell

@property (nonatomic, strong) TimeModel *model;

@property (nonatomic, assign) BOOL display;

@end

NS_ASSUME_NONNULL_END
