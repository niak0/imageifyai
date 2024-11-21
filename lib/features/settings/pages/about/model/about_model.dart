// Uygulama bilgileri için model
class AboutInfo {
  final String version;
  final String buildNumber;
  final String developer;
  final String website;
  final String email;
  final List<String> contributors;

  const AboutInfo({
    required this.version,
    required this.buildNumber,
    required this.developer,
    required this.website,
    required this.email,
    this.contributors = const [],
  });
}
