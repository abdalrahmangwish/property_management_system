import 'package:flutter/material.dart';
import '../../core/componets/components.dart';

class EditScreen extends StatefulWidget {
  EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var nameEdit = TextEditingController();

  var descriptionEdit = TextEditingController();

  var stateEdit = TextEditingController();

  var priceEdit = TextEditingController();

  List<bool> isSelectedStateEdit = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 00.0,
        title: Text(
          "Edit Proprty",
          style: TextStyle(
              color: Colors.black45,
              fontSize: 23.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    "Edit Proprty State",
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
                      isSelected: isSelectedStateEdit,
                      onPressed: (int newindex) {
                        setState(() {
                          for (int i = 0; i < isSelectedStateEdit.length; i++) {
                            if (i == newindex) {
                              isSelectedStateEdit[i] = true;
                            } else {
                              isSelectedStateEdit[i] = false;
                            }
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            textAdd(
              typ: TextInputType.text,
              controller: nameEdit,
              valedat1: (value) {
                if (value.isEmpty) {
                  return 'Proprty Name  must not be Empty';
                }
                return null;
              },
              label1: 'Edit Name',
            ),
            const SizedBox(
              height: 8.0,
            ),
            textAdd(
              typ: TextInputType.text,
              controller: nameEdit,
              valedat1: (value) {
                if (value.isEmpty) {
                  return 'Proprty Description must not be Empty';
                }
                return null;
              },
              label1: 'Edit Description',
            ),
            const SizedBox(
              height: 8.0,
            ),
            textAdd(
              typ: TextInputType.text,
              controller: nameEdit,
              valedat1: (value) {
                if (value.isEmpty) {
                  return 'Proprty Price  must not be Empty';
                }
                return null;
              },
              label1: 'Edit Price',
            ),
            const SizedBox(
              height: 8.0,
            ),
            newbutton(
                function: () {},
                height: 50,
                text: "Edite Proprty",
                width: double.infinity,
                color: Colors.white,
                colortext: Colors.green,
                colorRaduis: Colors.green)
          ],
        ),
      ),
    );
  }
}
