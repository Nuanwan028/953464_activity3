import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  var price = TextEditingController();
  var amount = TextEditingController();
  var change = TextEditingController();
  double _total = 0;
  double _change = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Calculate")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Calculate",
                style: TextStyle(
                  fontFamily: "maa",
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: const Color.fromARGB(255, 52, 41, 173),
                  backgroundColor: Colors.indigoAccent.withOpacity(0.3),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/burger.png", height: 100),
                const SizedBox(width: 20),
                Image.network(
                  "https://miro.medium.com/v2/resize:fit:640/format:webp/1*pF-JFaEOEK4wkzaXDyC_ng.gif",
                  height: 60,
                ),
              ],
            ),

            const SizedBox(height: 20),
            priceTextField(),
            amountTextField(),
            calculateButton(),
            Center(child: showTotalText()),
            receiveMoneyTextField(),
            changeCalculateButton(),
            Center(child: showChangeText()),
          ],
        ),
      ),
    );
  }

  Widget priceTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: price,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "price per item",
        ),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        ],
      ),
    );
  }

  Widget amountTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: amount,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "amount of items",
        ),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        ],
      ),
    );
  }

  Widget calculateButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 233, 230, 248),
        ),
        onPressed: () {
          if (price.text.isNotEmpty && amount.text.isNotEmpty) {
            setState(() {
              _total = double.parse(price.text) * double.parse(amount.text);
            });
          }
        },
        child: Text("Calculate Total", style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget showTotalText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Total: $_total Bath"),
    );
  }

  Widget receiveMoneyTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: change,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "get money",
        ),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        ],
      ),
    );
  }

  Widget changeCalculateButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 233, 230, 248),
        ),
        onPressed: () {
          if (change.text.isNotEmpty) {
            double money = double.parse(change.text);

            if (money < _total) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Money is not enough")));
            } else {
              setState(() {
                _change = money - _total;
              });
            }
          }
        },
        child: Text("Calculate Change", style: TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget showChangeText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Change: $_change Bath"),
    );
  }
}
