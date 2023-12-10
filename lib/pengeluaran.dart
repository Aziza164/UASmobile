import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/home.dart';

class pengeluaran extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 45, 136, 157),
        title: Text('Tambah Data'),
      ),
      body: Container(
      color: Color.fromARGB(255, 43, 128, 125), // Ganti dengan warna yang diinginkan
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _simpanData(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF4DA776),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fixedSize: Size(150, 63),
                        ),
                        child: Text(
                          'Pengeluaran',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(width: 23),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _dateController,
                          decoration: InputDecoration(
                            labelText: 'Date',
                            prefixIcon: Icon(Icons.calendar_month),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _jumlahController,
                          decoration: InputDecoration(
                            labelText: 'Jumlah',
                            prefixIcon: Icon(Icons.attach_money),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _keteranganController,
                          decoration: InputDecoration(
                            labelText: 'Keterangan',
                            prefixIcon: Icon(Icons.comment),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

   void _simpanData(BuildContext context) async {
    // Ambil nilai dari TextField sesuai dengan kebutuhan
    String date = _dateController.text;
    String jumlah = _jumlahController.text;
    String keterangan = _keteranganController.text;

    // Dapatkan UID pengguna yang saat ini login
    User? user = _auth.currentUser;
    String uid = user?.uid ?? '';

    // Buat objek data atau gunakan model data yang sesuai
    Map<String, dynamic> data = {
      'date': date,
      'jumlah': jumlah,
      'keterangan': keterangan,
      'uid': uid,
    };

    // Tambahkan data ke koleksi "pemasukan" di Firestore
    try {
      await FirebaseFirestore.instance.collection('pengeluaran').add(data);
      Navigator.pop(context, data);
    } catch (e) {
      print('Error adding data to Firestore: $e');
      // Handle error as needed
    }
  }
}
