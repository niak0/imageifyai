enum ImageSize {
  small(512, 512),
  medium(768, 768),
  large(1024, 1024);

  final int width;
  final int height;

  const ImageSize(this.width, this.height);
}

enum ImageQuality {
  low(20),
  medium(30),
  high(50);

  final int steps;

  const ImageQuality(this.steps);
}

enum AIModel {
  stableDiffusion('Stable Diffusion'),
  dalle('DALL-E'),
  midjourney('Midjourney');

  final String title;

  const AIModel(this.title);
}

enum Styles {
  realistic('Gerçekçi'),
  anime('Anime'),
  digital('Dijital Sanat'),
  painting('Yağlı Boya'),
  sketch('Karakalem');

  final String prompt;

  const Styles(this.prompt);
}
