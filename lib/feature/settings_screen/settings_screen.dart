import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:property_management_system/feature/help_screen/help_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool status = true;
  late bool status1 = true;
  late bool status2 = true;
  // bool canCheckBiometrics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Settings",
      )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "General",
              style: TextStyle(color: Colors.green, fontSize: 20.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Icon(
                    Icons.language,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  "Language",
                  style: TextStyle(color: Colors.black54),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => HelpScreen())));
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black45,
                    )),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Icon(
                    Icons.dark_mode,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  "Dark Mode",
                  style: TextStyle(color: Colors.black54),
                ),
                Spacer(),
                Container(
                  child: FlutterSwitch(
                    width: 55.0,
                    height: 25.0,
                    activeColor: Colors.green,
                    valueFontSize: 10.0,
                    toggleSize: 30.0,
                    value: status1,
                    borderRadius: 30.0,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status1 = val;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Scurity",
              style: TextStyle(color: Colors.green, fontSize: 20.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Icon(Icons.fingerprint),
                ),
                Text(
                  "Use fingerprint",
                  style: TextStyle(color: Colors.black54),
                ),
                Spacer(),
                Container(
                  child: FlutterSwitch(
                    width: 55.0,
                    height: 25.0,
                    activeColor: Colors.green,
                    valueFontSize: 10.0,
                    toggleSize: 30.0,
                    value: status2,
                    borderRadius: 30.0,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status2 = val;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Others",
              style: TextStyle(color: Colors.green, fontSize: 20.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Icon(Icons.help, color: Colors.black54),
                ),
                Container(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'help',
                          style: TextStyle(color: Colors.black54),
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
