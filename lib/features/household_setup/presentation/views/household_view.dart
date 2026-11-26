import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tadbirrah/core/widgets/app_buttom.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';
import 'package:tadbirrah/features/household_setup/presentation/manager/cubit/household_setup_cubit.dart';
import 'package:tadbirrah/features/household_setup/presentation/widgets/daily_budget_card.dart';
import 'package:tadbirrah/features/household_setup/presentation/widgets/disliked_ingredients_section.dart';
import 'package:tadbirrah/features/household_setup/presentation/widgets/family_info_card.dart';
import 'package:tadbirrah/features/household_setup/presentation/widgets/preferred_categories_section.dart';
import 'package:tadbirrah/features/household_setup/presentation/widgets/setup_progress_header.dart';

class HouseholdView extends StatefulWidget {
  const HouseholdView({super.key});

  @override
  State<HouseholdView> createState() => _HouseholdViewState();
}

class _HouseholdViewState extends State<HouseholdView> {
  final _nameController = TextEditingController();

  // Temporary UI preview options — will be loaded from Supabase via repo in the next step
  static const Map<String, String> _previewCategories = {
    'طواجن': 'طواجن وصواني فرن',
    'فراخ': 'فراخ ودواجن',
    'اقتصادي': 'أكلات اقتصادية',
    'شعبي': 'شعبي وطبيخ',
    'سريع': 'سريعة (٣٠ د)',
    'لحوم': 'لحوم',
  };

  static const Map<String, String> _previewDislikedIngredients = {
    'eggplant': 'باذنجان',
    'okra': 'بامية',
    'liver': 'كبدة',
  };

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HouseholdSetupCubit>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocSelector<HouseholdSetupCubit, HouseholdSetupState, int>(
                  selector: (state) => state.completedSteps,
                  builder: (context, completedSteps) {
                    return SetupProgressHeader(completedSteps: completedSteps);
                  },
                ),
                const AppSizedBox(height: 20),
                BlocSelector<HouseholdSetupCubit, HouseholdSetupState, int>(
                  selector: (state) => state.familySize,
                  builder: (context, familySize) {
                    return FamilyInfoCard(
                      nameController: _nameController,
                      familySize: familySize,
                      onNameChanged: cubit.updateFamilyName,
                      onIncrement: cubit.incrementFamilySize,
                      onDecrement: cubit.decrementFamilySize,
                    );
                  },
                ),
                const AppSizedBox(height: 16),
                BlocSelector<HouseholdSetupCubit, HouseholdSetupState, int?>(
                  selector: (state) => state.selectedBudget,
                  builder: (context, selectedBudget) {
                    return DailyBudgetCard(
                      selectedBudget: selectedBudget,
                      onBudgetSelected: cubit.selectBudget,
                    );
                  },
                ),
                const AppSizedBox(height: 20),
                BlocSelector<HouseholdSetupCubit, HouseholdSetupState,
                    Set<String>>(
                  selector: (state) => state.selectedCategories,
                  builder: (context, selectedCategories) {
                    return PreferredCategoriesSection(
                      categories: _previewCategories,
                      selectedCategories: selectedCategories,
                      onCategoryToggled: cubit.toggleCategory,
                    );
                  },
                ),
                const AppSizedBox(height: 20),
                BlocSelector<HouseholdSetupCubit, HouseholdSetupState,
                    Set<String>>(
                  selector: (state) => state.dislikedIngredientIds,
                  builder: (context, dislikedIds) {
                    return DislikedIngredientsSection(
                      ingredients: _previewDislikedIngredients,
                      selectedIds: dislikedIds,
                      onIngredientToggled: cubit.toggleDislikedIngredient,
                      onAddMoreTap: () {
                        // TODO: Open searchable ingredients bottom sheet from Supabase
                      },
                    );
                  },
                ),
                const AppSizedBox(height: 28),
                AppButton(
                  text: 'حفظ ملف البيت وابدأ الاقتراحات',
                  onPressed: () {
                    // TODO: Save household profile via HouseholdSetupCubit
                  },
                ),
                const AppSizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
