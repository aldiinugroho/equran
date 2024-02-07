import 'package:equran/constants/assets.dart';
import 'package:equran/constants/customcolor.dart';
import 'package:equran/constants/customfontsize.dart';
import 'package:equran/screen/detail/components/detaillistview/store/storedetaillist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailListView extends StatefulWidget {
  final String suratId;
  const DetailListView({super.key, required this.suratId});

  @override
  State<DetailListView> createState() => _DetailListViewState();
}

class _DetailListViewState extends State<DetailListView> {
  TextStyle style1 = const TextStyle(
      color: Colors.white,
      fontSize: CustomFontSize.large,
      fontWeight: FontWeight.w700);
  TextStyle style1arab = const TextStyle(
      color: Colors.white,
      fontSize: CustomFontSize.large,
      fontWeight: FontWeight.w700);
  TextStyle style2 = const TextStyle(
      color: Colors.white,
      fontSize: CustomFontSize.medium3,
      fontWeight: FontWeight.w500);
  TextStyle style3 =
      const TextStyle(color: Colors.white, fontSize: CustomFontSize.medium3);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    StoreDetailList store = context.watch<StoreDetailList>();
    if (store.loading) {
      return Container(
        width: screenwidth,
        height: screenwidth / 3,
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: CustomColor.baseGrayLoading,
        ),
      );
    } else if (store.data == null) {
      return Container();
    } else {
      return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          itemBuilder: (context, index) {
            double lvwidth = MediaQuery.of(context).size.width;
            return Container(
              width: lvwidth,
              decoration: const BoxDecoration(
                color: CustomColor.baseGreen,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${widget.suratId}:${store.data!.ayat[index].nomorAyat}',
                          style: style1),
                      Container(width: 10),
                      Flexible(
                          child: Text(store.data!.ayat[index].teksArab,
                              style: style1arab, textAlign: TextAlign.right))
                    ],
                  ),
                  Container(height: 30),
                  Text(store.data!.ayat[index].teksLatin, style: style2),
                  Container(height: 2),
                  Text(store.data!.ayat[index].teksIndonesia, style: style3),
                  Container(height: 30),
                  Row(
                    children: [
                      InkWell(
                        child: Image.asset(ImagesLocal.play,
                            width: 15, height: 15),
                      ),
                      Container(width: 15),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                                color: Colors.white,
                                width: 1,
                                style: BorderStyle.solid)),
                        child: InkWell(
                          child: Row(
                            children: [
                              Image.asset(ImagesLocal.quote,
                                  width: 15, height: 15),
                              Container(width: 5),
                              const Text('Tafsir',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: CustomFontSize.medium3))
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(height: 10);
          },
          itemCount: store.data!.ayat.length);
    }
  }
}
