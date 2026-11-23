import 'package:flutter/material.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_buttom.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';
import 'package:tadbirrah/core/widgets/app_text_field_widget.dart';

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
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Trigger login via AuthCubit
    }
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
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'من فضلك أدخل البريد الإلكتروني';
              }
              if (!value.contains('@')) {
                return 'البريد الإلكتروني غير صحيح';
              }
              return null;
            },
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'من فضلك أدخل كلمة المرور';
              }
              if (value.length < 6) {
                return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
              }
              return null;
            },
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
          AppButton(
            text: 'دخول لمطبخ البيت',
            onPressed: _onSubmit,
          ),
        ],
      ),
    );
  }
}
