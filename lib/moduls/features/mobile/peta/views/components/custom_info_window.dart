import 'package:flutter/material.dart';

class CustomInfoWindow extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final double rating;
  final String openHours;

  const CustomInfoWindow({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.openHours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imageUrl.isNotEmpty)
            Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(description),
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow),
              Text(rating.toString()),
            ],
          ),
          Text('Open Hours: $openHours'),
        ],
      ),
    );
  }
}
