//
//  AppDelegate.m
//  TaxpayerId
//
//  Created by MaxWellPro on 2017/7/27.
//  Copyright © 2017年 QuanYanTech. All rights reserved.
//

#import "AppDelegate.h"

#import "NSString+TaxpayerId.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    NSArray *taxpayerIds = @[
                             @"914403003599318723",
                             @"110105796721929",
                             @"31004310000595X",
                             @"310104607388152",
                             @"310104789576006",
                             @"130111732910720",
                             @"222426786849398",
                             @"440100699718840",
                             @"91210231696043083E",
                             @"91370100061173669Y",
                             @"913700001630477270",
                             @"140111701134730",
                             @"190111701134730"// 错误号码
                             ];
    
    for (NSString *taxpayerId in taxpayerIds) {
        NSLog(@"%d",[taxpayerId checkTaxpayerId]);
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
