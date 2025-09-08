import 'package:flutter/material.dart';

class BehaviorSummary extends StatelessWidget {

  final List<Map<String, dynamic>> behaviors = [
    {'name': 'Speeding', 'percentage': 100, 'color': Colors.green},
    {'name': 'Braking', 'percentage': 70, 'color': Colors.orange},
    {'name': 'Phone Use', 'percentage': 30, 'color': Colors.red},
    {'name': 'Swerving', 'percentage': 100, 'color': Colors.green},
    {'name': 'Cornering', 'percentage': 80, 'color': Colors.blue},
    {'name': 'Turning', 'percentage': 100, 'color': Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Behavior Summary',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16.0),
          ...behaviors.map((behavior) => BehaviorItem(
            name: behavior['name'],
            percentage: behavior['percentage'],
            color: behavior['color'],
          )),
        ],
      ),
    );
  }
}

class BehaviorItem extends StatelessWidget {
  final String name;
  final int percentage;
  final Color color;

  BehaviorItem({required this.name, required this.percentage, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          Row(
            children: [
              Text(
                '$percentage%',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: 8.0),
              Container(
                width: 120,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.grey[300],
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: percentage / 100,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}