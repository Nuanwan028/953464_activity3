import 'package:firstapp/pages/calc.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // final items = List<String>.generate(100, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    List mydata = ['apple', 'banana', 'cherry'];

    return ListView.builder(
      itemCount: mydata.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CalculatePage()),
            );
          },
          leading: const Icon(Icons.apple, color: Colors.deepPurple),
          title: Text(mydata[index]),
        );
      },
    );

    // return ListView(
    //   children: [
    //     ListTile(
    //       onTap: () {},
    //       leading: Icon(Icons.apple),
    //       title: Text(mydata[0]),
    //       subtitle: Text("This is an apple"),
    //     ),
    //     ListTile(
    //       onTap: () {},
    //       leading: Icon(Icons.heart_broken, color: Colors.red),
    //       title: Text(mydata[1]),
    //     ),
    //     ListTile(
    //       onTap: () {},
    //       leading: FlutterLogo(),
    //       title: Text(mydata[2]),
    //       trailing: Icon(Icons.star),
    //     ),
    //   ],
    // );
  }
}
