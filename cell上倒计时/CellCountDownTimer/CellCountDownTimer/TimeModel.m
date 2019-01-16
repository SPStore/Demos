//
//  TimeModel.m
//  CellCountDownTimer
//
//  Created by 乐升平 on 2018/12/28.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "TimeModel.h"

@implementation TimeModel

+ (instancetype)timeModelWithTitle:(NSString *)title countdownTime:(NSNumber *)countdownTime {
    
    TimeModel *model    = [[[self class] alloc] init];
    
    model.title         = title;
    model.countdownTime = countdownTime;
    
    return model;
}

- (void)countDown {
    
    _countdownTime = @(_countdownTime.integerValue - 1);
}

- (NSString *)currentTimeString {
    
    NSInteger seconds = _countdownTime.integerValue;
    
    if (seconds <= 0) {
        
        return @"00:00:00";
        
    } else {
        
        return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)(seconds / 3600), (long)(seconds % 3600 / 60), (long)(seconds  % 60)];
    }
}

@end
