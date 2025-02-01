import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/core/widgets/primary_button.dart';
import 'package:personal_website/features/admin/auth/domain/use_cases/admin_auth_cubit.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class AdminAuthScreen extends StatefulWidget {
  static const routeName = '/admin';

  const AdminAuthScreen({Key? key}) : super(key: key);

  @override
  State<AdminAuthScreen> createState() => _AdminAuthScreenState();
}

class _AdminAuthScreenState extends State<AdminAuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          decoration: BoxDecoration(
            color: AppColors.backgroundSecondary,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Admin Auth',
                style: context.textTheme.headlineSmall?.copyWith(color: AppColors.textPrimary),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                title: 'Login',
                width: 250,
                onPressed: () {
                  BlocProvider.of<AdminAuthCubit>(context).login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
              ),
              PrimaryButton(
                title: 'Test Request',
                width: 250,
                onPressed: () {
                  BlocProvider.of<ProfileCubit>(context).setNewName();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
