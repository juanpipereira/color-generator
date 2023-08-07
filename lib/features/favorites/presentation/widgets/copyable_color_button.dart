import 'package:color_generator/features/core/domain/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyableColorButton extends StatelessWidget {
  const CopyableColorButton({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Copy the selected color',
      icon: const Icon(Icons.copy),
      onPressed: () async {
        await Clipboard.setData(
          ClipboardData(text: color.toHex()),
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('You copied the color!'),
              duration: Duration(seconds: 1),
              showCloseIcon: true,
            ),
          );
        }
      },
      style: IconButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
