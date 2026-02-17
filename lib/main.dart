import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyWidget(),
  ));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  String display = "";
  double num1 = 0;
  double num2 = 0;
  String operator = "";

  final TextEditingController controller = TextEditingController();

  void buttonPressed(String value) {
    setState(() {
      display += value;
      controller.text = display;
    });
  }

  void clearAll() {
    setState(() {
      display = "";
      num1 = 0;
      num2 = 0;
      operator = "";
      controller.text = "";
    });
  }

  void setOperator(String op) {
    if (display.isEmpty) return;

    setState(() {
      num1 = double.parse(display);
      operator = op;
      display = "";
      controller.text = "";
    });
  }

  void calculate() {
    if (display.isEmpty) return;

    setState(() {
      num2 = double.parse(display);

      if (operator == "+") {
        display = (num1 + num2).toString();
      } else if (operator == "-") {
        display = (num1 - num2).toString();
      } else if (operator == "*") {
        display = (num1 * num2).toString();
      } else if (operator == "/") {
        display = (num1 / num2).toString();
      }

      controller.text = display;
    });
  }

  Widget buildButton(String text,
      {Color color = const Color.fromARGB(255, 115, 221, 133), Function()? onTap}) {
    return Container(
      width: 65,
      height: 55,
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 207, 207),
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: const Color.fromARGB(255, 133, 255, 129),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              readOnly: true,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 28),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton("7", onTap: () => buttonPressed("7")),
              buildButton("8", onTap: () => buttonPressed("8")),
              buildButton("9", onTap: () => buttonPressed("9")),
              buildButton("/", color: Colors.green,
                  onTap: () => setOperator("/")),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton("4", onTap: () => buttonPressed("4")),
              buildButton("5", onTap: () => buttonPressed("5")),
              buildButton("6", onTap: () => buttonPressed("6")),
              buildButton("*", color: Colors.green,
                  onTap: () => setOperator("*")),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton("1", onTap: () => buttonPressed("1")),
              buildButton("2", onTap: () => buttonPressed("2")),
              buildButton("3", onTap: () => buttonPressed("3")),
              buildButton("-", color: Colors.green,
                  onTap: () => setOperator("-")),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton("0", onTap: () => buttonPressed("0")),
              buildButton(".", onTap: () => buttonPressed(".")),
              buildButton("C", 
              color: const Color.fromARGB(255, 3, 211, 55),
                  onTap: clearAll),
              buildButton("+", color: Colors.green,
                  onTap: () => setOperator("+")),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 290,
                height: 55,
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: calculate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 5, 163, 31),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "=",
                    style: TextStyle(fontSize: 24,color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
