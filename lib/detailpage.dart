import 'package:flutter/material.dart';
import 'package:flutter_application_3/home.dart';

class DetailPage extends StatelessWidget {
  final String keterangan;
  final String jumlah;
  final String date;

  DetailPage({required this.jumlah, required this.keterangan, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Catatan Keuangan'),
      ),
      body: Padding( 
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Judul: $jumlah',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Jumlah: $keterangan'),
            SizedBox(height: 10),
            Text('Tanggal: $date'),
          ],
        ),
      ),
    );
  }
}
