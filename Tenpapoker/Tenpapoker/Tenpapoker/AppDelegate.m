//
//  AppDelegate.m
//  Tenpapoker
//
//  Created by adin on 2024/4/3.
//

#import "AppDelegate.h"
#import <AppsFlyerLib/AppsFlyerLib.h>
#import "TENPmess.h"
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [[AppsFlyerLib shared] setAppsFlyerDevKey:@"HsW4oGvBzejNfJfXuMuNQD"];
    [[AppsFlyerLib shared] setAppleAppID:@"6480517571"];
    
    [[AppsFlyerLib shared] waitForATTUserAuthorizationWithTimeoutInterval:18];
    [AppsFlyerLib shared].delegate = self;
    [[AppsFlyerLib shared] start];
    
    [TENPmess setAfuuid:[self gitid]];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *myViewController = [storyboard instantiateViewControllerWithIdentifier:@"viewload"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = myViewController;
    [self.window makeKeyAndVisible];
  
    
    return YES;
}

- (void)onConversionDataFail:(nonnull NSError *)error {
    NSString* af_status = @"";
}

- (void)onConversionDataSuccess:(nonnull NSDictionary *)conversionInfo {
    NSString* af_status = [conversionInfo objectForKey:@"af_status"];
    if (af_status == nil) {
        af_status = @"";
    }
   // [ViewController setAfSources:af_status];
}

- (NSString *)gitid {
    NSString* afid = [[AppsFlyerLib shared] getAppsFlyerUID];
    if (afid == nil){
        afid = @"";
    }
    return afid;
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.5f*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        if (@available(iOS 14, *)) {
            if (ATTrackingManager.trackingAuthorizationStatus == ATTrackingManagerAuthorizationStatusNotDetermined) {
                [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus s) {}];
            }
        }
    });
}


@end
