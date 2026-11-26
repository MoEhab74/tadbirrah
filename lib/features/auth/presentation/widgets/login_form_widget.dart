import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tadbirrah/core/functions/validate_auth_fields.dart';
import 'package:tadbirrah/core/routing/app_routes.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_buttom.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';
import 'package:tadbirrah/core/widgets/app_text_field_widget.dart';
import 'package:tadbirrah/features/auth/presentation/manager/cubit/auth_cubit.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    // Temporarily just for ui
    context.push(AppRoutes.householdSetup);
    // if (_formKey.currentState?.validate() ?? false) {
    //   context.read<AuthCubit>().login(
    //         email: _emailController.text.trim(),
    //         password: _passwordController.text,
    //       );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'البريد الإلكتروني',
            style: AppTextStyles.semiBold12.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const AppSizedBox(height: 8),
          AppTextFormField(
            controller: _emailController,
            hintText: 'ahmed.family@email.com',
            keyboardType: TextInputType.emailAddress,
            validator: ValidateAuthFields.validateEmail,
          ),
          const AppSizedBox(height: 16),
          Text(
            'كلمة المرور',
            style: AppTextStyles.semiBold12.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const AppSizedBox(height: 8),
          AppTextFormField(
            controller: _passwordController,
            hintText: '••••••••••',
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() => _obscurePassword = !_obscurePassword);
              },
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.onSurfaceVariant,
              ),
            ),
            validator: ValidateAuthFields.validatePassword,
          ),
          const AppSizedBox(height: 12),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () {
                // TODO: Navigate to forgot password
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'نسيت كلمة المرور؟',
                style: AppTextStyles.semiBold12.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          const AppSizedBox(height: 16),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return AppButton(
                text: 'دخول لمطبخ البيت',
                isLoading: state is AuthLoading,
                onPressed: _onSubmit,
              );
            },
          ),
        ],
      ),
    );
  }
}
