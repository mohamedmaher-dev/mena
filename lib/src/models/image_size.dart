/// Available image flag sizes from flagcdn.com.
///
/// This enum provides predefined width and height-based dimensions for flag images.
/// Supports both width-based (w) and height-based (h) sizing with automatic
/// aspect ratio calculation maintaining the standard 4:3 flag proportions.
///
/// ## Usage:
/// ```dart
/// final country = MENA.getByCode('ae');
/// final flagUrl = country?.getImageUrl(ImageSize.w160);
/// final heightFlag = country?.getImageUrl(ImageSize.h120);
/// ```
///
/// ## Size Categories:
/// - **Width-based**: w20 to w2560 - Specify width, height auto-calculated
/// - **Height-based**: h20 to h240 - Specify height, width auto-calculated
/// - **Small**: w20-w80, h20-h60 - For icons and thumbnails
/// - **Medium**: w160-w320, h80-h120 - For standard displays
/// - **Large**: w640+, h240+ - For detailed views and high-res displays
///
/// @since 1.1.0
enum ImageSize {
  // Width-based sizes
  /// 20px width - Tiny icon size
  w20('w20'),

  /// 40px width - Small icon size
  w40('w40'),

  /// 80px width - Standard small size
  w80('w80'),

  /// 160px width - Medium display size
  w160('w160'),

  /// 320px width - Large display size
  w320('w320'),

  /// 640px width - High resolution display
  w640('w640'),

  /// 1280px width - Ultra high resolution
  w1280('w1280'),

  /// 2560px width - Maximum quality size
  w2560('w2560'),

  // Height-based sizes
  /// 20px height - Tiny icon size (height-based)
  h20('h20'),

  /// 24px height - Small icon size (height-based)
  h24('h24'),

  /// 40px height - Standard small size (height-based)
  h40('h40'),

  /// 60px height - Medium display size (height-based)
  h60('h60'),

  /// 80px height - Large display size (height-based)
  h80('h80'),

  /// 120px height - High resolution display (height-based)
  h120('h120'),

  /// 240px height - Ultra high resolution (height-based)
  h240('h240');

  /// Creates an [ImageSize] with the specified size parameter.
  const ImageSize(this.sizeParam);

  /// The size parameter as a string.
  ///
  /// Used internally for constructing flagcdn.com URLs.
  /// Format: 'w{width}' or 'h{height}' (e.g., 'w160', 'h120')
  final String sizeParam;

  /// Returns true if this is a width-based size (starts with 'w').
  bool get isWidthBased => sizeParam.startsWith('w');

  /// Returns true if this is a height-based size (starts with 'h').
  bool get isHeightBased => sizeParam.startsWith('h');

  /// Width of the flag image in pixels.
  ///
  /// For width-based sizes, returns the specified width.
  /// For height-based sizes, calculates width from height (height * 4 / 3).
  ///
  /// **Example:**
  /// ```dart
  /// print(ImageSize.w160.width); // 160
  /// print(ImageSize.h120.width); // 160 (120 * 4/3)
  /// ```
  int get width {
    if (isWidthBased) {
      return int.parse(sizeParam.substring(1));
    } else {
      final heightValue = int.parse(sizeParam.substring(1));
      return (heightValue * 4 / 3).round();
    }
  }

  /// Height of the flag image in pixels.
  ///
  /// For height-based sizes, returns the specified height.
  /// For width-based sizes, calculates height from width (width * 3 / 4).
  ///
  /// **Example:**
  /// ```dart
  /// print(ImageSize.h120.height); // 120
  /// print(ImageSize.w160.height); // 120 (160 * 3/4)
  /// ```
  int get height {
    if (isHeightBased) {
      return int.parse(sizeParam.substring(1));
    } else {
      final widthValue = int.parse(sizeParam.substring(1));
      return (widthValue * 3 / 4).round();
    }
  }

  /// Aspect ratio of the flag (width/height).
  ///
  /// All flag sizes maintain the standard 4:3 aspect ratio (≈1.333).
  ///
  /// **Example:**
  /// ```dart
  /// print(ImageSize.w160.aspectRatio); // 1.3333...
  /// print(ImageSize.h120.aspectRatio); // 1.3333...
  /// ```
  double get aspectRatio => width / height;

  /// Human-readable description of the flag size.
  ///
  /// **Example:**
  /// ```dart
  /// print(ImageSize.w160.description); // "160x120 pixels"
  /// print(ImageSize.h120.description); // "160x120 pixels"
  /// ```
  String get description => '${width}x$height pixels';

  /// Full dimensions string in 'widthxheight' format.
  ///
  /// **Example:**
  /// ```dart
  /// print(ImageSize.w160.dimensions); // "160x120"
  /// print(ImageSize.h120.dimensions); // "160x120"
  /// ```
  String get dimensions => '${width}x$height';

  /// Returns true if this is a small size (width <= 80px).
  bool get isSmall => width <= 80;

  /// Returns true if this is a medium size (81px <= width <= 320px).
  bool get isMedium => width > 80 && width <= 320;

  /// Returns true if this is a large size (321px <= width <= 640px).
  bool get isLarge => width > 320 && width <= 640;

  /// Returns true if this is an extra large size (width > 640px).
  bool get isExtraLarge => width > 640;

  @override
  String toString() => 'ImageSize.$name ($description)';
}
