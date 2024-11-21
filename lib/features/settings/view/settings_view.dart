import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/settings_view_model.dart';
import 'package:imageifyai/core/tokens/colors.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Consumer<SettingsViewModel>(
        builder: (context, viewModel, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildThemeSection(viewModel),
              const SizedBox(height: 16),
              _buildGeneralSection(viewModel),
              const SizedBox(height: 16),
              _buildImageQualitySection(viewModel),
              const SizedBox(height: 16),
              _buildAISettingsSection(viewModel),
            ],
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Ayarlar'),
    );
  }

  Widget _buildThemeSection(SettingsViewModel viewModel) {
    return _buildSection(
      title: 'Tema',
      children: [
        _buildThemeSwitch(viewModel),
      ],
    );
  }

  Widget _buildThemeSwitch(SettingsViewModel viewModel) {
    return SwitchListTile(
      title: Row(
        children: [
          Icon(
            viewModel.isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
            size: 20,
            color: AppColors.primary,
          ),
          const SizedBox(width: 12),
          const Text('Karanlık Mod'),
        ],
      ),
      value: viewModel.isDark,
      onChanged: (value) => viewModel.toggleTheme(),
    );
  }

  Widget _buildGeneralSection(SettingsViewModel viewModel) {
    return _buildSection(
      title: 'Genel',
      children: [
        _buildNotificationSwitch(viewModel),
        _buildHistorySwitch(viewModel),
      ],
    );
  }

  Widget _buildNotificationSwitch(SettingsViewModel viewModel) {
    return SwitchListTile(
      title: const Text('Bildirimleri Etkinleştir'),
      subtitle: const Text('Uygulama bildirimleri'),
      value: viewModel.settings.notificationsEnabled,
      onChanged: viewModel.toggleNotifications,
    );
  }

  Widget _buildHistorySwitch(SettingsViewModel viewModel) {
    return SwitchListTile(
      title: const Text('Geçmişi Kaydet'),
      subtitle: const Text('İşlem geçmişini sakla'),
      value: viewModel.settings.saveHistory,
      onChanged: viewModel.toggleSaveHistory,
    );
  }

  Widget _buildImageQualitySection(SettingsViewModel viewModel) {
    return _buildSection(
      title: 'Görsel Kalitesi',
      children: [
        _buildQualityOption(viewModel, 'Yüksek Kalite', 'high'),
        _buildQualityOption(viewModel, 'Orta Kalite', 'medium'),
        _buildQualityOption(viewModel, 'Düşük Kalite', 'low'),
      ],
    );
  }

  Widget _buildQualityOption(
    SettingsViewModel viewModel,
    String title,
    String value,
  ) {
    return RadioListTile(
      title: Text(title),
      value: value,
      groupValue: viewModel.settings.imageQuality,
      onChanged: (value) => viewModel.setImageQuality(value!),
    );
  }

  Widget _buildAISettingsSection(SettingsViewModel viewModel) {
    return _buildSection(
      title: 'AI Görüntü Ayarları',
      children: [
        _buildStepCountSlider(viewModel),
        _buildGuidanceScaleSlider(viewModel),
        _buildSeedControl(viewModel),
      ],
    );
  }

  Widget _buildStepCountSlider(SettingsViewModel viewModel) {
    return ListTile(
      title: const Text('Adım Sayısı'),
      subtitle: Text('${viewModel.settings.stepCount} adım'),
      trailing: SizedBox(
        width: 200,
        child: Slider(
          value: viewModel.settings.stepCount.toDouble(),
          min: 20,
          max: 50,
          divisions: 30,
          label: viewModel.settings.stepCount.toString(),
          onChanged: (value) => viewModel.setStepCount(value.toInt()),
        ),
      ),
    );
  }

  Widget _buildGuidanceScaleSlider(SettingsViewModel viewModel) {
    return ListTile(
      title: const Text('Guidance Scale'),
      subtitle: Text(viewModel.settings.guidanceScale.toString()),
      trailing: SizedBox(
        width: 200,
        child: Slider(
          value: viewModel.settings.guidanceScale,
          min: 1,
          max: 20,
          divisions: 38,
          label: viewModel.settings.guidanceScale.toString(),
          onChanged: (value) => viewModel.setGuidanceScale(value),
        ),
      ),
    );
  }

  Widget _buildSeedControl(SettingsViewModel viewModel) {
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Seed Kontrolü'),
          subtitle: const Text('Aynı sonuçları tekrar üretebilme'),
          value: viewModel.settings.useSeed,
          onChanged: viewModel.toggleUseSeed,
        ),
        if (viewModel.settings.useSeed)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Seed Değeri',
                hintText: '0-4294967295 arası bir değer',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final seed = int.tryParse(value);
                if (seed != null) {
                  viewModel.setSeedValue(seed);
                }
              },
              controller: TextEditingController(
                text: viewModel.settings.seedValue.toString(),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Card(
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
