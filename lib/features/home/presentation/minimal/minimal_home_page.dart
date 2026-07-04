import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/theme/minimal/minimal_colors.dart';
import 'package:personal_website/features/change_theme/domain/use_case/theme_cubit.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';
import 'package:personal_website/features/home/domain/use_case/profile_cubit.dart';
import 'package:personal_website/features/home/domain/use_case/profile_state.dart';
import 'package:personal_website/features/home/presentation/minimal/nav/minimal_nav_bar.dart';
import 'package:personal_website/features/home/presentation/minimal/widgets/minimal_loader.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_hero.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_about.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_experience.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_skills.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_projects.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_writing.dart';
import 'package:personal_website/features/home/presentation/minimal/sections/minimal_contact.dart';

class MinimalHomePage extends StatefulWidget {
  static const routeName = '/';

  const MinimalHomePage({super.key});

  @override
  State<MinimalHomePage> createState() => _MinimalHomePageState();
}

class _MinimalHomePageState extends State<MinimalHomePage> {
  // Index order must match kNavItems: About, Work(=Experience), Projects, Writing, Contact.
  final _aboutKey = GlobalKey();
  final _workKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _writingKey = GlobalKey();
  final _contactKey = GlobalKey();

  late final List<GlobalKey> _navTargets = [
    _aboutKey,
    _workKey,
    _projectsKey,
    _writingKey,
    _contactKey,
  ];

  final _scrollController = ScrollController();
  final _progress = ValueNotifier<double>(0);
  final _activeIndex = ValueNotifier<int>(-1);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _progress.dispose();
    _activeIndex.dispose();
    super.dispose();
  }

  /// Updates the reading-progress bar and the active nav section. The active
  /// section is the last nav target whose top has scrolled past the nav.
  void _onScroll() {
    final max = _scrollController.position.maxScrollExtent;
    _progress.value = max <= 0 ? 0 : _scrollController.offset / max;

    var active = -1;
    for (var i = 0; i < _navTargets.length; i++) {
      final ctx = _navTargets[i].currentContext;
      final box = ctx?.findRenderObject() as RenderBox?;
      if (box == null || !box.attached) continue;
      if (box.localToGlobal(Offset.zero).dy <= 160) active = i;
    }
    _activeIndex.value = active;
  }

  void _scrollTo(int index) {
    final ctx = _navTargets[index].currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.minimal;
    final profileState = context.watch<ProfileCubit>().state;
    final themeMode = context.watch<ThemeCubit>().state;
    final isDark = themeMode == ThemeMode.dark;

    return Scaffold(
      backgroundColor: colors.bg,
      body: Stack(
        children: [
          _buildBody(context, profileState),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: MinimalNavBar(
              isDark: isDark,
              onToggleTheme: () => context
                  .read<ThemeCubit>()
                  .changeTheme(isDark ? ThemeMode.light : ThemeMode.dark),
              onItemTap: _scrollTo,
              activeIndex: _activeIndex,
              progress: _progress,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, ProfileState state) {
    if (state.isLoading) {
      return const MinimalLoader();
    }
    final profile = state.developerProfile;
    if (profile == null) {
      return Center(
        child: Text('Something went wrong.',
            style: TextStyle(color: context.minimal.muted)),
      );
    }
    return _Content(
      profile: profile,
      scrollController: _scrollController,
      aboutKey: _aboutKey,
      workKey: _workKey,
      projectsKey: _projectsKey,
      writingKey: _writingKey,
      contactKey: _contactKey,
    );
  }
}

class _Content extends StatelessWidget {
  final DeveloperProfile profile;
  final ScrollController scrollController;
  final GlobalKey aboutKey, workKey, projectsKey, writingKey, contactKey;

  const _Content({
    required this.profile,
    required this.scrollController,
    required this.aboutKey,
    required this.workKey,
    required this.projectsKey,
    required this.writingKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          MinimalHero(profile: profile),
          MinimalAbout(key: aboutKey, profile: profile),
          MinimalExperience(key: workKey, profile: profile),
          MinimalSkills(profile: profile),
          MinimalProjects(key: projectsKey, profile: profile),
          MinimalWriting(key: writingKey, profile: profile),
          MinimalContact(key: contactKey, profile: profile),
        ],
      ),
    );
  }
}
