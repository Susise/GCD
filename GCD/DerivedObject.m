//
//  DerivedObject.m
//  GCD
//
//  Created by S on 2018/2/7.
//  Copyright © 2018年 S. All rights reserved.
//

#import "DerivedObject.h"

@implementation DerivedObject

- (instancetype)initMyObject2{
    self = [super init];
    return self;
}
- (instancetype)initMyObject3{
    self = [self initMyObjctNondesignated];
    return self;
}
- (instancetype)initMyObject4{
    self = [super initMyObject];
    return self;
}
- (instancetype)initMyObject5{
    self = [self init];
    return self;
}
- (instancetype)initMyObject6{
    self = [self initMyObject4];
    return self;
}
- (instancetype)initMyObject7{
    self = [self initMyObject];
    return self;
}
@end
