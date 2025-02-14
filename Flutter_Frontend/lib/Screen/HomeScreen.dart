// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../Listener.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue,
        title: const Text('Elevate priviledge to run a Linux command',style: TextStyle(color: Colors.white),),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: FutureBuilder(
            future: fetchRootDirectoryListing(),
            initialData: "wait",
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.lightBlue,
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'An ${snapshot.error} occurred',
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  );
                } else if (snapshot.hasData) {
                  final data = snapshot.data;

                  return Center(
                    child: Text(
                      data.toString(),
                      style: const TextStyle(
                          fontSize: 20),
                    ),
                  );
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    ));
  }
}
