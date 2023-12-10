    import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

    final CollectionReference pengeluaran =
      FirebaseFirestore.instance.collection('Pengeluaran');
  Stream<QuerySnapshot> getPengeluaran() {
    final pengeluaranStream = pengeluaran.snapshots();
    return pengeluaranStream;
  }

  Future<void> addPengeluaran(String uid, String date, String jumlah, String keterangan)async {
    pengeluaran.add({'uid': uid, 'date': date, 'jumlah':jumlah, 'keterangan':keterangan});
  }
}