/// Available flag emoji sizes from flagcdn.com.
///
/// This enum provides predefined dimensions for flag emoji images in different
/// resolutions. All sizes maintain the 4:3 aspect ratio standard for flags.
/// Perfect for emoji-style flag displays and icons.
///
/// ## Usage:
/// ```dart
/// final country = MENA.getByCode('ae');
/// final flagUrl = country?.getEmojiUrl(EmojiSize.size48x36);
/// ```
///
/// ## Size Categories:
/// - **Small**: 16x12 to 32x24 - For icons, badges, small UI elements
/// - **Medium**: 36x27 to 64x48 - For lists, cards, standard displays
/// - **Large**: 72x54 to 128x96 - For detailed views, headers
/// - **Extra Large**: 144x108 to 256x192 - For high-resolution displays
///
/// @since 1.1.0
enum EmojiSize {
  /// 16x12 pixels - Tiny icon size
  size16x12('16x12'),

  /// 20x15 pixels - Small icon size
  size20x15('20x15'),

  /// 24x18 pixels - Standard small icon
  size24x18('24x18'),

  /// 28x21 pixels - Medium small icon
  size28x21('28x21'),

  /// 32x24 pixels - Large icon size
  size32x24('32x24'),

  /// 36x27 pixels - Small display size
  size36x27('36x27'),

  /// 40x30 pixels - Medium small display
  size40x30('40x30'),

  /// 48x36 pixels - Standard medium size
  size48x36('48x36'),

  /// 56x42 pixels - Large medium size
  size56x42('56x42'),

  /// 60x45 pixels - Standard large size
  size60x45('60x45'),

  /// 64x48 pixels - Large display size
  size64x48('64x48'),

  /// 72x54 pixels - Extra large display
  size72x54('72x54'),

  /// 80x60 pixels - High resolution medium
  size80x60('80x60'),

  /// 84x63 pixels - High resolution large
  size84x63('84x63'),

  /// 96x72 pixels - Very large display
  size96x72('96x72'),

  /// 108x81 pixels - Extra large display
  size108x81('108x81'),

  /// 112x84 pixels - High resolution extra large
  size112x84('112x84'),

  /// 120x90 pixels - Maximum standard size
  size120x90('120x90'),

  /// 128x96 pixels - High resolution maximum
  size128x96('128x96'),

  /// 144x108 pixels - Ultra high resolution
  size144x108('144x108'),

  /// 160x120 pixels - Premium display size
  size160x120('160x120'),

  /// 192x144 pixels - Professional display
  size192x144('192x144'),

  /// 224x168 pixels - Enterprise display
  size224x168('224x168'),

  /// 256x192 pixels - Maximum available size
  size256x192('256x192');

  /// Creates an [EmojiSize] with the specified dimensions.
  const EmojiSize(this.dimensions);

  /// The dimensions string in 'widthxheight' format.
  ///
  /// Used internally for constructing flagcdn.com URLs.
  /// Format: '{width}x{height}' (e.g., '48x36', '256x192')
  final String dimensions;

  /// Width of the flag image in pixels.
  ///
  /// Calculated from the dimensions string for convenience.
  ///
  /// **Example:**
  /// ```dart
  /// print(EmojiSize.size48x36.width); // 48
  /// ```
  int get width => int.parse(dimensions.split('x')[0]);

  /// Height of the flag image in pixels.
  ///
  /// Calculated from the dimensions string for convenience.
  ///
  /// **Example:**
  /// ```dart
  /// print(EmojiSize.size48x36.height); // 36
  /// ```
  int get height => int.parse(dimensions.split('x')[1]);

  /// Aspect ratio of the flag (width/height).
  ///
  /// All flag sizes maintain the standard 4:3 aspect ratio.
  ///
  /// **Example:**
  /// ```dart
  /// print(EmojiSize.size48x36.aspectRatio); // 1.3333...
  /// ```
  double get aspectRatio => width / height;

  /// Human-readable description of the flag size.
  ///
  /// **Example:**
  /// ```dart
  /// print(EmojiSize.size48x36.description); // "48x36 pixels"
  /// ```
  String get description => '$dimensions pixels';

  /// Returns true if this is a small size (width <= 32px).
  bool get isSmall => width <= 32;

  /// Returns true if this is a medium size (33px <= width <= 64px).
  bool get isMedium => width > 32 && width <= 64;

  /// Returns true if this is a large size (65px <= width <= 128px).
  bool get isLarge => width > 64 && width <= 128;

  /// Returns true if this is an extra large size (width > 128px).
  bool get isExtraLarge => width > 128;

  @override
  String toString() => 'EmojiSize.$name ($description)';
}
