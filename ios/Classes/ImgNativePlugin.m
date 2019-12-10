#import "ImgNativePlugin.h"
#if __has_include(<img_native/img_native-Swift.h>)
#import <img_native/img_native-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "img_native-Swift.h"
#endif

@implementation ImgNativePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftImgNativePlugin registerWithRegistrar:registrar];
}
@end
