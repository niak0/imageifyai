enum ImageStyle {
  sdxlLight('SDXL Light', 'assets/images/style1.jpg'),
  digitalArt('Digital Sanat', 'assets/images/style2.jpg'),
  advanced('İleri', 'assets/images/style3.jpg'),
  photo('Fotoğraf', 'assets/images/style4.jpg');

  final String name;
  final String imagePath;

  const ImageStyle(this.name, this.imagePath);

  static List<ImageStyle> get allValues => ImageStyle.values;
}
