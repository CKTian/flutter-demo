#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "FlutterNativePlugin.h"
#import "MyPlatformViewFactory.h"
#import <BMKLocationkit/BMKLocationComponent.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    [FlutterNativePlugin registerWithRegistrar:[self registrarForPlugin:@"FlutterNativePlugin"]];
//    [MyPlatformViewFactory registerWithRegistrar:[self registrarForPlugin:@"MyPlatformViewFactory"]];
    MyPlatformViewFactory *myPlatformViewFactory = [[MyPlatformViewFactory alloc] init];
        [[self registrarForPlugin:@"Lipuzhi"] registerViewFactory:myPlatformViewFactory withId:@"MyUiKitViewDemo"];
    
//  // Override point for customization after application launch.
//    // 初始化定位SDK
//    [[BMKLocationAuth sharedInstance] checkPermisionWithKey:@"mrLRdHXhXazviLP10yNDXdjNLr1IkSGx" authDelegate:self];
//    //要使用百度地图，请先启动BMKMapManager
//    _mapManager = [[BMKMapManager alloc] init];
//
//    /**
//     百度地图SDK所有API均支持百度坐标（BD09）和国测局坐标（GCJ02），用此方法设置您使用的坐标类型.
//     默认是BD09（BMK_COORDTYPE_BD09LL）坐标.
//     如果需要使用GCJ02坐标，需要设置CoordinateType为：BMK_COORDTYPE_COMMON.
//     */
//    if ([BMKMapManager setCoordinateTypeUsedInBaiduMapSDK:BMK_COORDTYPE_BD09LL]) {
//        NSLog(@"经纬度类型设置成功");
//    } else {
//        NSLog(@"经纬度类型设置失败");
//    }
//
//    //启动引擎并设置AK并设置delegate
//    BOOL result = [_mapManager start:@"Please enter your key" generalDelegate:self];
//    if (!result) {
//        NSLog(@"启动引擎失败");
//    }
//
////    BMKCataloguePage *cataloguePage = [[BMKCataloguePage alloc] init];
////    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:cataloguePage];
////    [self.window setRootViewController:navigationController];
////    self.window.backgroundColor = [UIColor whiteColor];
////    [self.window makeKeyAndVisible];
//
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

/**
// 联网结果回调
//
// @param iError 联网结果错误码信息，0代表联网成功
// */
//- (void)onGetNetworkState:(int)iError {
//    if (0 == iError) {
//        NSLog(@"联网成功");
//    } else {
//        NSLog(@"联网失败：%d", iError);
//    }
//}
//
///**
// 鉴权结果回调
//
// @param iError 鉴权结果错误码信息，0代表鉴权成功
// */
//- (void)onGetPermissionState:(int)iError {
//    if (0 == iError) {
//        NSLog(@"授权成功");
//    } else {
//        NSLog(@"授权失败：%d", iError);
//    }
//}

@end
