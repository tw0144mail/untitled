import 'dart:math';
import 'package:flutter/material.dart';
import 'package:untitled/default_ui/next_page_preset_class.dart';
import 'package:untitled/resource/strings.dart';

// MyApp
class DynamicGeneration extends StatelessWidget {
  const DynamicGeneration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: _dynamic_generation(),
    // );

    return NextPagePresetClass(
      title: strings.DynamicGenerationPage,
      body: _dynamic_generation(),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(strings.DynamicGenerationPage),
    //     centerTitle: true,
    //   ),
    //   body: _dynamic_generation(),
    // );
  }
}

// DynamicGenerationPage

// HomePage
class _dynamic_generation extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// Randomly colored Container
Container createNewContainer() {
  return Container(
    height: 100,
    width: 100,
    color: Color.fromARGB(
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    ),
  );
}

// _HomePageState
class _HomePageState extends State<_dynamic_generation> {
  // Init
  List<Container> containerList = [
    createNewContainer(),
    createNewContainer(),
  ];

  // Add
  void addContainer() {
    containerList.add(createNewContainer());
  }

  // Pop
  void popContainer() {
    containerList.removeLast();
  }

  // _childrenList
  List<Widget> _childrenList() {
    return containerList;
  }

  @override
  Widget build(BuildContext context) {
    return NextPagePresetClass(
        title: "無標題",
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _childrenList(),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                setState(() {
                  addContainer();
                });
              },
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.grey,
              onPressed: () {
                setState(() {
                  popContainer();
                });
              },
              child: Icon(Icons.remove),
            )
          ],
        ));
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _childrenList(),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                setState(() {
                  addContainer();
                });
              },
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.grey,
              onPressed: () {
                setState(() {
                  popContainer();
                });
              },
              child: Icon(Icons.remove),
            )
          ],
        ));
  }
}
