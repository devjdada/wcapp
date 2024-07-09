import 'package:flutter/material.dart';
import 'package:winners/shared/AppDrawer.dart';
import 'package:winners/shared/openDrawer.dart';
import 'package:winners/shared/themes.dart';

class UnderDev extends StatelessWidget {
  const UnderDev({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Under Development",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: const OpenDrawer(),
      ),
      drawer: const Drawer(
        child: AppDrawer(),
      ),
      body: const Center(
        child: Text(
          "Under Development",
          style: heading1,
        ),
      ),
    );
  }
}
