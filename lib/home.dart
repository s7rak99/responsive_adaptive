import 'package:flutter/material.dart';
import 'package:responsive_adaptive/adaptive.dart';
import 'package:responsive_adaptive/second.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    AppBar appBar = AppBar(
      title: const Text('app bar'),
    );
    return Scaffold(
      appBar: appBar,
      body: LayoutBuilder(
        builder: (context, constraints) {
          print(MediaQuery.of(context).size.height);
          print(MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top);
          return Column(
            children: [
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.5,

                //  height: constraints.maxHeight * 0.90,
                color: Colors.black,
                width: (MediaQuery.of(context).size.width) * 0.5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              //if(isLandscape)
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: const Text('landscape'),
              ),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                              top: 8.0,
                              bottom: MediaQuery.of(context).viewInsets.bottom +
                                  10.0,
                            ),
                            child: Column(
                              children: const [
                                ListTile(
                                  title: Text('Iphon'),
                                  leading: Icon(Icons.phone_android),
                                ),
                                ListTile(
                                  title: Text('Iphon'),
                                  leading: Icon(Icons.phone_android),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: const Text('show bottom sheet '),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const AdaptiveFile()));
                },
                child: const Text('adaptive'),
              ),
            ],
          );
        },
      ),
    );
  }
}
