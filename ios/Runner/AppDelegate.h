#import <Flutter/Flutter.h>
#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
 
//#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
 
//#import <BaiduMapAPI_Search/BMKSearchComponent.h>//引入检索功能所有的头文件
//
//#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>//引入云检索功能所有的头文件
//
//#import <BaiduMapAPI_Location/BMKLocationComponent.h>//引入定位功能所有的头文件
//
//
//#import <BaiduMapAPI_Radar/BMKRadarComponent.h>//引入周边雷达功能所有的头文件
//
//#import <BaiduMapAPI_Map/BMKMapView.h>//只引入所需的单个头文件

@interface AppDelegate : FlutterAppDelegate<BMKGeneralDelegate>

@property (strong,nonatomic) BMKMapManager *mapManager;

@end
