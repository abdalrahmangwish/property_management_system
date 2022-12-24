import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:property_management_system/core/componets/components.dart';
import 'package:property_management_system/feature/comments_screen/comments_screen.dart';
import 'package:property_management_system/feature/details_screen/bloc/details_cubit.dart';
import 'package:property_management_system/feature/edit_screen/edit_screen.dart';
import 'package:property_management_system/injection_container.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    sl<DetailsCubit>().initState(widget.id);
  }

  @override
  void dispose() {
    sl<DetailsCubit>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DetailsCubit bloc = sl<DetailsCubit>();
    return BlocBuilder(
        bloc: sl<DetailsCubit>(),
        builder: (context, state) {
          if (bloc.propertyDetailsModel != null)
            return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditScreen(),
                        ));
                  },
                  child: Icon(Icons.edit),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 300.0,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return Image(
                                image: AdvancedNetworkImage(
                                  bloc.propertyDetailsModel!.photo![index],
                                ),
                                fit: BoxFit.fill,
                              );
                            },
                            autoplay: true,
                            itemCount: bloc.propertyDetailsModel!.photo!.length,
                            pagination: const SwiperPagination(
                              alignment: Alignment.bottomCenter,
                            ),
                            control: const SwiperControl(
                                color: Colors.black87,
                                disableColor: Colors.black),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              "State :",
                              style: TextStyle(color: Colors.green),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              bloc.propertyDetailsModel!.state.toString(),
                              style: TextStyle(color: Colors.black54),
                            ),
                            Spacer(),
                            Text(bloc.propertyDetailsModel!.viewCount
                                .toString()),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.remove_red_eye,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text("4.3"),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.star_rate,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Price",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.00),
                        child: Text(
                          bloc.propertyDetailsModel!.price.toString() + "\$",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.black54),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.bedroom_child,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    bloc.propertyDetailsModel!.bedroomnumber
                                        .toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.black54),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.bathroom,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    bloc.propertyDetailsModel!.bathroomnumber
                                        .toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.black54),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    bloc.propertyDetailsModel!.propartytype
                                        .toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Description",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          bloc.propertyDetailsModel!.description ?? "",
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ),
                      newbutton(
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => TestMe())));
                          },
                          height: 50.0,
                          text: "comments",
                          width: double.infinity,
                          color: Colors.white,
                          colortext: Colors.green,
                          colorRaduis: Colors.green)
                    ],
                  ),
                ));
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
