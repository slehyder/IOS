//
//  AppDelegate.m
//  Cleanpress
//
//  Created by eris ramirez on 7/2/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "Stripe.h"

NSString * const StripePublishKey = @"pk_test_3u73LKq4VFFvVEki96yWWu80";
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    
    //Stripe connection
    
    [Stripe setDefaultPublishableKey:StripePublishKey];
    
    //Parse enable connection
    [Parse enableLocalDatastore];
    [Parse setApplicationId:@"vHjieX1nOgzeOy0hFcZVOecTMLSWBaubIkHW0a7X" clientKey:@"7W0EalICPRyz5ybOnCAm1nhUHYttZtkMv0vJKZ7U"];
    PFUser *currentUser = [PFUser currentUser];
   
    
    if (currentUser) {
    
        // do stuff with the user
        
      
                UIViewController *test=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Mainly"];
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test];
                self.window.rootViewController = nav;
            
        
        
        
    } else {
        // show the signup or login screen
        UIViewController *test=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainWithoutLog"];
        //UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:test];
        self.window.rootViewController = test;
    }
    
    
    

    return YES;
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

@end
