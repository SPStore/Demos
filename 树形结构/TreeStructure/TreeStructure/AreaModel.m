//
//  AreaModel.m
//  TreeStructure
//
//  Created by 乐升平 on 2018/12/26.
//  Copyright © 2018 乐升平. All rights reserved.
//

#import "AreaModel.h"

@implementation AreaModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        if (self = [super init]) {
            [self setValuesForKeysWithDictionary:dictionary];
        }
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    if ([value isKindOfClass:[NSNull class]]) {
        return;
    }
    
    if ([key isEqualToString:@"level"]) {
        _level = [value integerValue];
        return;
    }
    
    if ([key isEqualToString:@"children"]) {
        NSMutableArray *children = [NSMutableArray array];
        for (id obj in value) {
            AreaModel *model = [[AreaModel alloc] initWithDictionary:obj];
            [children addObject:model];
        }
        _children = children;
        return;
    }
    
    [super setValue:value forKey:key];
}

- (NSMutableArray<AreaModel *> *)childrenAndExtendedChildrenOfChildren {
    NSMutableArray *array = [NSMutableArray array];
    [self addChildrenAndExtendedChildrenOfChildren:self toArray:array];
    return array;
}

- (void)addChildrenAndExtendedChildrenOfChildren:(AreaModel *)model toArray:(NSMutableArray *)array {
    for (AreaModel *subModel in model.children) {
        [array addObject:subModel];
        if (subModel.isExtend) {
            [self addChildrenAndExtendedChildrenOfChildren:subModel toArray:array];
        }
    }
}


@end
