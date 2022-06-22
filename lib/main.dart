import 'package:flutter/material.dart';
import 'package:sokhan_bozorgan/Data/repository.dart';
import 'package:sokhan_bozorgan/model/sohkanmodel/sohkanmodel.dart';

void main() {
  runApp(MaterialApp(
    home: const HomePage(),
    title: 'Flutter Demo',
    theme: ThemeData(primarySwatch: Colors.blue),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    Repository repository=Repository();
  late Future<Sohkanmodel> sokhan;
  @override
  void initState() {
    sokhan = repository.getNewSokhan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Column(
              children: [
                FutureBuilder<Sohkanmodel>(
                  future: sokhan,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                       snapshot.data!.content!,
                        style: TextStyle(color: Colors.black),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            constraints: BoxConstraints(
                maxHeight: 400, minWidth: 300, maxWidth: 300, minHeight: 200),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                sokhan=  repository.getNewSokhan();
                });
              },
              child: Text('Give me a Qout')),
        ],
      )),
    );
  }
}
