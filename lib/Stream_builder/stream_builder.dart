import 'dart:async';

import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<String> streamController = StreamController<String>();
  late Stream<String> dataStream;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    dataStream = streamController.stream.asBroadcastStream();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<String>(
                stream: dataStream,
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return Text(snapshot.data ??'Null data',
                  style: const TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold
                  ),);
                  }
                  else{
                    return const Text('No data',
                  style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold
                  ),);
                  }
                  
                }
              ),
              StreamBuilder<String>(
                stream: dataStream,
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return Text(snapshot.data ??'Null data',
                  style: const TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold
                  ),);
                  }
                  else{
                    return const Text('No data',
                  style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold
                  ),);
                  }
                  
                }
              ),
              const SizedBox(height: 20,),
               SizedBox(width: 200,
              child: TextField(
                controller: textEditingController,
              )),
              ElevatedButton(onPressed: (){
                streamController.add(textEditingController.text);
              }, child: const Text('iniciar'))
            ],
          ),
        ),  
      )
    );
  }
}