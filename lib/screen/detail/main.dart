import 'package:equran/components/customheader/main.dart';
import 'package:equran/constants/customcolor.dart';
import 'package:equran/screen/detail/components/detaillistview/main.dart';
import 'package:equran/screen/detail/components/detaillistview/store/storedetaillist.dart';
import 'package:equran/screen/detail/components/detailsurat/detailsurat.dart';
import 'package:equran/usecases/surat/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UseCaseSurat.getSuratDetail(context: context, suratId: widget.detailId);
    });
  }

  @override
  Widget build(BuildContext context) {
    StoreDetailList store = context.watch<StoreDetailList>();
    return Column(
      children: [
        CustomHeader(),
        Expanded(
            child: RefreshIndicator(
                color: CustomColor.baseGreen,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: store.errMsg == null
                          ? Container()
                          : Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(store.errMsg ?? 'Error.'),
                            ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: DetailSurat(),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: DetailListView(
                        suratId: widget.detailId,
                      ),
                    )
                  ],
                ),
                onRefresh: () async {
                  UseCaseSurat.getSuratDetail(
                      context: context, suratId: widget.detailId);
                }))
      ],
    );
  }
}
