import 'package:flutter/material.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold/gradient_scaffold.dart';
import 'package:provider/provider.dart';
import '../viewmodel/filters_view_model.dart';

class FiltersView extends StatelessWidget {
  const FiltersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FiltersViewModel(),
      child: const _FiltersViewContent(),
    );
  }
}

class _FiltersViewContent extends StatelessWidget {
  const _FiltersViewContent();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      backgroundStyle: BackgroundStyle.modernGrid,
      appBar: AppBar(title: const Text('Filters')),
      body: const Center(child: Text('Filters Feature')),
    );
  }
}
