import 'package:equran/constants/customcolor.dart';
import 'package:equran/screen/main/components/mainheader/main.dart';
import 'package:equran/screen/main/components/mainlistview/main.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CustomColor.baseGrayScreen,
      body: ComponentMain(),
    );
  }
}

class ComponentMain extends StatefulWidget {
  const ComponentMain({super.key});

  @override
  State<ComponentMain> createState() => _ComponentMainState();
}

class _ComponentMainState extends State<ComponentMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.baseGreen,
      child: const Column(
        children: [MainHeader(), MainListView()],
      ),
    );
  }
}
