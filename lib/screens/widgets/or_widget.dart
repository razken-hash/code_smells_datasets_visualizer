import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Or",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
