// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, avoid_init_to_null, unused_import

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:property_management_system/core/componets/components.dart';
import 'package:property_management_system/core/model/property_model/property_model.dart';
import 'package:property_management_system/feature/add_screen/bloc/cubit/add_screen_cubit_cubit.dart';
import 'package:property_management_system/feature/home_screen/bloc/cubit/home_cubit.dart';
import 'package:property_management_system/feature/map_screen/map_screen.dart';
import 'package:property_management_system/injection_container.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  double _values = 10000;

  final descraption = TextEditingController();
  final room_namber = TextEditingController();
  final state = TextEditingController();
  final price = TextEditingController();
  final local = TextEditingController();
  final photo = TextEditingController();
  final bath_room_number = TextEditingController();
  final bed_room_number = TextEditingController();
  final proparty_type = TextEditingController();
  List<bool> isSelectedState = [true, false];
  final name = TextEditingController();
  var fromkey = GlobalKey<FormState>();

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.black),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.green,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.green,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    sl<AddScreenCubit>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: sl<AddScreenCubit>(),
      listener: (context, state) {
        if (state is AddScreenCubitUploadedAdding) {
          context.loaderOverlay.show();
        } else if (state is AddScreenCubitUploadedAdded) {
          context.loaderOverlay.hide();
          sl<HomeCubit>().initState();
          Navigator.pop(context);
        } else if (state is AddScreenCubitUploadedErorr) {
          context.loaderOverlay.hide();
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () async {
            if (fromkey.currentState!.validate()) {
              if (sl<AddScreenCubit>().fileList.isNotEmpty) {
                int index = sl<AddScreenCubit>().fileList.indexWhere(
                    (element) => element.state != ImageState.completed);
                if (index != -1) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("all images must be uploaded"),
                  ));
                } else if (sl<AddScreenCubit>().latLng == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("must pick your property location"),
                  ));
                } else {
                  String imagePathes = '';
                  for (int i = 0;
                      i < sl<AddScreenCubit>().fileList.length;
                      i++) {
                    imagePathes +=
                        sl<AddScreenCubit>().fileList[i].serverImagePath ?? "";
                    if (i < sl<AddScreenCubit>().fileList.length - 1) {
                      imagePathes += '@@';
                    }
                  }

                  sl<AddScreenCubit>().addProperty(PropertyModel(
                      bathroom: int.parse(bath_room_number.text),
                      bedroom: int.parse(bed_room_number.text),
                      description: descraption.text,
                      lan: sl<AddScreenCubit>().latLng!.longitude,
                      lat: sl<AddScreenCubit>().latLng!.latitude,
                      local: 'local.text',
                      name: name.text,
                      photo: imagePathes,
                      price: _values.ceil(),
                      propertyType: 'sss',
                      roomnumber: int.parse(
                        room_namber.text,
                      ),
                      state: state.text));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("you must upload un image for your porperty"),
                ));
              }
            }
          },
          child: Icon(Icons.create),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 00.0,
          title: Text(
            "Add Proprty",
            style: TextStyle(
                color: Colors.black45,
                fontSize: 23.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              key: fromkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          "Proprty State",
                          style: TextStyle(color: Colors.black54),
                        ),
                        Spacer(),
                        Container(
                          height: 30.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.black12),
                          child: ToggleButtons(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                            // selectedBorderColor: Colors.black,
                            selectedColor: Colors.white,
                            renderBorder: false,
                            highlightColor: Colors.black26,
                            fillColor: Colors.green,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: const Text(
                                  "FOR RENT",
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: const Text(
                                  "FOR SALE",
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              )
                            ],
                            isSelected: isSelectedState,
                            onPressed: (int newindex) {
                              setState(() {
                                for (int i = 0;
                                    i < isSelectedState.length;
                                    i++) {
                                  if (i == newindex) {
                                    isSelectedState[i] = true;
                                  } else {
                                    isSelectedState[i] = false;
                                  }
                                }
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  textAdd(
                    typ: TextInputType.text,
                    controller: name,
                    valedat1: (value) {
                      if (value.isEmpty) {
                        return 'User name  must not be Empty';
                      }
                      return null;
                    },
                    label1: 'Proparty Name',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  textAdd(
                    typ: TextInputType.number,
                    controller: room_namber,
                    valedat1: (value) {
                      if (value.isEmpty) {
                        return 'User name  must not be Empty';
                      }
                      return null;
                    },
                    label1: 'RoomNamber',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  textAdd(
                    typ: TextInputType.number,
                    controller: bath_room_number,
                    valedat1: (value) {
                      if (value.isEmpty) {
                        return 'User name  must not be Empty';
                      }
                      return null;
                    },
                    label1: 'BathRoomNumber',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  textAdd(
                    typ: TextInputType.number,
                    controller: bed_room_number,
                    valedat1: (value) {
                      if (value.isEmpty) {
                        return 'User name  must not be Empty';
                      }
                      return null;
                    },
                    label1: 'BedRoomNumber',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  textAdd(
                    typ: TextInputType.text,
                    controller: descraption,
                    valedat1: (value) {
                      if (value.isEmpty) {
                        return 'User name  must not be Empty';
                      }
                      return null;
                    },
                    label1: 'descraption',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  textAdd(
                    typ: TextInputType.text,
                    controller: state,
                    valedat1: (value) {
                      if (value.isEmpty) {
                        return 'User name  must not be Empty';
                      }
                      return null;
                    },
                    label1: 'State',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  BlocBuilder(
                      bloc: sl<AddScreenCubit>(),
                      builder: (context, state) {
                        return Center(
                          child: Container(
                            child: Text(
                              sl<AddScreenCubit>().latLng != null
                                  ? "property location selected"
                                  : "pick your location position",
                              style: TextStyle(
                                  color: sl<AddScreenCubit>().latLng != null
                                      ? Colors.green
                                      : Colors.red),
                            ),
                          ),
                        );
                      }),
                  Center(
                    child: MaterialButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MapScreen(locationPicker: true),
                            ));
                      },
                      child: const Text("choose location"),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Price",
                      style: TextStyle(fontSize: 18.0, color: Colors.black54),
                    ),
                  ),
                  SfSlider(
                    min: 10000,
                    max: 100000,
                    interval: 50000,
                    value: _values,
                    showTicks: true,
                    activeColor: Colors.green,
                    inactiveColor: Colors.green[100],
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: (dynamic value) {
                      setState(() {
                        _values = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  BlocBuilder(
                    bloc: sl<AddScreenCubit>(),
                    builder: (context, state) {
                      if (sl<AddScreenCubit>().fileList.isNotEmpty)
                        return Container(
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01),
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: FileImage(
                                                  sl<AddScreenCubit>()
                                                      .fileList[index]
                                                      .image))),
                                    ),
                                    Positioned(
                                      right: 3,
                                      top: 1,
                                      child: InkWell(
                                          onTap: () {
                                            sl<AddScreenCubit>()
                                                .removeImage(index);
                                          },
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          )),
                                    ),
                                    BlocBuilder(
                                      bloc: sl<AddScreenCubit>(),
                                      builder: (context, state) {
                                        if (sl<AddScreenCubit>()
                                                .fileList[index]
                                                .state ==
                                            ImageState.uploading)
                                          return Positioned(
                                              bottom: 0,
                                              left: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.7),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 3,
                                                  color: Colors.greenAccent,
                                                ),
                                              ));
                                        if (sl<AddScreenCubit>()
                                                .fileList[index]
                                                .state ==
                                            ImageState.retry) {
                                          return Positioned(
                                              bottom: 3,
                                              child: InkWell(
                                                  onTap: () {
                                                    sl<AddScreenCubit>()
                                                        .reUpload(index);
                                                  },
                                                  child: Icon(
                                                    Icons.upload,
                                                    color: Colors.white,
                                                  )));
                                        }
                                        return const Offstage();
                                      },
                                    )
                                  ],
                                );
                              },
                              itemCount: sl<AddScreenCubit>().fileList.length),
                        );
                      return const Offstage();
                    },
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10.0,
                      ),
                      MaterialButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        onPressed: () {
                          _showChoiceDialog(context);
                        },
                        child: const Text(
                          "Select Image",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openGallery(BuildContext context) async {
    // ignore: deprecated_member_use
    final ImagePicker pickedFile = ImagePicker();
    var imageFile = await pickedFile.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile != null) {
      sl<AddScreenCubit>().uploadImage(imageFile);
    }

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    // ignore: deprecated_member_use
    final ImagePicker pickedFile = ImagePicker();
    var imageFile = await pickedFile.pickImage(
      source: ImageSource.camera,
    );
    if (imageFile != null) {
      sl<AddScreenCubit>().uploadImage(imageFile);
    }
    Navigator.pop(context);
  }
}
