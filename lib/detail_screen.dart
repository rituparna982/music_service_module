import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String serviceName;

  const DetailScreen({required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceName),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'You tapped on: $serviceName',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
    );
  }
}