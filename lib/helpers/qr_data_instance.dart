// ignore_for_file: avoid_init_to_null

import 'package:covid_19_tracer/models/qr_code.dart';

import '../objectbox.g.dart';

class QrData {
  List<QrCode> qrCodeList = [];

  var box = null;

  Future<List<QrCode>> initData() async {
    qrCodeList = [];
    if (box == null) {
      final store = await openStore();
      box = store.box<QrCode>();
    }

    qrCodeList.addAll(box.getAll());

    return qrCodeList;

    // setDataList(qrCodeList);
  }
}