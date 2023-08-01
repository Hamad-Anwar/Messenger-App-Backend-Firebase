import 'package:flutter/material.dart';
class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepOrange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: () {
      },
      child: const Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
