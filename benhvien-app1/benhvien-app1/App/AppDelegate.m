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
#import <GoogleMaps/GoogleMaps.h>
#import "ApiEndpoint.h"
#import "FirstLoginViewController.h"
#import "BaseTabBarController.h"
#import <HNKGooglePlacesAutocomplete/HNKGooglePlacesAutocompleteQuery.h>
#import "UserDataManager.h"
#import "AccountViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [self setupFirstLoginScreen];
//    [self setupHomeScreen1];
    if ([UserDataManager sharedClient].accessToken && [UserDataManager sharedClient].accessToken.length > 0) {
        [self setupHomeScreen1];
    }else {
        [self setupFirstLoginScreen];
    }
    [self setupApplicationTheme];
    [self setupApplicationData];
    [HNKGooglePlacesAutocompleteQuery setupSharedQueryWithAPIKey:GoogleApiKey];
    return YES;
}

- (void)setupApplicationData {
    [GMSServices provideAPIKey:GoogleApiKey];
    [OCDirectionsAPIClient provideAPIKey:GoogleApiKey];
}

- (void)setupFirstLoginScreen {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    FirstLoginViewController *vc = (FirstLoginViewController *)[FirstLoginViewController instanceFromStoryboardName:@"Home"];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
}

- (void)setupHomeScreen {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
   HomeViewController *vc = (HomeViewController *)[HomeViewController instanceFromStoryboardName:@"Home"];
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
}

- (void)setupHomeScreen1 {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    AccountViewController *accountVC = (AccountViewController *)[AccountViewController instanceFromStoryboardName:@"Home"];
    BaseNavigationController *accountNav = [[BaseNavigationController alloc] initWithRootViewController:accountVC];
     
    HomeViewController *homeVC = (HomeViewController *)[HomeViewController instanceFromStoryboardName:@"Home"];
    BaseNavigationController *homeNav = [[BaseNavigationController alloc] initWithRootViewController:homeVC];

    AppInfoViewController *appInfoVC = (AppInfoViewController *)[AppInfoViewController instanceFromStoryboardName:@"Home"];
    BaseNavigationController *appInfonNav = [[BaseNavigationController alloc] initWithRootViewController:appInfoVC];
    
    BaseTabBarController *tab = [BaseTabBarController new];
    tab.viewControllers = @[accountNav, homeNav , appInfonNav];
    tab.selectedIndex = 1;
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible];
}

- (void)setupApplicationTheme {
    [UINavigationBar appearance].barTintColor = [UIColor colorWithHex:0xd2232a];
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    NSDictionary *titleAttr=[[NSDictionary alloc]initWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil];
    [UINavigationBar appearance].titleTextAttributes =titleAttr ;
}

@end
