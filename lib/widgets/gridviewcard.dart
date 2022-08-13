import 'package:flutter/material.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({
    Key? key,
    required this.context,
    required this.title,
  }) : super(key: key);
  final BuildContext context;
  final String title;
  // final Image cover;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
            child: Image(
              image: AssetImage('assets/images/artist1.png'),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/play.png',
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
