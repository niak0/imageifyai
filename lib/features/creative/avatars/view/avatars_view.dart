import 'package:flutter/material.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold.dart';
import 'package:provider/provider.dart';
import '../viewmodel/avatars_view_model.dart';

class AvatarsView extends StatelessWidget {
  const AvatarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AvatarsViewModel(),
      child: const _AvatarsViewContent(),
    );
  }
}

class _AvatarsViewContent extends StatelessWidget {
  const _AvatarsViewContent();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(title: const Text('Avatarlar')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8, // Avatar kartlarının boy/en oranı
          ),
          itemCount: 6, // Örnek sayı
          itemBuilder: (context, index) {
            return _buildAvatarCard(
              context,
              isSelected: index == 0, // Örnek seçim durumu
              imageUrl: 'https://via.placeholder.com/150', // Örnek resim
              title: 'Avatar ${index + 1}',
            );
          },
        ),
      ),
    );
  }

  Widget _buildAvatarCard(
    BuildContext context, {
    required bool isSelected,
    required String imageUrl,
    required String title,
  }) {
    return InkWell(
      onTap: () {
        // Avatar seçme işlemi
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
