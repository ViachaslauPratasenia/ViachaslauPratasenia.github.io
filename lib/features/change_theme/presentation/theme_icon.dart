import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/const/assets/assets.gen.dart';
import 'package:personal_website/features/change_theme/domain/use_case/theme_cubit.dart';

class ThemeIcon extends StatelessWidget {
  const ThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);
    return BlocBuilder<ThemeCubit, ThemeMode>(
      bloc: themeCubit,
      builder: (context, themeMode) {
        final icon =
            themeMode == ThemeMode.dark ? Assets.images.icNight.path : Assets.images.icSun.path;

        return GestureDetector(
          onTap: () => themeCubit.changeTheme(
            themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
          ),
          child: Container(
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.surface, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 6),
                Image.asset(
                  icon,
                  width: 24,
                  height: 24,
                  color: Theme.of(context).colorScheme.surface,
                ),
                const SizedBox(width: 12),
                Text(
                  themeMode == ThemeMode.dark ? 'Dark' : 'Light',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                ),
                const SizedBox(width: 6),
              ],
            ),
          ),
        );
      },
    );
  }
}
