import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_management_system/core/constant/colors.dart';
import 'package:property_management_system/core/model/property_model/my_property_local_model.dart';
import 'package:property_management_system/feature/details_screen/details_screen.dart';
import 'package:property_management_system/feature/favorite_screen/bloc/favorite_cubit.dart';
import 'package:property_management_system/injection_container.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    sl<FavoriteCubit>().initState();
  }

  @override
  Widget build(BuildContext context) {
    FavoriteCubit bloc = sl<FavoriteCubit>();
    return BlocBuilder(
        bloc: sl<FavoriteCubit>(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('My Property'),
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: sl<FavoriteCubit>().li.isEmpty
                  ? Center(
                      child: Text('we have nothing to show'),
                    )
                  : GridView.builder(
                      itemCount: sl<FavoriteCubit>().li.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 60,
                        crossAxisSpacing: 1,
                      ),
                      itemBuilder: (context, index) {
                        return favorite(bloc.li[index]);
                      }),
            ),
          );
        });
  }

  Widget favorite(MyPropertyLocalModel propertyLocalModel) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailsScreen(id: propertyLocalModel.id ?? -1),
            ));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(7),
        alignment: Alignment.bottomCenter,
        height: 180,
        width: MediaQuery.of(context).size.width * 0.20,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AdvancedNetworkImage(propertyLocalModel.photo!.first,
                retryDuration: Duration(milliseconds: 100)
                // useDiskCache: true,
                // cacheRule: const CacheRule(
                //   maxAge: Duration(days: 7),
                // ),)
                ),
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: 5.0,
              blurRadius: 25,
              color: grey.withOpacity(0.7),
            ),
          ],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          fit: StackFit.expand,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  propertyLocalModel.name ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                    child: Text(
                  '${propertyLocalModel.price} \$',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )),
              ],
            ),
            Positioned(
              child: IconButton(
                onPressed: () {
                  sl<FavoriteCubit>()
                      .deleteProperty(propertyLocalModel.id ?? -1);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              top: 0,
            )
          ],
        ),
      ),
    );
  }
}
