import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'AAPL',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            children: const [
              Text(
                '\$145.32',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.greenAccent,
                ),
              ),
              SizedBox(width: 12),
              Text(
                '+1.28% today',
                style: TextStyle(color: Colors.greenAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}