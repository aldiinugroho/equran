import 'package:equran/constants/customcolor.dart';
import 'package:equran/usecases/surat/main.dart';
import 'package:flutter/material.dart';

class Refresher extends StatefulWidget {
  final String wording;
  const Refresher({super.key, required this.wording});

  @override
  State<Refresher> createState() => _RefresherState();
}

class _RefresherState extends State<Refresher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.wording),
          Container(height: 5),
          InkWell(
            onTap: () {
              UseCaseSurat.getSuratList(context: context);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: CustomColor.baseGreen,
              ),
              child: Text('Refresh.'),
            ),
          )
        ],
      ),
    );
  }
}
