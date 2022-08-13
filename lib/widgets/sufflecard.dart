import 'package:flutter/material.dart';

class ShuffleCard extends StatelessWidget {
  const ShuffleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shuffle,
              size: 30,
            ),
          ),
          const Text(
            "Shuffle All",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
