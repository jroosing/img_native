package jroosing.com.img_native;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import static fimp.Fimp.grayscale;

/** ImgNativePlugin */
public class ImgNativePlugin implements FlutterPlugin, MethodCallHandler {
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    final MethodChannel channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "img_native");
    channel.setMethodCallHandler(new ImgNativePlugin());
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "img_native");
    channel.setMethodCallHandler(new ImgNativePlugin());
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "grayscale":
        if (!call.hasArgument("fileIn")) {
          result.error("fimp_grayscale", "Missing argument fileIn", null);
          return;
        }
        String fileIn = call.argument("fileIn");
        String fileOut = call.hasArgument("fileOut") ? (String)call.argument("fileOut") : fileIn;
        try {
          grayscale(fileIn, fileOut);
          result.success(null);
        } catch (Exception e) {
          result.error("fimp_grayscale", e.getMessage(), e);
        }
        return;
      case "resize":
        break;
      default:
        result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
  }
}
