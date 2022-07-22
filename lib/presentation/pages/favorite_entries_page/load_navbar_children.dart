import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../router/router.gr.dart';

List<Widget> loadChildren(BuildContext context) {
  final _children = [
    InkWell(
      onTap: () => context.router.push(const HomeRoute()),
      child: const Icon(Icons.home, color: Colors.white),
    ),
    InkWell(
      onTap: () => context.router.push(const CalculationsRoute()),
      child: const Icon(Icons.calculate_outlined, color: Colors.white),
    ),
    InkWell(
      onTap: () => context.router.push(
        const FavoriteEntriesRoute(),
      ),
      child: const Icon(Icons.favorite_border, color: Colors.white),
    ),
    InkWell(
      onTap: () => context.router.push(
        const ProfileRoute(),
      ),
      child: const Icon(Icons.account_circle, color: Colors.white),
    ),
  ];

  return _children;
}
