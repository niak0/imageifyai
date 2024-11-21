import 'package:flutter/material.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold.dart';
import 'package:imageifyai/core/tokens/colors.dart';
import 'package:provider/provider.dart';
import '../model/history_model.dart';
import '../view_model/history_view_model.dart';
import 'package:imageifyai/core/constants/app_constants.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<HistoryViewModel>().fetchHistory(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: _buildAppBar(),
      body: Consumer<HistoryViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.historyItems.isEmpty) {
            return _buildEmptyState();
          }

          return _buildHistoryList(viewModel);
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Geçmiş'),
      actions: [
        IconButton(
          icon: const Icon(Icons.delete_outline_rounded),
          onPressed: () {
            // TODO: Toplu silme işlemi
          },
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history_rounded,
            size: 64,
            color: AppColors.primary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Henüz geçmiş yok',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryList(HistoryViewModel viewModel) {
    return ListView.builder(
      padding: AppConstants.paddingAllMd,
      itemCount: viewModel.historyItems.length,
      itemBuilder: (context, index) {
        final item = viewModel.historyItems[index];
        return _HistoryCard(item: item);
      },
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final HistoryItem item;

  const _HistoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: _buildLeadingImage(),
        title: Text(item.title),
        subtitle: Text(item.type),
        trailing: _buildDeleteButton(context),
      ),
    );
  }

  Widget _buildLeadingImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        item.imageUrl,
        width: 56,
        height: 56,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDeleteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete_outline),
      onPressed: () {
        context.read<HistoryViewModel>().deleteHistoryItem(item.id);
      },
    );
  }
}
