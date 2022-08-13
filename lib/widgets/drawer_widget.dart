import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themestate = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/drawerbg.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                          radius: 40.0,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          backgroundImage: const AssetImage(
                            'assets/logo/logo.png',
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Music Library",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                    title: Text(
                      themestate.getDarkTheme ? "Light Mode" : "Dark mode ",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Icon(
                      themestate.getDarkTheme
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onTap: () {
                      themestate.setTheme = !themestate.getDarkTheme;
                    }),
                _buildlistTile(
                  buttonText: "Listen Now",
                  ontap: () {},
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                _buildlistTile(
                  buttonText: "Recents",
                  ontap: () {},
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                _buildlistTile(
                  buttonText: "Music Library",
                  ontap: () {},
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildlistTile(
      {required Color color,
      required Function ontap,
      required String buttonText}) {
    return Material(
      color: color,
      child: ListTile(
        minVerticalPadding: 0,
        title: Text(
          buttonText,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        onTap: () {
          ontap();
        },
      ),
    );
  }
}
