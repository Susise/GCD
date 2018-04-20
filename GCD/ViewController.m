//
//  ViewController.m
//  GCD
//
//  Created by S on 2018/2/1.
//  Copyright © 2018年 S. All rights reserved.
//

#import "ViewController.h"

#import "DesignatedInitializerModel.h"//指定初始化函数



@interface ViewController ()

//@property  ( nonatomic,strong )

@end

@implementation ViewController

//- (instancetype)init{
//    return [self initWithName:@""];
//    
//}
//- (instancetype)initWithCoder:(NSCoder *)aDecoder{
//    return [self initWithName:@""];
//}
//- (instancetype)initWithName:(NSString *)name{
//    self = [super initWithCoder:[NSCoder new]];
//    if (self) {
//     //do something
//    }
//    return self;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self testGCDTest];
    
//    [self gcdcommication];
    
//    [self testgroup];
    
//    [self testsemaphore];
    
    [self testsynchronization];
}
- (void)testnewObject{//指定初始化函数
    
    DesignatedInitializerModel *obj = [[DesignatedInitializerModel alloc] init];
    
}
- (void)testsemaphore1{
    /*
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    for (int i = 0; i<100; i++) {
//        NSLog(@"%i",i);
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        
        dispatch_group_async(group, queue, ^{
            
            NSLog(@"%@",[NSThread currentThread]);
            
            
//            sleep(2);
            
            dispatch_semaphore_signal(semaphore);
            
//            NSLog(@"%i",i);
            
        });
    }
    */
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    for (int i = 0; i< 10; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%@",[NSThread currentThread]);
        });
    }
    
    NSLog(@"Come Here");
    
}
- (void)testsemaphore{//信号量
    
    //1 、信号量的使用情况  一个控制器页面并发多个网络请求，页面的展示需要多个网络请求后的数据 （超过一个网络接口请求）
    
    //2 、使用目的 等待所有网络请求完后，页面再展示所有数据
    
    //3 、信号量如何使用
    
    //3.1 创建是有信号量属性
    
    
 
}
- (void)testsynchronization{//线程同步
    //线程不同步的主要原因在于 多个线程可能同时操作某个对象，从而导致状态不一致的问题。主队列是 串行队列 。
    
    //既然要实现线程同步，首先需要创建串行队列
    
    dispatch_queue_t queue = dispatch_queue_create("sunqiaoqiao", 0);
    dispatch_queue_t dqueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_set_target_queue(queue, dqueue);
    
    
}

- (void)testgroup{
    
    NSLog(@"开始执行");
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_queue_create(0, 0);
    
    dispatch_group_enter(group);//enter 函数之后 异步都会加入group中
    
    dispatch_async(queue, ^{
        NSLog(@"1");
        
        dispatch_group_leave(group);
        
    });
    
    dispatch_group_enter(group);//enter 函数之后 异步都会加入group中
    
    dispatch_async(queue, ^{
        NSLog(@"2");
        
        dispatch_group_leave(group);
        
    });
    
    dispatch_group_enter(group);//enter 函数之后 异步都会加入group中
    
    dispatch_async(queue, ^{
        NSLog(@"3");
        
        dispatch_group_leave(group);
        
    });
    
    dispatch_group_enter(group);//enter 函数之后 异步都会加入group中
    
    dispatch_async(queue, ^{
        NSLog(@"4");
        
        dispatch_group_leave(group);
        
    });
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER); //阻塞，等所有任务都执行完毕之后，才继续执行后面的代码
    
//    dispatch_group_notify(group, queue, ^{
//        NSLog(@"最后执行");
//    });
    NSLog(@"所有任务都完成了");
    
    //栅栏函数只能用在 调度并发队列中，不能用在全局并发队列中
    
}

- (void)gcdcommication{//线程通信
    
    //开启一个全局队列的子线程
    /*
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"在子线程");
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"我已经回到主线程了");
        });
        
    });
     */
    
    //自定义队列，开启新的子线程
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i=0; i<10; i++) {
        dispatch_async(queue, ^{
           
            NSLog(@"并行队列 %@ ",[NSThread currentThread]);
            
            dispatch_async(dispatch_get_main_queue(), ^{
               
                NSLog(@"现在在主线程");
            });
        });
    }
    
    //延迟调用某个方法
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"在主线程延迟5秒调用");
    });
    
    //线程休眠几秒
    sleep(6);
    
    //总结 常用的线程通信有以下几种。
    // 回到主线程更新UI操作
    dispatch_async(dispatch_get_main_queue(), ^{
       //刷新UI
    });
    
    //有时候省去麻烦，我们使用系统的全局队列，一般用这个处理遍历大数据查询操作 (系统中有一个默认的子线程，叫做global_queue)
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    });
    //当开发中遇到一些数据需要但线程访问的时候，我们可以采取同步线程的做法，保证数据的正常执行，当我们写入一些数据的时候，同步操作，后面所有的任务都要等待当前线程的执行
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
       //同步线程操作可以保证数据的安全完整性
    });
    
    
}

- (void)testGCDTest{//GCD常用的方法 线程安全，加互斥锁
    //1、延迟执行 （两种方式）
    
    [self performSelector:@selector(runwithdelay:) withObject:@"123" afterDelay:2];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self runwithdelay:@2];
    });
    
    //这两种方式的共同前提，当前线程里面需要有一个运行的runloop并且这个runloop里面有一个timer。主线程在创建的额时候默认自动运行一个runloop，病着这个runloop里面有一个timer，普通的子线程是没有这些的。performSelector的延时调用，其实是缺乏安全性的，不能保证线程安全。子线程是没有定时器的，如果把延时，放在子线程调用，是调用不了的，因为子线程没有定时器
    
    
    //2、一次性代码 、整个程序运行过程，只会执行一次 （单例的使用）
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //只执行一次 这里面默认是线程安全的
        
    });
    //3、队列组
    //从网络上下载两张图片，把两张图片合并成一张，并最终显示在view上
    
    //4、栅栏函数
    //栅栏函数 同步函数没必要控制顺序，因为他本身就是有序的，dispatch_barrier_async 是异步函数，不会组设线程 dispatch_barrier_sync 是同步函数，会阻塞线程 如果所有任务都痛同一个并行队列中，病着这个并行队列不是系统自带全局并行队列，那么在barrier之前添加的方法会先被执行，只有等barrier之前的任务执行完毕后才知性barrier任务
    dispatch_queue_t queue = dispatch_queue_create("sunqiaoqiao", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"任务1");
    });
    dispatch_async(queue, ^{
        NSLog(@"任务2");
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"我是可爱的路障");
    });
    dispatch_async(queue, ^{
        NSLog(@"任务3");
    });
    dispatch_async(queue, ^{
        NSLog(@"任务4");
    });
    
    NSLog(@"END");
    
    //5、队列组的使用dispatch_gropu_t
    // 方式一：创建一个队列组
    dispatch_group_t group = dispatch_group_create();
    
    //创建两个不同的队列来测试
    dispatch_queue_t queue1 = dispatch_get_global_queue(0, 0);
    
    dispatch_queue_t queue2 = dispatch_queue_create("song", DISPATCH_QUEUE_CONCURRENT);//并发队列
    
    dispatch_group_async(group, queue1, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"download1");
    });
    
    dispatch_group_async(group, queue2, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"download2");
    });
    
    //给group 添加一个通知，异步函数 当group队列中所有的任务执行完毕，就会通知group执行block
    dispatch_group_notify(group, queue2, ^{//第一个参数：为那个队列组添加通知 第二个参数：决定block在什么线程中执行 第三个参数：block代码块
        NSLog(@"group里的任务都执行完了");
    });
    NSLog(@"ENDEND");
    //方式二：
    /*
    dispatch_queue_t globalqueue = dispatch_get_global_queue(0, 0);
    
    //创建一个队列组
    dispatch_group_t groupp  = dispatch_group_create();
    
    //通知队列组 进入队列组
    dispatch_group_enter(groupp);
    
    dispatch_async(globalqueue, ^{
        NSLog(@"111");
        
        //任务执行完毕，通知队列组离开队列组
        dispatch_group_leave(groupp);
    });
    
    //通知队列组进入队列组
    dispatch_group_enter(groupp);
    
    dispatch_async(globalqueue, ^{
        NSLog(@"222");
        // 任务执行完毕，通知队列组离开队列组
        dispatch_group_leave(groupp);
    });
    
    //等待所有任务执行完毕，一直等待，会阻塞线程
    dispatch_group_wait(groupp, DISPATCH_TIME_FOREVER);
    */
    
    //6、GCD定时器
    dispatch_queue_t que6 = dispatch_queue_create("yy", DISPATCH_QUEUE_SERIAL);
    //创建一个GCD定时器（触发器）
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, que6);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0.0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
    //启动定时器
    dispatch_resume(timer);
    
    //7、信号量
    
    
}
-(void)runwithdelay:(id)object{
//    NSLog(@"%@",object);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
