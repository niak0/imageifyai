enum TattooStyle {
  oldSchool('Eski Usul', 'assets/images/tattoo/old_school.png'),
  neoTraditional('Neo-geleneksel', 'assets/images/tattoo/neo_traditional.png'),
  modern('Çağdaş', 'assets/images/tattoo/modern.png'),
  trashPolka('Çöp Polka', 'assets/images/tattoo/trash_polka.png');

  final String title;
  final String imagePath;

  const TattooStyle(this.title, this.imagePath);
} 