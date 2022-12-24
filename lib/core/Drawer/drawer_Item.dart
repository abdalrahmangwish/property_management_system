import 'package:flutter/material.dart';

import '../constant/colors.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key,
      required this.name,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20.0,
            ),
            Icon(
              icon,
              size: 25,
              color: black.withOpacity(0.9),
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              name,
              style: const TextStyle(
                color: black,
                fontWeight: FontWeight.w300,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
