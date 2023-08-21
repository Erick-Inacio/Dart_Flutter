import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Gerenciador de chamada'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    
                  ),
                ),
                border: OutlineInputBorder(
                  
                  borderSide: BorderSide(color: Colors.pink),
                ),
                fillColor: Colors.white,
                label: Text('Nome'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
