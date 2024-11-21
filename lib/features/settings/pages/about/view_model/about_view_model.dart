import 'package:flutter/material.dart';
import '../model/about_model.dart';

class AboutViewModel extends ChangeNotifier {
  final AboutInfo aboutInfo = const AboutInfo(
    version: '1.0.0',
    buildNumber: '1',
    developer: 'AI Studio Team',
    website: 'https://aistudio.dev',
    email: 'contact@aistudio.dev',
    contributors: ['John Doe', 'Jane Doe'],
  );

  Future<void> sendFeedback(String feedback) async {
    // TODO: Implement feedback sending
  }

  void openWebsite() {
    // TODO: Implement website opening
  }

  void sendEmail() {
    // TODO: Implement email sending
  }
}
