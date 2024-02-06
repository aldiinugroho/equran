import 'package:equran/request/surat/main.dart';
import 'package:equran/screen/main/components/mainlistview/models/modelmainlv.dart';
import 'package:equran/screen/main/store/storemainlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UseCaseSurat {
  static Future<void> getSuratList({required BuildContext context}) async {
    StoreMainList store = context.read<StoreMainList>();
    try {
      store.setLoading();
      var result = await RequestSurat.get();
      if (result.status != "OK") throw result;
      final List<dynamic> raw = result.data['data'];
      final List<ModelMainLV> mapped = raw
          .map((e) => ModelMainLV(
              nama: e['nama'] ?? '',
              namaLatin: e['namaLatin'] ?? '',
              artinama: e['arti'] ?? '',
              jumlahAyat: e['jumlahAyat'] ?? 0,
              tempatturun: e['tempatTurun'] ?? ''))
          .toList();
      store.setData(data: mapped);
    } catch (e) {
      store.setError(err: e.toString());
    }
  }

  static Future<void> getSuratDetail(
      {required BuildContext context, required String suratId}) async {
    try {
      var result = await RequestSurat.get(path: '/$suratId');
    } catch (e) {}
  }
}
