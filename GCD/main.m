//
//  main.m
//  GCD
//
//  Created by S on 2018/2/1.
//  Copyright © 2018年 S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

/*
 程序启动原理
 
 
 main 函数中执行了一个 UIApplicationMain 函数，argc 、argv 直接传递给UIApplicationMain进行处理就可以
 principalClassName 指定应用程序类名，app的象征，该类必须是UIApplication或者子类，如果味nil，则使用UIApplication类作为默认值
 delegateClassName 制定应用程序的代理类，该类必须遵守UIApplicationDelegate协议
 UIApplicationMain函数会根据pricipalClassName创建UIApplication对象，根据delegateClassName创建一个delegate对象，并将该delegate对象赋值给UIApplication对象中的delegate属性，接着会创建应用程序的Main Runloop（事件循环）进行事件处理
 程序正常退出时，UIApplicationMain 函数才返回
 
 */
