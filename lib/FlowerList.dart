import 'package:flutter/material.dart';
import 'package:sample_design/FlowerDetails.dart';
import 'package:sample_design/Model/Model.dart';
import 'package:sample_design/data/FlowerData.dart';

class FlowerList extends StatefulWidget {
  const FlowerList({Key? key}) : super(key: key);

  @override
  State<FlowerList> createState() => _FlowerListState();
}

class _FlowerListState extends State<FlowerList> {
  List<Model> list = FlowerData().getList();

  Widget getViewForList(var i) {
    return Card(
      elevation: 50,
      shadowColor: Colors.red,
      color: Colors.green[200],
      margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 80,
              child: CircleAvatar(
                backgroundImage: NetworkImage(list[i].image),
                radius: 70,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              list[i].title,
              style: TextStyle(
                fontSize: 30,
                color: Colors.green[900],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              list[i].message,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.green,
              ), //Textstyle
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }

  Widget getViewForGrid(var i) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.blue[200],
      elevation: 10,
      shadowColor: Colors.blue[900],
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(list[i].image),
                    radius: 40,
                  ),
                )),
            const SizedBox(
              width: 30,
            ),
            Text(
              list[i].title,
              style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Flowers"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: FlowerData().getList().length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  child: getViewForList(i),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FlowerDetails(context, list[i])));
                  },
                );
              },
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: FlowerData().getList().length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 3),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    child: getViewForGrid(i),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FlowerDetails(context, list[i])));
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
