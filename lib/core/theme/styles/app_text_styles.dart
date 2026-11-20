import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle font28Bold = GoogleFonts.cairo(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle font24Bold = GoogleFonts.cairo(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle font20SemiBold = GoogleFonts.cairo(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle font18Medium = GoogleFonts.cairo(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle font16Medium = GoogleFonts.cairo(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle font16Regular = GoogleFonts.cairo(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle font14Regular = GoogleFonts.cairo(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondaryLight,
  );

  static TextStyle font14Medium = GoogleFonts.cairo(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimaryLight,
  );

  static TextStyle font12Regular = GoogleFonts.cairo(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondaryLight,
  );

  static TextStyle font12Medium = GoogleFonts.cairo(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimaryLight,
  );
}
