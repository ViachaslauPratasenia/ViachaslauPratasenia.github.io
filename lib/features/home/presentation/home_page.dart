import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';
import 'package:personal_website/features/home/domain/use_case/profile_state.dart';
import 'package:personal_website/features/home/presentation/components/about/about_info.dart';
import 'package:personal_website/features/home/presentation/components/contact/contact_info.dart';
import 'package:personal_website/features/home/presentation/components/notes/notes_info.dart';
import 'package:personal_website/features/home/presentation/components/profile/profile_info.dart';
import 'package:personal_website/features/home/presentation/components/projects/project_info.dart';
import 'package:personal_website/features/home/presentation/components/work/work_info.dart';
import 'package:personal_website/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  static GlobalKey aboutKey = GlobalKey();
  static GlobalKey workKey = GlobalKey();
  static GlobalKey projectsKey = GlobalKey();
  static GlobalKey blogKey = GlobalKey();

  static const double tabSize = 72.0;

  @override
  Widget build(BuildContext context) {
    final profileBloc = BlocProvider.of<ProfileCubit>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        bloc: profileBloc,
        builder: (context, profileState) {
          if (profileState.isLoading) {
            return Center(
                child: CircularProgressIndicator(color: Theme.of(context).colorScheme.tertiary));
          }

          if (profileState.developerProfile == null && !profileState.isLoading) {
            return const ErrorBlock();
          }

          if (profileState.developerProfile == null) return Container();

          return SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 980),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: const Center(child: AboutInfo()),
                    ),
                    const ProfileInfo(),
                    const WorkInfo(),
                    const ProjectInfo(),
                    const NotesInfo(),
                    const ContactInfo(),
                  ],
                ),
              ),
            ),
          );
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
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Something went wrong. But you can still download the resume by clicking the button below. Thank you for your understanding',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // DownloadButton(title: 'Download Resume', url: Const.config.CV_URL),
          ],
        ),
      ),
    );
  }
}
