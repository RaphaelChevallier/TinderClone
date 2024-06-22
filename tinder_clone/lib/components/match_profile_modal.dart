import 'package:flutter/material.dart';

class MatchProfileModal extends StatelessWidget {
  const MatchProfileModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
