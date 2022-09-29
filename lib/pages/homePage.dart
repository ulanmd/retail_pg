import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300,
            height: 300,
            decoration:
            BoxDecoration(border: Border.all(color: Colors.yellowAccent)),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    height: 100,
                    width: 100,
                    child: Container(
                      color: Colors.amber,
                    )),
                Positioned(
                  top: 350,
                  height: 100,
                  width: 100,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Row(
              children: [
                const Text('Stack', textAlign: TextAlign.left,),
                ElevatedButton(
                    onPressed: (){
                      Navigator.popAndPushNamed(context, '/retail');
                    },
                    child: const Text('Retail Page')),
                ElevatedButton(
                    onPressed: (){
                      Navigator.popAndPushNamed(context, '/clipTest');
                    },
                    child: const Text('Clip Test Page'))
              ]
          )
        ],
      ),
    );
  }
}
