import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void pushReplacement(BuildContext context, String route) {
  context.pushReplacement(route);
}

void pushTo(BuildContext context, String route, {Object? extra}) {
  context.push(route, extra: extra);
}

void pop(BuildContext context) {
  context.pop();
}
