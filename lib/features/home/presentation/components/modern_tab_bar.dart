import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:personal_website/core/orientation_provider.dart';
import 'package:personal_website/theme/app_colors.dart';
import 'package:personal_website/theme/theme_controller.dart';

class ModernProfileAppBar extends StatefulWidget {
  final void Function()? onAboutMeClicked;
  final void Function()? onServicesClicked;
  final void Function()? onExperienceClicked;
  final void Function()? onWorkClicked;
  final void Function()? onArticlesClicked;
  final void Function()? onContactClicked;
  final void Function()? onMenuClicked;
  final double tabHeight;

  const ModernProfileAppBar({
    super.key,
    required this.tabHeight,
    this.onAboutMeClicked,
    this.onServicesClicked,
    this.onExperienceClicked,
    this.onWorkClicked,
    this.onArticlesClicked,
    this.onContactClicked,
    this.onMenuClicked,
  });

  @override
  State<ModernProfileAppBar> createState() => _ModernProfileAppBarState();
}

class _ModernProfileAppBarState extends State<ModernProfileAppBar> {
  double opacity = 0;
  bool isScrolled = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 250), () {
      if (mounted) {
        setState(() {
          opacity = 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = OrientationProvider.of(context).orientation;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      opacity: opacity,
      child: Container(
        height: widget.tabHeight,
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: orientation == Orientation.landscape ? 48 : 24,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.background.withValues(alpha: 0.95),
              AppColors.background.withValues(alpha: 0.9),
            ],
          ),
          border: Border(
            bottom: BorderSide(
              color: AppColors.primary.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.glowPrimary.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _ModernLogo(),
                if (orientation == Orientation.landscape)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _ModernTabItem(
                        index: '01',
                        title: 'About',
                        onTap: widget.onAboutMeClicked,
                      ),
                      const SizedBox(width: 32),
                      _ModernTabItem(
                        index: '02',
                        title: 'Services',
                        onTap: widget.onServicesClicked,
                      ),
                      const SizedBox(width: 32),
                      _ModernTabItem(
                        index: '03',
                        title: 'Experience',
                        onTap: widget.onExperienceClicked,
                      ),
                      const SizedBox(width: 32),
                      _ModernTabItem(
                        index: '04',
                        title: 'Projects',
                        onTap: widget.onWorkClicked,
                      ),
                      const SizedBox(width: 32),
                      _ModernTabItem(
                        index: '05',
                        title: 'Articles',
                        onTap: widget.onArticlesClicked,
                      ),
                      const SizedBox(width: 32),
                      _ModernTabItem(
                        index: '06',
                        title: 'Contact',
                        onTap: widget.onContactClicked,
                      ),
                    ],
                  )
                else
                  _ModernMenuButton(onPressed: widget.onMenuClicked),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ModernLogo extends StatefulWidget {
  const _ModernLogo();

  @override
  State<_ModernLogo> createState() => _ModernLogoState();
}

class _ModernLogoState extends State<_ModernLogo> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _isHovered
                ? [
                    AppColors.primary.withValues(alpha: 0.3),
                    AppColors.secondary.withValues(alpha: 0.3),
                  ]
                : [
                    AppColors.primary.withValues(alpha: 0.1),
                    AppColors.secondary.withValues(alpha: 0.1),
                  ],
          ),
          border: Border.all(
            color: _isHovered
                ? AppColors.primary.withValues(alpha: 0.6)
                : AppColors.primary.withValues(alpha: 0.3),
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.glowPrimary,
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: Center(
          child: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [AppColors.primary, AppColors.accent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              'V',
              style: context.textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                height: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ModernTabItem extends StatefulWidget {
  final String index;
  final String title;
  final void Function()? onTap;

  const _ModernTabItem({
    required this.index,
    required this.title,
    this.onTap,
  });

  @override
  State<_ModernTabItem> createState() => _ModernTabItemState();
}

class _ModernTabItemState extends State<_ModernTabItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (hover) => setState(() => _isHovered = hover),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _isHovered
                  ? AppColors.primary.withValues(alpha: 0.8)
                  : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${widget.index}. ',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: widget.title,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: _isHovered ? AppColors.primary : AppColors.textPrimary,
                  fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModernMenuButton extends StatefulWidget {
  final void Function()? onPressed;

  const _ModernMenuButton({this.onPressed});

  @override
  State<_ModernMenuButton> createState() => _ModernMenuButtonState();
}

class _ModernMenuButtonState extends State<_ModernMenuButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              AppColors.primary.withValues(alpha: _isPressed ? 0.3 : 0.1),
              AppColors.secondary.withValues(alpha: _isPressed ? 0.3 : 0.1),
            ],
          ),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: _isPressed ? 0.6 : 0.3),
            width: 1,
          ),
        ),
        child: Icon(
          Icons.menu,
          color: AppColors.primary,
          size: 24,
        ),
      ),
    );
  }
}

