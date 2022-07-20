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
  Repository repository = Repository();
  late Future<Sohkanmodel> sokhan;
  int times = 0;

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
            height: 400,
            width: 300,
            child: times == 0
                ? Center(child: Text('Tap the button'))
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: FutureBuilder<Sohkanmodel>(
                      future: repository.getNewSokhan(),
                      builder: ((context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(child: CircularProgressIndicator());
                          case ConnectionState.done:
                          default:
                            if (snapshot.hasData) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.data!.content!,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('( ${snapshot.data!.author!} )')
                                ],
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                        }
                      }),
                    ),
                  ),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            // constraints: BoxConstraints(
            //   maxHeight: 400,
            //   maxWidth: 300,
            //   minHeight: 200,
            //   minWidth: 300,
            // ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  times++;
                  sokhan = repository.getNewSokhan();
                });
              },
              child: Text('Give me a Qout')),
        ],
      )),
    );
  }
}
