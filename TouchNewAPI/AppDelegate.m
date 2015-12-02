//
//  AppDelegate.m
//  TouchNewAPI
//
//  Created by 邓杰豪 on 15/9/29.
//  Copyright © 2015年 邓杰豪. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()
{
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    MainViewController *mainView = [[MainViewController alloc] init];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainView];
    self.window.rootViewController = mainNav;
    [self.window makeKeyAndVisible];

    // Override point for customization after application launch.
    UIApplicationShortcutItem *shortItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"斋打开" localizedTitle:@"斋打开"];
    UIApplicationShortcutItem *shortItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"弹框" localizedTitle:@"弹框"];
    NSArray *shortItems = [[NSArray alloc] initWithObjects:shortItem1, shortItem2, nil];
    NSLog(@"%@", shortItems);
    [[UIApplication sharedApplication] setShortcutItems:shortItems];
    return YES;
}

+ (AppDelegate *)appDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    if ([shortcutItem.localizedTitle  isEqual: @"弹框"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OPPS!" message:@"我的CTO叫佛山强" delegate:self cancelButtonTitle:@"哦" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
}
@end
