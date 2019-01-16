//
//  AreaCell.h
//  TreeStructure
//
//  Created by 乐升平 on 2018/12/26.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AreaModel;

NS_ASSUME_NONNULL_BEGIN

@interface AreaCell : UITableViewCell

@property (nonatomic, strong) AreaModel *model;

- (void)handleSelectedEvent;

@end

NS_ASSUME_NONNULL_END
