enum TattooStyle {
  oldSchool('Eski Usul', 'https://picsum.photos/id/237/200/300'),
  neoTraditional('Neo-geleneksel', 'https://picsum.photos/id/238/200/300'),
  modern('Çağdaş', 'https://picsum.photos/id/239/200/300'),
  trashPolka('Çöp Polka', 'https://picsum.photos/id/240/200/300');

  final String title;
  final String imagePath;

  const TattooStyle(this.title, this.imagePath);
}
