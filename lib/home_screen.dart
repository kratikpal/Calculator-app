import 'package:calculator/my_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double ans = 0.0, n1 = 0.0, n2 = 0.0;
  final contoller1 = TextEditingController();
  final contoller2 = TextEditingController();

  void myToast() {
    Fluttertoast.showToast(
        msg: "Invalid number",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.deepOrange,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _sum() {
    try {
      setState(() {
        ans = double.parse(contoller1.text) + double.parse(contoller2.text);
      });
    } catch (e) {
      myToast();
    }
  }

  void _sub() {
    try {
      setState(() {
        ans = double.parse(contoller1.text) - double.parse(contoller2.text);
      });
    } catch (e) {
      myToast();
    }
  }

  void _mult() {
    try {
      setState(() {
        ans = double.parse(contoller1.text) * double.parse(contoller2.text);
      });
    } catch (e) {
      myToast();
    }
  }

  void _divide() {
    try {
      setState(() {
        ans = double.parse(contoller1.text) / double.parse(contoller2.text);
      });
    } catch (e) {
      myToast();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Calculator".text.make(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "Answer".text.purple600.xl4.make(),
            "$ans".text.xl3.make().p8(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: TextFormField(
                    controller: contoller1,
                    keyboardType: TextInputType.number,
                    // inputFormatters: <TextInputFormatter>[
                    //   FilteringTextInputFormatter.digitsOnly,
                    // ],
                    decoration: const InputDecoration(
                        labelText: "First Number",
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: TextFormField(
                    controller: contoller2,
                    keyboardType: TextInputType.number,
                    // inputFormatters: <TextInputFormatter>[
                    //   FilteringTextInputFormatter.digitsOnly
                    // ],
                    decoration: const InputDecoration(
                        labelText: "Second Number",
                        border: OutlineInputBorder()),
                  ),
                ),
              ],
            ).py8(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(buttonText: "+", action: _sum),
                MyButton(buttonText: "-", action: _sub)
              ],
            ).py8(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(buttonText: "*", action: _mult),
                MyButton(buttonText: "/", action: _divide),
              ],
            )
          ],
        ),
      ),
    );
  }
}
