import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:property_management_system/core/Drawer/bloc/home_drawer_cubit/cubit/home_drawer_cubit.dart';
import 'package:property_management_system/core/Drawer/drawer_Item.dart';
import 'package:property_management_system/feature/favorite_screen/favorite_screen.dart';
import 'package:property_management_system/feature/home_screen/bloc/cubit/home_cubit.dart';
import 'package:property_management_system/feature/map_screen/map_screen.dart';
import 'package:property_management_system/feature/settings_screen/settings_screen.dart';
import 'package:property_management_system/injection_container.dart';

import '../constant/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: 6,
          style: BorderStyle.none,
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 20,
              color: Colors.grey.shade200,
              blurStyle: BlurStyle.solid),
        ],
      ),
      child: Drawer(
        elevation: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(.7), BlendMode.darken),
                        fit: BoxFit.cover,
                        image: sl<HomeCubit>().identity == null
                            ? AssetImage('assets/images/123.jpg')
                            : AdvancedNetworkImage(
                                sl<HomeCubit>().identity!.imageUrl ?? "",
                                timeoutDuration: Duration(seconds: 10)
                                // useDiskCache: true,
                                // cacheRule: const CacheRule(
                                //   maxAge: Duration(days: 7),
                                // ),
                                ) as ImageProvider,
                      ),
                      color: Colors.grey.shade900,
                      boxShadow: [BoxShadow(blurRadius: 20)],
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(110),
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(right: 40, top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            sl<HomeCubit>().identity == null
                                ? "Mohamad Alnashwati"
                                : sl<HomeCubit>().identity!.name ?? "",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: white,
                            ),
                          ),
                          Text(
                            sl<HomeCubit>().identity == null
                                ? 'Mohamad@gmail.com'
                                : sl<HomeCubit>().identity!.email ?? "",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 80,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: sl<HomeCubit>().identity == null
                                ? AssetImage('assets/images/123.jpg')
                                : AdvancedNetworkImage(
                                    sl<HomeCubit>().identity!.imageUrl ?? "",
                                    timeoutDuration: Duration(seconds: 10)
                                    // useDiskCache: true,
                                    // cacheRule: const CacheRule(
                                    //   maxAge: Duration(days: 7),
                                    // ),
                                    ) as ImageProvider,
                          ),
                          color: grey,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(blurRadius: 9, offset: Offset(0, 5))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 30),
              children: [
                const SizedBox(
                  height: 1,
                ),
                const Divider(
                  thickness: 1,
                  height: 2,
                  color: black,
                ),
                const SizedBox(
                  height: 40,
                ),
                DrawerItem(
                  name: 'Home',
                  icon: Icons.home_outlined,
                  onPressed: () => onItemPressed(context, index: 0),
                ),
                if (sl<HomeCubit>().identity != null &&
                    sl<HomeCubit>().identity!.user_role == 1)...[
                const SizedBox(
                  height: 20.0,
                ),

                  DrawerItem(
                    name: 'My Favorite',
                    icon: Icons.favorite_border,
                    onPressed: () => onItemPressed(context, index: 1),
                  ),],
                const SizedBox(
                  height: 20.0,
                ),
                DrawerItem(
                  name: 'Map',
                  icon: Icons.location_city,
                  onPressed: () => onItemPressed(context, index: 2),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DrawerItem(
                  name: 'Settings',
                  icon: Icons.settings_outlined,
                  onPressed: () => onItemPressed(context, index: 3),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Divider(
                  thickness: 1,
                  height: 2,
                  color: black,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DrawerItem(
                  name: 'Sign Out',
                  icon: Icons.logout_outlined,
                  onPressed: () => onItemPressed(context, index: 4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void onItemPressed(BuildContext context, {required int index}) {
  Navigator.pop(context);

  switch (index) {
    case 0:
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const LoginScreen()));
      break;
    case 1:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const FavoriteScreen()));
      break;
    case 2:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MapScreen()));
      break;
    case 3:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SettingsScreen()));
      break;
    case 4:
      sl<HomeDrawerCubit>().logout();
      break;
  }
}
