import 'package:flutter/material.dart';

class CustomOutlinedIconButton extends StatelessWidget {
  const CustomOutlinedIconButton({
    required this.icon,
    this.isError = false,
    super.key,
    required this.label,
    required this.onPressed,
    this.tooltip,
    this.style,
  });

  const CustomOutlinedIconButton.error({
    required IconData icon,
    Key? key,
    required String label,
    required void Function()? onPressed,
    String? tooltip,
    ButtonStyle? style,
  }) : this(
          icon: icon,
          isError: true,
          key: key,
          label: label,
          onPressed: onPressed,
          style: style,
          tooltip: tooltip,
        );

  static const double _errorBorderWidth = 0.6;

  final IconData icon;
  final String label;
  final void Function()? onPressed;
  final String? tooltip;
  final ButtonStyle? style;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: OutlinedButton.icon(
        icon: Icon(icon),
        onPressed: onPressed,
        label: Text(label),
        style: isError
            ? style ??
                TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.error,
                    width: _errorBorderWidth,
                  ),
                  surfaceTintColor: Theme.of(context).colorScheme.error,
                )
            : style ??
                TextButton.styleFrom(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
      ),
    );
  }
}
