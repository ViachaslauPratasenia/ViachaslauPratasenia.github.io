import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/const/const.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';
import 'package:personal_website/features/home/domain/use_case/profile_state.dart';
import 'package:personal_website/features/home/presentation/components/download_button.dart';
import 'package:personal_website/features/home/presentation/home_page_body_landscape.dart';
import 'package:personal_website/features/home/presentation/home_page_body_portrait.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/theme/typografy.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileBloc = BlocProvider.of<ProfileCubit>(context);
    final orientation = OrientationProvider.of(context).orientation;
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        bloc: profileBloc,
        builder: (context, profileState) {
          if (profileState.isLoading) {
            return Center(child: CircularProgressIndicator(color: AppTheme.colors.accent));
          }

          if (profileState.developerProfile == null && !profileState.isLoading) {
            return const ErrorBlock();
          }

          if (profileState.developerProfile == null) return Container();

          return orientation == Orientation.portrait
              ? HomePageBodyPortrait(profile: profileState.developerProfile!)
              : HomePageBodyLandscape(profile: profileState.developerProfile!);
        },
      ),
    );
  }
}

class ErrorBlock extends StatelessWidget {
  const ErrorBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Oops',
              style: AppTheme.typography.mega.bold.accent,
            ),
            const SizedBox(height: 8),
            Text(
              'Something went wrong. But you can still download the resume by clicking the button below. Thank you for your understanding',
              style: AppTheme.typography.standard.regular.accent,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            DownloadButton(title: 'Download Resume', url: Const.config.CV_URL),
          ],
        ),
      ),
    );
  }
}
