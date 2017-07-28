//
//  AppDelegate.m
//  benhvien-app1
//
//  Created by 507-8 on 7/28/17.
//  Copyright © 2017 507-8. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "BaseNavigationController.h"
#import "UIViewController+Storyboard.h"
#import "UIColor+Hex.h"
#import "HomeViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupApplicationTheme];
    [self setupHomeScreen];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}
- (void)setupHomeScreen {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
   HomeViewController *vc = (HomeViewController *)[HomeViewController instanceFromStoryboardName:@"Home"];
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
}

-(void)setupApplicationTheme{
    [UINavigationBar appearance].barTintColor = [UIColor colorWithHex:0x2232a];
    [UINavigationBar appearance].barTintColor = [UIColor whiteColor];
    NSDictionary *titleAttr=[[NSDictionary alloc]initWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil];
    [UINavigationBar appearance].titleTextAttributes =titleAttr ;
}

@end
