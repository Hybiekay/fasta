import '../Apis/google_api.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

TextEditingController firstCon = TextEditingController();
TextEditingController SecondCon = TextEditingController();

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstCon,
              decoration: InputDecoration(hintText: "Address"),
            ),
            TextField(
              controller: SecondCon,
              decoration: InputDecoration(hintText: "Address"),
            ),
            ElevatedButton(
                onPressed: () async {
                  await Location.getdirection(
                      origin: firstCon.text, destination: SecondCon.text);
                },
                child: Text("testing")),
          ],
        ),
      ),
    );
  }
}
