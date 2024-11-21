import 'package:flutter/material.dart';
import '../model/history_model.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/app_constants.dart';

class HistoryDetailView extends StatelessWidget {
  final HistoryItem item;

  const HistoryDetailView({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detay'),
      ),
      body: SingleChildScrollView(
        padding: AppConstants.paddingAllMd,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            const SizedBox(height: 24),
            _buildInfoSection(context),
            const SizedBox(height: 24),
            _buildSettingsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.network(
          item.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.withOpacity(0.2),
              child: const Center(
                child: Icon(Icons.broken_image_rounded, size: 48),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bilgiler',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        _buildInfoItem(
          context,
          title: 'Başlık',
          value: item.title,
          icon: Icons.title,
        ),
        _buildInfoItem(
          context,
          title: 'Tür',
          value: item.type.name,
          icon: Icons.category,
        ),
        _buildInfoItem(
          context,
          title: 'Prompt',
          value: item.prompt,
          icon: Icons.text_fields,
        ),
        _buildInfoItem(
          context,
          title: 'Oluşturulma',
          value: _formatDate(item.createdAt),
          icon: Icons.access_time,
        ),
      ],
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AI Ayarları',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        _buildInfoItem(
          context,
          title: 'Step Count',
          value: item.settings['stepCount'].toString(),
          icon: Icons.abc,
        ),
        _buildInfoItem(
          context,
          title: 'Guidance Scale',
          value: item.settings['guidanceScale'].toString(),
          icon: Icons.tune,
        ),
      ],
    );
  }

  Widget _buildInfoItem(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textLow,
                      ),
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';
  }
}
