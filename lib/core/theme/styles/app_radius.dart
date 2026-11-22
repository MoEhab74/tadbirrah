import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Design System: Egyptian Clay & Terracotta Shape Tokens
/// Curved rims inspired by tawjin bowls and earthen vessels.
class AppRadius {
  AppRadius._();

  /// Small (0.25rem / 4px) - step markers, utility controls, tooltips
  static double get sm => 4.r;
  static BorderRadius get borderSm => BorderRadius.circular(sm);

  /// Default (0.5rem / 8px) - small components, checkboxes
  static double get defaultRadius => 8.r;
  static BorderRadius get borderDefault => BorderRadius.circular(defaultRadius);

  /// Medium (0.75rem / 12px) - inner cards, list items
  static double get md => 12.r;
  static BorderRadius get borderMd => BorderRadius.circular(md);

  /// Large (1rem / 16px) - buttons, inputs, filter chips
  static double get lg => 16.r;
  static BorderRadius get borderLg => BorderRadius.circular(lg);

  /// Extra Large (1.5rem / 24px) - product cards, recipe hero panels, modals
  static double get xl => 24.r;
  static BorderRadius get borderXl => BorderRadius.circular(xl);

  /// Pill / Full (9999px) - status badges, category filters, freshness tags
  static double get full => 9999.r;
  static BorderRadius get borderFull => BorderRadius.circular(full);
}
