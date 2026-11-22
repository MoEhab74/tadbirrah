import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Design System: Warm Ambient Terracotta Shadows
/// Multi-layer shadows tinted with deep roasted clay pigments.
class AppShadows {
  AppShadows._();

  /// Resting Elevation (cards, buttons at rest)
  static List<BoxShadow> get resting => [
        BoxShadow(
          color: AppColors.onSurface.withValues(alpha: 0.06),
          blurRadius: 8,
          offset: const Offset(0, 2),
          spreadRadius: -2,
        ),
        BoxShadow(
          color: AppColors.onSurface.withValues(alpha: 0.04),
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
      ];

  /// Floating Card / Hover (modals, floating nav bar, active cards)
  static List<BoxShadow> get floating => [
        BoxShadow(
          color: AppColors.primaryContainer.withValues(alpha: 0.12),
          blurRadius: 24,
          offset: const Offset(0, 12),
          spreadRadius: -6,
        ),
        BoxShadow(
          color: AppColors.onSurface.withValues(alpha: 0.05),
          blurRadius: 8,
          offset: const Offset(0, 4),
          spreadRadius: -2,
        ),
      ];

  /// Overlay / Modal (bottom sheets, dialogs)
  static List<BoxShadow> get modal => [
        BoxShadow(
          color: AppColors.onSurface.withValues(alpha: 0.22),
          blurRadius: 40,
          offset: const Offset(0, 20),
          spreadRadius: -8,
        ),
      ];
}
