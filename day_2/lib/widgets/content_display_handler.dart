import 'package:flutter/material.dart';

class ContentDisplayHandler extends StatelessWidget {
  final bool isLoading;
  final bool isEmpty;
  final Widget child;

  const ContentDisplayHandler({
    super.key,
    required this.isLoading,
    required this.isEmpty,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading)
    {
      return const CircularProgressIndicator();
    }
    else if (isEmpty)
    {
      return const Text("No Data Found");
    }
    else
    {
      return child;
    }
  }
}
