import 'package:bloc/bloc.dart';

part 'household_setup_state.dart';

class HouseholdSetupCubit extends Cubit<HouseholdSetupState> {
  HouseholdSetupCubit() : super(const HouseholdSetupState());

  void updateFamilyName(String name) {
    if (state.familyName == name) return;
    emit(state.copyWith(familyName: name));
  }

  void incrementFamilySize() {
    emit(state.copyWith(familySize: state.familySize + 1));
  }

  void decrementFamilySize() {
    if (state.familySize <= 1) return;
    emit(state.copyWith(familySize: state.familySize - 1));
  }

  void selectBudget(int budget) {
    if (state.selectedBudget == budget) return;
    emit(state.copyWith(selectedBudget: budget));
  }

  void toggleCategory(String categoryKey) {
    final updated = Set<String>.of(state.selectedCategories);
    if (!updated.remove(categoryKey)) {
      updated.add(categoryKey);
    }
    emit(state.copyWith(selectedCategories: updated));
  }

  void toggleDislikedIngredient(String ingredientId) {
    final updated = Set<String>.of(state.dislikedIngredientIds);
    if (!updated.remove(ingredientId)) {
      updated.add(ingredientId);
    }
    emit(state.copyWith(dislikedIngredientIds: updated));
  }
}
