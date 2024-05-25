import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Uncommented the const constructor

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'Vinay\'s App', // Corrected the title to use escape character for the apostrophe
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(), // Provided an instance of MyHomePage
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key}); // Added constructor with key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use Scaffold to provide structure
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      // body: Center(
      //   // Center the text
      //   child: Text('hello'),
      body: TextInputWidget(),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  String text = "";

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void changeText(text) {
    if(text  == "Hello World"){
      controller.clear();
      text = "";
    }
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        controller: this.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.message), labelText: "Type a message:"),
        onChanged: (text) => this.changeText(text),
      ),
      Text(this.text)
    ]);
  }
}
