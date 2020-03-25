import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papuf/pages/home/home.dart';
import 'package:papuf/pages/home/home_page.dart';
import 'package:papuf/widgets/list_view_classes.dart';
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


class AppBarBottomSample extends StatefulWidget {
  @override
  _AppBarBottomSampleState createState() => _AppBarBottomSampleState();
}

class _AppBarBottomSampleState extends State<AppBarBottomSample> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: choices.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length) return;
    _tabController.animateTo(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('AppBar Bottom Widget', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),),
          
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              tooltip: 'Next choice',
              onPressed: () {
                _nextPage(1);
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: Container(
                height: 50.0,
                alignment: Alignment.center,
                child: ListClasses(),
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: choices.map((Choice choice) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ChoiceCard(choice: choice),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
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
