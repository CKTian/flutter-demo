#import "MyPlatformViewFactory.h"
#import "MyPlatformViewObject.h"

@implementation MyPlatformViewFactory
- (NSObject <FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args
{
    MyPlatformViewObject *myPlatformViewObject = [[MyPlatformViewObject alloc] initWithFrame:frame viewId:viewId args:args];
    return myPlatformViewObject;
}

@end
