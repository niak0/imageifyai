import 'package:flutter/material.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold.dart';
import 'package:provider/provider.dart';
import '../viewmodel/tattoo_view_model.dart';

class TattooView extends StatelessWidget {
  const TattooView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TattooViewModel(),
      child: const _TattooViewContent(),
    );
  }
}

class _TattooViewContent extends StatelessWidget {
  const _TattooViewContent();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(title: const Text('Tattoo Mode')),
      body: const Center(child: Text('Tattoo Feature')),
    );
  }
}
