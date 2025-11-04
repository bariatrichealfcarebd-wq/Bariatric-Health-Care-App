// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class BackButtonBlocker extends StatefulWidget {
  const BackButtonBlocker({
    super.key,
    this.width,
    this.height,
    this.child,
  });

  final double? width;
  final double? height;
  final Widget Function()? child;

  @override
  State<BackButtonBlocker> createState() => _BackButtonBlockerState();
}

class _BackButtonBlockerState extends State<BackButtonBlocker> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
