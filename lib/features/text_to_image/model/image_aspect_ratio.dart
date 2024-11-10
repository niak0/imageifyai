class ImageAspectRatio {
  final String label;
  final double ratio;

  const ImageAspectRatio(this.label, this.ratio);

  static List<ImageAspectRatio> get ratios => [
        const ImageAspectRatio('1:1', 1.0),
        const ImageAspectRatio('4:3', 4 / 3),
        const ImageAspectRatio('16:9', 16 / 9),
        const ImageAspectRatio('9:16', 9 / 16),
      ];
}
