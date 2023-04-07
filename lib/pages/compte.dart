import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Comptepage extends StatefulWidget {
  const Comptepage({super.key});

  @override
  State<Comptepage> createState() => _ComptepageState();
}

class _ComptepageState extends State<Comptepage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    
      appBar: AppBar(
        title: const Text('QuickLinker'),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(
            onPressed: () { },
            
            icon: const Icon(Icons.menu),
        ),
        actions: <Widget>[ // icon on the right side 
          IconButton(
            icon: const Icon(Icons.account_circle) ,
            onPressed: () {},
          )

        ],
      ),

      body: Center(
        




      )
     
    );
  }
}