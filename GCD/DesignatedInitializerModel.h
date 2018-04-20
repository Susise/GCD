//
//  DesignatedInitializerModel.h
//  GCD
//
//  Created by S on 2018/2/6.
//  Copyright © 2018年 S. All rights reserved.
//

/*
 为什么要用NS_DESIGNATED_INITIALIZER
 Objective-C 中主要通过NS_DESIGNATED_INITIALIZER宏来实现指定构造器的。这里之所以要用这个宏，往往是想告诉调用者要用这个方法去初始化（构造）类对象。
 
 怎样避免使用NS_DESIGNATED_INITIALIZER产生的警告
 如果子类指定了新的初始化器，那么在这个初始化器内部必须调用父类的Designated Initializer。并且需要重写父类的Designated Initializer，将其指向子类新的初始化器。
 
 避免使用new
 如果使用new来创建对象的话，即使init被声明为NS_UNAVAILABLE，也不会收到编译器的警告和错误提示了。
 
 如果定义NS_DESIGNATED_INITIALIZER，大多是不想让调用者调用父类的初始化函数，只希望通过该类指定的初始化进行初始化，这时候就可以用NS_UNAVAILABLE宏。
 如果调用者使用init 初始化，编译器就会给出一个编译错误。使用NS_UNAVAILABLE后，就不需要在.m中重写父类初始化函数了。如果要允许调用者使用init就需要在.m中重写父类的初始化函数，如上提到的，否则就会报警告
 */
#import <Foundation/Foundation.h>

@interface DesignatedInitializerModel : NSObject

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initMyObject NS_DESIGNATED_INITIALIZER;
- (instancetype)initMyObjctNondesignated;

@end

// 如果定义 NS_DESIGNATED_INITIALIZER ，大多是不想让调用者 调用父类的初始化函数，只希望通过该类的初始化进行初始化，这时候可以用NS_UNAVAILABLE宏

