import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/const/const.dart';
import 'package:personal_website/core/widgets/animated_gradient_background.dart';
import 'package:personal_website/core/widgets/animated_particles_background.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';
import 'package:personal_website/features/home/domain/use_case/profile_state.dart';
import 'package:personal_website/features/home/presentation/components/about/modern_about_info.dart';
import 'package:personal_website/features/home/presentation/components/contact/modern_contact_info.dart';
import 'package:personal_website/features/home/presentation/components/menu_drawer.dart';
import 'package:personal_website/features/home/presentation/components/notes/modern_notes_info.dart';
import 'package:personal_website/features/home/presentation/components/profile/modern_profile_info.dart';
import 'package:personal_website/features/home/presentation/components/projects/modern_project_info.dart';
import 'package:personal_website/features/home/presentation/components/modern_tab_bar.dart';
import 'package:personal_website/features/home/presentation/components/work/modern_work_info.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  static GlobalKey aboutKey = GlobalKey();
  static GlobalKey servicesKey = GlobalKey();
  static GlobalKey experienceKey = GlobalKey();
  static GlobalKey workKey = GlobalKey();
  static GlobalKey articlesKey = GlobalKey();
  static GlobalKey contactKey = GlobalKey();

  static const double tabHeight = 80.0;

  @override
  Widget build(BuildContext context) {
    final profileBloc = BlocProvider.of<ProfileCubit>(context);

    return AnimatedGradientBackground(
      child: AnimatedParticlesBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          endDrawer: MenuDrawer(
            onAboutMeClicked: () => navigateToBlock(aboutKey),
            onServicesClicked: () => navigateToBlock(servicesKey),
            onExperienceClicked: () => navigateToBlock(experienceKey),
            onWorkClicked: () => navigateToBlock(workKey),
            onArticlesClicked: () => navigateToBlock(articlesKey),
            onContactClicked: () => navigateToBlock(contactKey),
          ),
          body: BlocBuilder<ProfileCubit, ProfileState>(
            bloc: profileBloc,
            builder: (context, profileState) {
              if (profileState.isLoading) {
                return Center(
                    child:
                        CircularProgressIndicator(color: Theme.of(context).colorScheme.tertiary));
              }

              if (profileState.developerProfile == null && !profileState.isLoading) {
                return const ErrorBlock();
              }

              if (profileState.developerProfile == null) return Container();

              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ModernProfileAppBar(
                        tabHeight: tabHeight,
                        onAboutMeClicked: () => navigateToBlock(aboutKey),
                        onServicesClicked: () => navigateToBlock(servicesKey),
                        onExperienceClicked: () => navigateToBlock(experienceKey),
                        onWorkClicked: () => navigateToBlock(workKey),
                        onArticlesClicked: () => navigateToBlock(articlesKey),
                        onContactClicked: () => navigateToBlock(contactKey),
                        onMenuClicked: () => Scaffold.of(context).openEndDrawer(),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: Const.config.MAX_LANDSCAPE_WIDTH.toDouble(),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 1.1 - tabHeight,
                              child: Center(
                                child: ModernAboutInfo(
                                  developerProfile: profileState.developerProfile!,
                                  onViewWorkPressed: () => navigateToBlock(workKey),
                                ),
                              ),
                            ),
                            ModernProfileInfo(
                              key: aboutKey,
                              developerProfile: profileState.developerProfile!,
                            ),
                            ModernWorkInfo(
                                key: experienceKey,
                                developerProfile: profileState.developerProfile!),
                            ModernProjectInfo(
                              key: workKey,
                              developerProfile: profileState.developerProfile!,
                            ),
                            ModernNotesInfo(
                              key: articlesKey,
                              developerProfile: profileState.developerProfile!,
                            ),
                            ModernContactInfo(
                              key: contactKey,
                              developerProfile: profileState.developerProfile!,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void navigateToBlock(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
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
