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
      appBar: AppBar(title: const Text('Avatars')),
      body: const Center(child: Text('Avatars Feature')),
    );
  }
}
