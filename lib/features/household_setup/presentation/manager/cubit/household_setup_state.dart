part of 'household_setup_cubit.dart';

class HouseholdSetupState {
  final String familyName;
  final int familySize;
  final int? selectedBudget;
  final Set<String> selectedCategories;
  final Set<String> dislikedIngredientIds;

  const HouseholdSetupState({
    this.familyName = '',
    this.familySize = 4,
    this.selectedBudget,
    this.selectedCategories = const {},
    this.dislikedIngredientIds = const {},
  });

  int get completedSteps {
    int steps = 0;
    if (familyName.trim().isNotEmpty && familySize > 0) steps++;
    if (selectedBudget != null) steps++;
    if (selectedCategories.isNotEmpty) steps++;
    return steps;
  }

  HouseholdSetupState copyWith({
    String? familyName,
    int? familySize,
    int? selectedBudget,
    Set<String>? selectedCategories,
    Set<String>? dislikedIngredientIds,
  }) {
    return HouseholdSetupState(
      familyName: familyName ?? this.familyName,
      familySize: familySize ?? this.familySize,
      selectedBudget: selectedBudget ?? this.selectedBudget,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      dislikedIngredientIds:
          dislikedIngredientIds ?? this.dislikedIngredientIds,
    );
  }
}
