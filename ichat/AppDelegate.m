//
//  AppDelegate.m
//  ichat
//
//  Created by whh on 16/4/8.
//  Copyright © 2016年 王恒辉. All rights reserved.
//

#import "AppDelegate.h"
#import "EMSDK.h"


#import "WHHLoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    
   NSString * isLogin = [[NSUserDefaults standardUserDefaults] objectForKey:@"isLogin"];
    
    if ([isLogin isEqualToString:@"YES"]) {
        
    }else {
        WHHLoginViewController *login = [[WHHLoginViewController alloc] init];
        _window.rootViewController = login;
    }
    
    //集成环信
    EMOptions *options = [EMOptions optionsWithAppkey:@"00466120#ichat"];
    options.apnsCertName = @"istore_dev";
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    return YES;
}

- (void)changeRootViewController {
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[EMClient sharedClient] applicationDidEnterBackground:application];
    
}

//将要进入前台(从后台返回)
- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[EMClient sharedClient] applicationWillEnterForeground:application];
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
