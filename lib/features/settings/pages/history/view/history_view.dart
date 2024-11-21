import 'package:flutter/material.dart';
import 'package:imageifyai/core/constants/colors.dart';
import 'package:provider/provider.dart';
import '../model/history_model.dart';
import '../view_model/history_view_model.dart';
import 'package:imageifyai/core/constants/app_constants.dart';
import 'history_detail_view.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HistoryViewModel()..fetchHistory(),
      child: const _HistoryViewContent(),
    );
  }
}

class _HistoryViewContent extends StatelessWidget {
  const _HistoryViewContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Consumer<HistoryViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage != null) {
            return _buildError(viewModel.errorMessage!, context);
          }

          if (viewModel.historyItems.isEmpty) {
            return _buildEmptyState(context);
          }

          return _buildHistoryList(viewModel);
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Geçmiş'),
      actions: [
        Consumer<HistoryViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.historyItems.isEmpty) return const SizedBox();

            return IconButton(
              icon: const Icon(Icons.delete_outline_rounded),
              onPressed: () => _showClearHistoryDialog(context, viewModel),
            );
          },
        ),
      ],
    );
  }

  Widget _buildError(String message, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 64,
            color: AppColors.error.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Bir hata oluştu',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(message),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              context.read<HistoryViewModel>().fetchHistory();
            },
            child: const Text('Tekrar dene'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
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

  Future<void> _showClearHistoryDialog(BuildContext context, HistoryViewModel viewModel) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Geçmişi Temizle'),
        content: const Text('Tüm geçmiş silinecek. Emin misiniz?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Temizle'),
          ),
        ],
      ),
    );

    if (result == true) {
      await viewModel.clearHistory();
    }
  }
}

class _HistoryCard extends StatelessWidget {
  final HistoryItem item;

  const _HistoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => _openDetail(context),
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          leading: _buildLeadingImage(),
          title: Text(item.title),
          subtitle: Text(item.type.name),
          trailing: _buildDeleteButton(context),
        ),
      ),
    );
  }

  void _openDetail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HistoryDetailView(item: item),
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
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 56,
            height: 56,
            color: Colors.grey.withOpacity(0.2),
            child: const Icon(Icons.broken_image_rounded),
          );
        },
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
