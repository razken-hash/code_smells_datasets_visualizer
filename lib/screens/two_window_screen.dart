import 'package:code_smells_datasets_visualizer/screens/themes/colors.dart';
import 'package:flutter/material.dart';

class TwoWindowScreen extends StatefulWidget {
  const TwoWindowScreen({super.key});

  @override
  State<TwoWindowScreen> createState() => _TwoWindowScreenState();
}

class _TwoWindowScreenState extends State<TwoWindowScreen> {
  double right = 0.7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.blue,
          ),
          Expanded(
            child: Row(
              children: [
                MouseRegion(
                  onHover: (event) {
                    // setState(() {
                    //   right = 0.7;
                    // });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: MediaQuery.of(context).size.width * right,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                ),
                MouseRegion(
                  onHover: (event) {
                    // setState(() {
                    //   right = 0.3;
                    // });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: MediaQuery.of(context).size.width * (1 - right),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
