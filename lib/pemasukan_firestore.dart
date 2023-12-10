import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference pemasukan =
      FirebaseFirestore.instance.collection('pemasukan');
  Stream<QuerySnapshot> getPemasukan() {
    final pemasukanStream = pemasukan.snapshots();
    return pemasukanStream;
  }

    final CollectionReference pengeluaran =
      FirebaseFirestore.instance.collection('pengeluaran');
  Stream<QuerySnapshot> getpengeluaran() {
    final pengeluaranStream = pengeluaran.snapshots();
    return pengeluaranStream;
  }


  Future<void> addPemasukan(String uid, String date, String jumlah, String keterangan)async {
    pemasukan.add({'uid': uid, 'date': date, 'jumlah':jumlah, 'keterangan':keterangan});
  }

  Future<void> addPengeluaran(String uid, String date, String jumlah, String keterangan)async {
    pengeluaran.add({'uid': uid, 'date': date, 'jumlah':jumlah, 'keterangan':keterangan});
  }


}