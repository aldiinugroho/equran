import 'package:equran/constants/customcolor.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String detailId;
  const DetailScreen({super.key, required this.detailId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.baseGrayScreen,
      body: ComponentBody(
        detailId: detailId,
      ),
    );
  }
}

class ComponentBody extends StatefulWidget {
  final String detailId;
  const ComponentBody({super.key, required this.detailId});

  @override
  State<ComponentBody> createState() => _ComponentBodyState();
}

class _ComponentBodyState extends State<ComponentBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.detailId),
    );
  }
}
