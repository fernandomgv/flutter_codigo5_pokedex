

import 'package:flutter/material.dart';

class ItemTypeWidget extends StatelessWidget {

  String type;
  ItemTypeWidget({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6.0, right: 10.0),
      padding:
      const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.27),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Text(
        type,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}