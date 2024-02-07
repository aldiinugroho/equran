import 'package:equran/constants/assets.dart';
import 'package:equran/constants/customcolor.dart';
import 'package:equran/constants/customfontsize.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomHeader extends StatefulWidget {
  const CustomHeader({super.key});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    double screenwdth = MediaQuery.of(context).size.width;
    double safePadding = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(
          top: safePadding + 15, left: 15, right: 15, bottom: 15),
      color: CustomColor.baseGreen,
      width: screenwdth,
      child: InkWell(
        onTap: () {
          context.pop();
        },
        child: Row(
          children: [
            Image.asset(
              ImagesLocal.leftarrow,
              width: 20,
              height: 20,
            ),
            Container(width: 10),
            const Text(
              'Kembali',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: CustomFontSize.large2,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
