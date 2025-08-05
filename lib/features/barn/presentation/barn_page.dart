import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BarnPage extends StatefulWidget {
  const BarnPage({super.key});

  @override
  State<BarnPage> createState() => _BarnPageState();
}

class _BarnPageState extends State<BarnPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
