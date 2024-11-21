import 'package:flutter/material.dart';
import 'package:imageifyai/core/widgets/buttons/app_button.dart';
import 'package:imageifyai/core/widgets/gradient_scaffold.dart';
import 'package:imageifyai/core/styles/button_styles.dart';
import 'package:provider/provider.dart';
import '../../../../core/tokens/colors.dart';
import '../viewmodel/baby_view_model.dart';
import 'widgets/parent_image_selector.dart';
import 'widgets/gender_option.dart';

class BabyView extends StatelessWidget {
  const BabyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BabyViewModel(),
      child: _BabyViewContent(),
    );
  }
}

class _BabyViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      backgroundColor: AppColors.card,
      appBar: AppBar(
        title: const Text('Bebeğinizi Oluşturun'),
        centerTitle: true,
      ),
      body: Consumer<BabyViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Ebeveyn Fotoğrafları',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ParentImageSelector(
                      title: 'Anne',
                      subtitle: 'Fotoğraf Seç',
                      image: viewModel.parent1Image,
                      onSelect: viewModel.selectParent1Image,
                      isLoading: viewModel.isLoading,
                    ),
                    SizedBox(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: AppColors.primary.withOpacity(0.5),
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    ParentImageSelector(
                      title: 'Baba',
                      subtitle: 'Fotoğraf Seç',
                      image: viewModel.parent2Image,
                      onSelect: viewModel.selectParent2Image,
                      isLoading: viewModel.isLoading,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.1),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Bebeğin Cinsiyeti',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GenderOption(
                            icon: Icons.male,
                            label: 'Erkek',
                            isSelected: viewModel.selectedGender == Gender.male,
                            onTap: () => viewModel.selectGender(Gender.male),
                          ),
                          GenderOption(
                            icon: Icons.female,
                            label: 'Kız',
                            isSelected: viewModel.selectedGender == Gender.female,
                            onTap: () => viewModel.selectGender(Gender.female),
                          ),
                          GenderOption(
                            icon: Icons.help_outline,
                            label: 'Sürpriz',
                            isSelected: viewModel.selectedGender == Gender.surprise,
                            onTap: () => viewModel.selectGender(Gender.surprise),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                AppButton(
                  color: AppColors.primary,
                  type: AppButtonType.secondary,
                  text: 'Bebeği Oluştur',
                  onPressed: viewModel.canGenerate ? () {} : null,
                  size: AppButtonSize.large,
                  isFullWidth: true,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
