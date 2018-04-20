//
//  AppDelegate.m
//  GCD
//
//  Created by S on 2018/2/1.
//  Copyright © 2018年 S. All rights reserved.
//

#import "AppDelegate.h"

/*
 1、UIApplication对象是应用程序的象征，一个UIapplication对象就代表一个应用程序
 2、每一个应用都有自己的UIapplication对象，而且是单例的。如果试图在程序中新建一个UIApplication对象，那么将报错提示
 3、通过[UIApplication shareApplication]可以获取到这个单例对象
 4、一个iOS程序启动后创建的第一个对象就是UIApplication对象，且只有一个，通过代码获取两个UIApplicaiton对象，打印地址可以看出地址是相同的
 5、利用UIApplication对象，能进行一些应用级别的操作
 
 #应用级别的操作示例
 1、设置应用程序图标右上角的红色的提醒数字
 2、设置联网指示器的可见性
 3、管理状态栏
 4、发短信
 5、发邮件
 6、打开一个网页资源
 7、打开其他app程序
 
 UIApplication Delegate
 1、简单说明 所有移动操作系统都有个致命的确定，app很容易收到打扰，比如说一个来电，或者锁屏会导致app进入后台甚至被终止，还有很多其他类似的情况会导致app受到干扰，在app受到干扰时，会产生一些系统时间，这时，UIApplication 会通知他的delegate对象，让delegate对象来处理这些系统事件
 
 
 */

@interface AppDelegate ()



@end

@implementation AppDelegate

//app启动完毕调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    application.applicationIconBadgeNumber = 20;//设置图标右上角的数字
    
    application.networkActivityIndicatorVisible = YES;//设置指示器的联网动画
    
    //iOS7以后，系统提供了两种管理状态栏的方式
    //1 、 通过viewcontroller管理，每一个viewcontroller都可以拥有自己不同的状态栏
    //2、通过UIApplication管理，一个应用程序的状态栏都由他统一管理，如果想利用UIApplication来管理状态栏，首先修改info.plist
    
    
    return YES;
}

//程序将要进入非活动状态执行，在此期间，应用程序不接收消息或事件
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

//当程序被推送到后台的时候调用，所以要设置后台继续运行，则在这个函数里面设置即可
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
//当程序要从后台将要重新回到前台的时候调用
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

//当应用程序进入活动状态时候执行
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

//当应用程序将要退出的时候被调用，通常是用来保存数据和一些退出前的清理工作
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
//app收到内存警告时调用
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    
}

@end
