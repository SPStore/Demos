//
//  AreaModel.h
//  TreeStructure
//
//  Created by 乐升平 on 2018/12/26.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AreaModel : NSObject
@property (nonatomic, copy)   NSString                      *text;
@property (nonatomic)         NSInteger                      level;
@property (nonatomic, strong) NSMutableArray <AreaModel *>  *children;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/**
 设定展开还是缩放 [ extend为NO时,返回空的数组,为YES时,返回当前级别的submodels ]
 */
@property (nonatomic,getter=isExtend) BOOL extend;

/**
 通过递归方式获取子模型以及子模型当中展开的子模型
 */
@property (nonatomic, strong, readonly) NSMutableArray <AreaModel *>  *childrenAndExtendedChildrenOfChildren;
@end

NS_ASSUME_NONNULL_END
