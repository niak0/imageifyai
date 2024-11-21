import 'package:flutter/material.dart';
import 'package:imageifyai/features/settings/pages/history/view_model/history_view_model.dart';
import 'package:imageifyai/features/settings/view_model/settings_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Gerçekten global olması gereken provider'lar
class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => SettingsViewModel()),
    ChangeNotifierProvider(create: (_) => HistoryViewModel()),
  ];
}
