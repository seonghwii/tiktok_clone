import 'package:flutter/material.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _click = 0;

  void _increase() {
    setState(() {
      _click += 1;
    });
  }

  @override
  void dispose() {
    print(_click);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$_click", style: const TextStyle(fontSize: 48)),
          TextButton(
            onPressed: _increase,
            child: const Text(
              '+',
              style: TextStyle(fontSize: 48),
            ),
          )
        ],
      ),
    );
  }
}
