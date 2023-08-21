import 'package:flutter/material.dart';

customLoadingIndicator() {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(10),
      child: CircularProgressIndicator(),
    ),
  );
}
