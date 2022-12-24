// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../core/componets/components.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  SfRangeValues _values = const SfRangeValues(40.0, 80.0);
  List<bool> isSelected = [true, false];
  List<bool> isSelectedBathRoom = [true, false, false, false, false, false];
  List<bool> isSelectedBedRoom = [true, false, false, false, false, false];
  var Selected = true;
  var Selected1 = true;
  var Selected2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          "Filters",
          style: TextStyle(color: Colors.black54),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text("Rest",
                  style: TextStyle(color: Colors.black54, fontSize: 17.0)))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "LOOKING FOR ",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                const Spacer(),
                Container(
                  height: 30.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black12),
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue,
                    // selectedBorderColor: Colors.black,
                    selectedColor: Colors.white,
                    renderBorder: false,
                    highlightColor: Colors.black26,
                    fillColor: Colors.blue,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Text(
                          "FOR RENT",
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Text(
                          "FOR SALE",
                          style: TextStyle(fontSize: 12.0),
                        ),
                      )
                    ],
                    isSelected: isSelected,
                    onPressed: (int newindex) {
                      setState(() {
                        for (int i = 0; i < isSelected.length; i++) {
                          if (i == newindex) {
                            isSelected[i] = true;
                          } else {
                            isSelected[i] = false;
                          }
                        }
                      });
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Container(
                  width: 110.0,
                  child: ChoiceChip(
                    label: Text(
                      "Residentail",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Selected ? Colors.white : Colors.blue,
                          fontSize: 15),
                    ),
                    selected: Selected,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: Colors.black12,
                    onSelected: (selected) {
                      setState(() {
                        Selected = selected;
                      });
                    },
                    selectedColor: Colors.blue,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 110.0,
                  child: ChoiceChip(
                    label: Text(
                      "commerical",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Selected1 ? Colors.white : Colors.blue,
                          fontSize: 15),
                    ),
                    selected: Selected1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: Colors.black12,
                    onSelected: (selected) {
                      setState(() {
                        Selected1 = selected;
                      });
                    },
                    selectedColor: Colors.blue,
                  ),
                ),
                Spacer(),
                Container(
                  width: 110.0,
                  child: ChoiceChip(
                    label: Text(
                      "industrail",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Selected2 ? Colors.white : Colors.blue,
                          fontSize: 15),
                    ),
                    selected: Selected2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: Colors.black12,
                    onSelected: (selected) {
                      setState(() {
                        Selected2 = selected;
                      });
                    },
                    selectedColor: Colors.blue,
                  ),
                ),
              ],
            ),
            const Text(
              "BED ROOM",
              style: TextStyle(fontSize: 15.0, color: Colors.black45),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Container(
                height: 45.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.black12),
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue,
                  // selectedBorderColor: Colors.black,
                  selectedColor: Colors.white,
                  renderBorder: false,
                  highlightColor: Colors.black26,
                  fillColor: Colors.blue,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "none",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "1",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "2",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "3",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "4",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "5",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    )
                  ],
                  isSelected: isSelectedBedRoom,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelectedBedRoom.length; i++) {
                        if (i == index) {
                          isSelectedBedRoom[i] = true;
                        } else {
                          isSelectedBedRoom[i] = false;
                        }
                      }
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "BATH ROOM",
              style: TextStyle(fontSize: 15.0, color: Colors.black45),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Container(
                height: 45.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.black12),
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue,
                  // selectedBorderColor: Colors.black,
                  selectedColor: Colors.white,
                  renderBorder: false,
                  highlightColor: Colors.black26,
                  fillColor: Colors.blue,
                  // ignore:
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "none",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "1",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "2",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "3",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "4",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "5",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    )
                  ],
                  isSelected: isSelectedBathRoom,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelectedBathRoom.length; i++) {
                        if (i == index) {
                          isSelectedBathRoom[i] = true;
                        } else {
                          isSelectedBathRoom[i] = false;
                        }
                      }
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SfRangeSlider(
              min: 0.0,
              max: 20000.0,
              values: _values,
              interval: 5000,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              numberFormat: NumberFormat("\$"),
              onChanged: (SfRangeValues values) {
                setState(() {
                  _values = values;
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            newbutton(
                function: () {},
                height: 40.0,
                text: "Show proparty",
                width: double.infinity,
                color: Colors.blue,
                colortext: Colors.white,
                colorRaduis: Colors.blue),
          ],
        ),
      ),
    );
  }
}
