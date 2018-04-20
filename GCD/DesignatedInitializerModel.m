//
//  DesignatedInitializerModel.m
//  GCD
//
//  Created by S on 2018/2/6.
//  Copyright © 2018年 S. All rights reserved.
//

#import "DesignatedInitializerModel.h"

@implementation DesignatedInitializerModel

- (instancetype)init{
    return [self initMyObject];
}
- (instancetype)initMyObject{
    self = [super init];// 因为NSObject 的init也是Designated_initializer
    return self;
}
- (instancetype)initMyObjctNondesignated{
    self = [self initMyObject];
    return self;
}

@end
