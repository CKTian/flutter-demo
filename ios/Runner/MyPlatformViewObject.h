#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

@interface MyPlatformViewObject : NSObject <FlutterPlatformView>
- (id)initWithFrame:(CGRect)frame viewId:(int64_t)viewId args:(id)args;
@end

	
