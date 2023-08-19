import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/features/home/data/developer_profile.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';
import 'package:personal_website/features/home/presentation/components/languages_block.dart';
import 'package:personal_website/features/home/presentation/components/social_buttons.dart';
import 'package:personal_website/features/home/presentation/components/work_item.dart';
import 'package:personal_website/theme/theme.dart';
import 'package:personal_website/theme/typografy.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileBloc = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: BlocBuilder<ProfileCubit, DeveloperProfile?>(
          bloc: profileBloc,
          builder: (context, profile) {
            if(profile == null) return Container();

            return Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 56),
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: MediaQuery.sizeOf(context).height,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 56),
                          Text(
                            profile.name,
                            style: AppTheme.typography.extraMega.bold.accent,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            profile.jobTitle,
                            textAlign: TextAlign.start,
                            style: AppTheme.typography.huge.regular.accent,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            profile.shortDescription,
                            textAlign: TextAlign.start,
                            style: AppTheme.typography.semiLarge.regular.textBase,
                          ),
                          const SizedBox(height: 56),
                          LanguagesBlock(languages: profile.languages),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.only(right: 56),
                      width: MediaQuery.sizeOf(context).width * 0.55,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          const SizedBox(height: 56),
                          Text(
                            profile.fullDescription,
                            style: AppTheme.typography.semiLarge.regular.textBase,
                          ),
                          const SizedBox(height: 80),
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: profile.work.length,
                            separatorBuilder: (context, index) => const SizedBox(height: 32),
                            itemBuilder: (context, index) => WorkItem(
                              workExperience: profile.work[index],
                            ),
                          ),
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 56,
                  left: 56,
                  child: SocialButtons(socialLinks: profile.socialLinks),
                )
              ],
            );
          }),
    );
  }
}
