import 'package:flutter/material.dart';
import '../model/about_model.dart';

class AboutViewModel extends ChangeNotifier {
  final AboutInfo aboutInfo = const AboutInfo(
    version: '1.0.0',
    buildNumber: '1',
    developer: 'Imageify AI Team',
    website: 'https://imageify.ai',
    email: 'contact@imageify.ai',
    contributors: ['   '],
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
