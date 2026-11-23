import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';
import 'package:tadbirrah/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:tadbirrah/features/auth/presentation/widgets/auth_bottoms_bg_widget.dart';
import 'package:tadbirrah/features/auth/presentation/widgets/auth_footer_section_widget.dart';
import 'package:tadbirrah/features/auth/presentation/widgets/auth_header_widget.dart';
import 'package:tadbirrah/features/auth/presentation/widgets/form_container_widget.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
            child: SingleChildScrollView(
              child: AppSizedBox(
                width: double.infinity,
                child: BlocBuilder<AuthCubit, AuthState>(
                  buildWhen: (previous, current) =>
                      current is ToggleAuthModeState,
                  builder: (context, state) {
                    final cubit = context.read<AuthCubit>();
                    final isLogin = cubit.isLogin;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AuthHeaderWidget(),
                        const AppSizedBox(height: 32),
                        AuthBottomsBackgroundWidget(
                          isLogin: isLogin,
                          onLoginTap: () => cubit.toggleAuthMode(true),
                          onRegisterTap: () => cubit.toggleAuthMode(false),
                        ),
                        const AppSizedBox(height: 20),
                        FormContainerWidget(
                          isLogin: isLogin,
                        ),
                        const AppSizedBox(height: 24),
                        const AuthFooterSectionWidget(),
                        const AppSizedBox(height: 16),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


