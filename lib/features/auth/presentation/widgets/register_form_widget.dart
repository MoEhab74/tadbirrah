import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadbirrah/core/functions/validate_auth_fields.dart';
import 'package:tadbirrah/core/theme/styles/app_colors.dart';
import 'package:tadbirrah/core/theme/styles/app_text_styles.dart';
import 'package:tadbirrah/core/widgets/app_buttom.dart';
import 'package:tadbirrah/core/widgets/app_sized_box.dart';
import 'package:tadbirrah/core/widgets/app_text_field_widget.dart';
import 'package:tadbirrah/features/auth/presentation/manager/cubit/auth_cubit.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    // if (_formKey.currentState?.validate() ?? false) {
    //   context.read<AuthCubit>().signUp(
    //         familyName: _nameController.text.trim(),
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
            'اسم الأسرة أو المستخدم',
            style: AppTextStyles.semiBold12.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const AppSizedBox(height: 8),
          AppTextFormField(
            controller: _nameController,
            hintText: 'العيلة الكبيرة',
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'من فضلك أدخل الاسم';
              }
              return null;
            },
          ),
          const AppSizedBox(height: 16),
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
          const AppSizedBox(height: 16),
          Text(
            'تأكيد كلمة المرور',
            style: AppTextStyles.semiBold12.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const AppSizedBox(height: 8),
          AppTextFormField(
            controller: _confirmPasswordController,
            hintText: '••••••••••',
            obscureText: _obscureConfirmPassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(
                  () => _obscureConfirmPassword = !_obscureConfirmPassword,
                );
              },
              icon: Icon(
                _obscureConfirmPassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.onSurfaceVariant,
              ),
            ),
            validator: (value) => ValidateAuthFields.validateConfirmPassword(
              value,
              _passwordController.text,
            ),
          ),
          const AppSizedBox(height: 20),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return AppButton(
                text: 'إنشاء حساب بيت جديد',
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
