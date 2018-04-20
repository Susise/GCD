//
//  DerivedObject.h
//  GCD
//
//  Created by S on 2018/2/7.
//  Copyright © 2018年 S. All rights reserved.
//

#import "DesignatedInitializerModel.h"

@interface DerivedObject : DesignatedInitializerModel

- (instancetype)initMyObject2;

- (instancetype)initMyObject3;

- (instancetype)initMyObject4 NS_DESIGNATED_INITIALIZER;

- (instancetype)initMyObject5;

- (instancetype)initMyObject6 NS_DESIGNATED_INITIALIZER;

- (instancetype)initMyObject7;

@end
