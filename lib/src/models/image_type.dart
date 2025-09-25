/// Available image formats for flag images from flagcdn.com.
///
/// This enum provides support for different image formats, each with their
/// own characteristics and use cases for flag display.
///
/// ## Usage:
/// ```dart
/// final country = MENA.getByCode('ae');
/// final pngFlag = country?.getImageUrl(ImageSize.w160, ImageType.png);
/// final jpegFlag = country?.getImageUrl(ImageSize.w160, ImageType.jpeg);
/// ```
///
/// ## Format Characteristics:
/// - **PNG**: Lossless compression, sharp edges, transparency support
/// - **JPEG**: Lossy compression, smaller file sizes, good for photos
///
/// @since 1.1.0
enum ImageType {
  /// PNG format - Lossless compression with transparency support
  ///
  /// **Characteristics:**
  /// - Lossless compression maintains image quality
  /// - Supports transparency (alpha channel)
  /// - Sharp edges and text rendering
  /// - Larger file sizes compared to JPEG
  ///
  /// **Best for:**
  /// - Icons and UI elements
  /// - Images requiring transparency
  /// - Sharp geometric designs
  /// - High-quality displays
  png('png'),

  /// JPEG format - Lossy compression for smaller file sizes
  ///
  /// **Characteristics:**
  /// - Lossy compression reduces file size
  /// - No transparency support
  /// - Good for photographic content
  /// - Smaller file sizes than PNG
  ///
  /// **Best for:**
  /// - Web performance optimization
  /// - Bandwidth-limited environments
  /// - Photographic flag representations
  /// - Large-scale image delivery
  jpeg('jpg');

  /// Creates an [ImageType] with the specified file extension.
  const ImageType(this.extension);

  /// The file extension for this image type.
  ///
  /// Used internally for constructing flagcdn.com URLs.
  /// Format: 'png' or 'jpeg'
  final String extension;

  /// Returns true if this format supports transparency.
  bool get supportsTransparency => this == ImageType.png;

  /// Returns true if this format uses lossless compression.
  bool get isLossless => this == ImageType.png;

  /// Returns true if this format uses lossy compression.
  bool get isLossy => this == ImageType.jpeg;

  /// Human-readable description of the image type.
  ///
  /// **Example:**
  /// ```dart
  /// print(ImageType.png.description); // "PNG format"
  /// print(ImageType.jpeg.description); // "JPEG format"
  /// ```
  String get description => '${extension.toUpperCase()} format';

  /// Technical characteristics of the image format.
  ///
  /// **Example:**
  /// ```dart
  /// print(ImageType.png.characteristics); // "Lossless, Transparency"
  /// print(ImageType.jpeg.characteristics); // "Lossy, Compressed"
  /// ```
  String get characteristics {
    switch (this) {
      case ImageType.png:
        return 'Lossless, Transparency';
      case ImageType.jpeg:
        return 'Lossy, Compressed';
    }
  }

  @override
  String toString() => 'ImageType.$name ($description)';
}
