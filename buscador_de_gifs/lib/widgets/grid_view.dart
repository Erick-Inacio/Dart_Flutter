import 'package:flutter/material.dart';

import '../repositories/get_data.dart';

class MyGridView extends StatefulWidget {
  const MyGridView({super.key, required this.snapshot, this.search});

  final String? search;
  final AsyncSnapshot snapshot;
  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: getCount(),
      itemBuilder: (conText, index) {
        if (widget.search == null ||
            index < widget.snapshot.data['data'].length) {
          return GestureDetector(
            child: Image.network(
              widget.snapshot.data['data'][index]['images']['fixed_height']
                  ['url'],
              height: 300,
            ),
            onTap: () {
              setState(() {
                int aux = getOffSet();
                aux += 19;
                setOffSet(aux); 
              });
            },
          );
        } else {
          return const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
                size: 70,
              ),
              Text(
                "Carregar mais...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              )
            ],
          );
        }
      },
    );
  }

  int getCount() {
    if (widget.snapshot.data?['data'] != null) {
      return widget.snapshot.data['data'].length +
          (widget.search == null ? 0 : 1);
    } else {
      return 0;
    }
  }
}
