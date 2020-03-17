import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/login/login.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: LoginPage(),
    );
  }
}

List<String> items = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "D",
  "J",
  "K",
  "L",
  "M",
  "P"
];

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return new SelectableWidget(
            new SelectableWidgetViewModel(
              items[index],
              isSelected: false,
            ),
          );
        },
      )),
    );
  }
}

class SelectableWidget extends StatefulWidget {
  final SelectableWidgetViewModel viewModel;

  SelectableWidget(this.viewModel);

  @override
  State<StatefulWidget> createState() {
    return SelectableWidgetState();
  }
}

class SelectableWidgetState extends State<SelectableWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Container container;

    if (widget.viewModel.isSelected) {
      container = new Container(
        alignment: Alignment.center,
        height: 100.0,
        color: Colors.blue,
        child: new Text(
          widget.viewModel.title,
          style: new TextStyle(color: Colors.red, fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      container = new Container(
        alignment: Alignment.center,
        height: 100.0,
        color: Colors.red,
        child: new Text(
          widget.viewModel.title,
          style: new TextStyle(color: Colors.blue, fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          widget.viewModel.isSelected = !widget.viewModel.isSelected;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: container,
      ),
    );
  }
}

class SelectableWidgetViewModel {
  bool isSelected;
  String title;

  SelectableWidgetViewModel(this.title, {this.isSelected = false});
}
