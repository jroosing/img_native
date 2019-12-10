import 'dart:async';

import 'package:flutter/services.dart';

const MethodChannel _channel =
    MethodChannel('plugins.flutter.io/img_native');

/// Grayscale an image and save it at the provided location
/// Default value of fileOutputPath is fileInputPath
Future<void> grayscale(String fileInputPath, {String fileOutputPath}) async {
  try {
    var arguments = Map();
    arguments["fileIn"] = fileInputPath;
    if (fileOutputPath != null && fileOutputPath.isNotEmpty) {
      arguments["fileOut"] = fileOutputPath;
    }
    await _channel.invokeMethod("grayscale", arguments);
  } on PlatformException catch (e) {
    print("PlatformException: ${e.message}");
  }
}

enum ResampleFilter {
  /// A high-quality resampling filter for photographic images yielding sharp results.
  ///
  /// https://github.com/disintegration/imaging
  lanczos,


  /// A sharp cubic filter that is faster than Lanczos filter while providing similar results.
  ///
  /// https://github.com/disintegration/imaging
  catmullrom,

  /// A cubic filter that procudes smoother results with less ringing artifacts than CatmullRom
  ///
  /// https://github.com/disintegration/imaging
  mitchellnetravali,

  /// Bilinear resampling filter, produces smooth output. Faster than cubic filters.
  ///
  /// https://github.com/disintegration/imaging
  linear,

  /// Simple and fast averaging filter appropriate for downscaling. When upscaling it's similar to NearestNeighbor.
  ///
  /// https://github.com/disintegration/imaging
  box,

  /// Fastest resampling filter, no antialiasing.
  ///
  /// https://github.com/disintegration/imaging
  nearestneighboor
}
