import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  AppSnackBar._();

  static void showSuccess(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.success,
      duration: duration,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
    ).show(context);
  }

  static void showError(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.error,
      duration: duration,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
    ).show(context);
  }

  static void showWarning(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.warning,
      duration: duration,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
    ).show(context);
  }

  static void showInfo(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.info,
      duration: duration,
      mobileSnackBarPosition: MobileSnackBarPosition.top,
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
    ).show(context);
  }
}
