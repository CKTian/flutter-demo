#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>


/// Tool
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Map/BMKPointAnnotation.h>
#import <BaiduMapAPI_Map/BMKLocationViewDisplayParam.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlutterNativePlugin : NSObject <FlutterPlugin, BMKMapViewDelegate>
{
//    BMKLocationService          *_locService; //定位服务
    BMKUserLocation             *_userLocation;//用户当前位置
    CLLocationCoordinate2D       _mapCenterCoor;//地图中心坐标
    CLLocationCoordinate2D       _tempCenter;// 临时的中心坐标
}

/**
 * XIB视图
 */
// 基本地图视
@property (weak, nonatomic) IBOutlet BMKMapView *mapView;
// 定位按钮
@property (weak, nonatomic) IBOutlet UIButton *locationBtn;

// 底部视图
@property (weak, nonatomic) IBOutlet UIView *bottomView;


/**
 * 自定义视图
 */
/** 搜索框 */
//@property (nonatomic, strong) YSSearchView    *searchView;


/**
 * 数据源
 */
/** 组织数据源 */
@property (nonatomic, strong) NSArray    *deptModelArr;
// 组织名称数据源，用于查找当前选中的大头针在 deptModelArr 中的位置
@property (nonatomic, strong) NSMutableArray    *deptNameArr;

/** 临时选中的组织模型 */
//@property (nonatomic, strong) YSMapDeptModel    *tempModel;


@end


NS_ASSUME_NONNULL_END
