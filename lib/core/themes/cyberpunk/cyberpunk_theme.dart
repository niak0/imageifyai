enum CyberpunkStyle {
  glass, // Cam efekti
  neon, // Neon kenarlıklar
  gradient, // Gradient arka plan
  minimal // Basit stil
}

class CyberpunkTheme {
  static bool enabled = true; // Tema aktif/pasif
  static CyberpunkStyle defaultStyle = CyberpunkStyle.neon;

  // Tema ayarları
  static double glassBlur = 10.0;
  static double neonIntensity = 0.5;
  static double gradientOpacity = 0.1;
}
