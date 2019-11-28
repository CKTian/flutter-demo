#import "FlutterNativePlugin.h"
/// Tool
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Map/BMKPointAnnotation.h>
#import <BaiduMapAPI_Map/BMKLocationViewDisplayParam.h>

@implementation FlutterNativePlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"baidu" binaryMessenger:[registrar messenger]];
    FlutterNativePlugin *instance = [[FlutterNativePlugin alloc]init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([call.method isEqualToString:@"gps"]) {
        result(@"么么哒");
        //TODO: 使用百度鹰眼
        
    }else {
        result(FlutterMethodNotImplemented);
    }
}

@end
