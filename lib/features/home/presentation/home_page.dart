import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/features/home/data/developer_profile.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';
import 'package:personal_website/features/home/presentation/home_page_body_landscape.dart';
import 'package:personal_website/features/home/presentation/home_page_body_portrait.dart';
import 'package:personal_website/theme/theme.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileBloc = BlocProvider.of<ProfileCubit>(context);
    final orientation = OrientationProvider.of(context).orientation;
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: BlocBuilder<ProfileCubit, DeveloperProfile?>(
        bloc: profileBloc,
        builder: (context, profile) {
          if (profile == null) return Container();

          return orientation == Orientation.portrait
              ? HomePageBodyPortrait(profile: profile)
              : HomePageBodyLandscape(profile: profile);
        },
      ),
    );
  }
}
