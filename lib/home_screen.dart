import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  void _sum() {
    setState(() {
      ans = double.parse(contoller1.text) + double.parse(contoller2.text);
    });
  }

  void _sub() {
    setState(() {
      ans = double.parse(contoller1.text) - double.parse(contoller2.text);
    });
  }

  void _mult() {
    setState(() {
      ans = double.parse(contoller1.text) * double.parse(contoller2.text);
    });
  }

  void _divide() {
    setState(() {
      ans = double.parse(contoller1.text) / double.parse(contoller2.text);
    });
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
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
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
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
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
                ElevatedButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    _sum();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 35)),
                  child: "+".text.xl3.make(),
                ),
                ElevatedButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    _sub();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 35)),
                  child: "-".text.xl3.make(),
                ),
              ],
            ).py8(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    _mult();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 35)),
                  child: "*".text.xl3.make(),
                ),
                ElevatedButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    _divide();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 35)),
                  child: "/".text.xl3.make(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
