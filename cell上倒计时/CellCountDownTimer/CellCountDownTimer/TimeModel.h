//
//  TimeModel.h
//  CellCountDownTimer
//
//  Created by 乐升平 on 2018/12/28.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimeModel : NSObject

@property (nonatomic, copy)   NSString  *title;
@property (nonatomic, strong) NSNumber  *countdownTime;

/**
 *  便利构造器
 *
 *  @param title         标题
 *  @param countdownTime 倒计时
 *
 *  @return 实例对象
 */
+ (instancetype)timeModelWithTitle:(NSString *)title countdownTime:(NSNumber *)countdownTime;

/**
 *  计数减1(countdownTime - 1)
 */
- (void)countDown;

/**
 *  将当前的countdownTime信息转换成字符串
 */
- (NSString *)currentTimeString;

@end

static inline  TimeModel * TimeModelWithTitle(NSString *title, NSNumber *countdownTime) {
    
    return [TimeModel timeModelWithTitle:title countdownTime:countdownTime];
}

NS_ASSUME_NONNULL_END
