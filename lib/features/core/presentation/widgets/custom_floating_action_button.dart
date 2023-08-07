import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    required this.heroTag,
    required this.icon,
    super.key,
    required this.onPressed,
    this.tooltip,
  });

  const CustomFloatingActionButton.withStates({
    required IconData activeIcon,
    required String heroTag,
    required IconData inactiveIcon,
    required bool isActive,
    Key? key,
    required void Function()? onPressed,
    String? activeTooltip,
    String? inactiveTooltip,
  }) : this(
          heroTag: heroTag,
          icon: isActive ? activeIcon : inactiveIcon,
          key: key,
          onPressed: onPressed,
          tooltip: isActive ? activeTooltip : inactiveTooltip,
        );

  final String heroTag;
  final void Function()? onPressed;
  final String? tooltip;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      heroTag: heroTag,
      onPressed: onPressed,
      tooltip: tooltip,
      child: Icon(icon),
    );
  }
}
