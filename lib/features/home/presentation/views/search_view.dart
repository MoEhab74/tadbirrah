import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../core/theme/styles/app_colors.dart';
import '../../../../core/theme/styles/app_text_styles.dart';
import '../../../../core/widgets/app_sized_box.dart';
import '../../../../core/widgets/app_text_field_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextFormField(
                controller: _searchController,
                hintText: 'Search items, modules, or services...',
                prefixIcon: const HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01,
                  color: AppColors.grey500,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, size: 20, color: AppColors.grey500),
                  onPressed: () => _searchController.clear(),
                ),
              ),
              verticalSpace24,
              Text(
                'Recent Searches',
                style: AppTextStyles.font16Medium.copyWith(fontWeight: FontWeight.bold),
              ),
              verticalSpace16,
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedFolder01,
                        color: AppColors.grey400,
                        size: 64.sp,
                      ),
                      verticalSpace16,
                      Text(
                        'No recent searches found',
                        style: AppTextStyles.font14Regular.copyWith(
                          color: AppColors.grey500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
