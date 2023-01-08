import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFile extends StatefulWidget {
  const AdaptiveFile({Key? key}) : super(key: key);

  @override
  State<AdaptiveFile> createState() => _AdaptiveFileState();
}

class _AdaptiveFileState extends State<AdaptiveFile> {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            if (Platform.isAndroid)
              SwitchListTile(
                  title: const Text('mobile'),
                  value: val,
                  onChanged: (val) {
                    setState(() {
                      this.val = val;
                    });
                  }),
            if (!Platform.isIOS)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Expanded(child: Text('Mobile')),
                    CupertinoSwitch(
                        //activeColor: Colors.blue,
                        value: val,
                        onChanged: (val) {
                          setState(() {
                            this.val = val;
                          });
                        }),
                  ],
                ),
              ),
            Switch.adaptive(
                value: val,
                onChanged: (v) {
                  setState(
                    () {
                      val =v;
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
