import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Catatan Keuangan'),
         backgroundColor: Color.fromARGB(255, 45, 136, 157),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 45, 136, 157),
              ),
              child: Text('Menu Navigator'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.message),
            //   title: const Text('Jenis Transaksi'),
            //   // onTap: () {
            //   //   Navigator.push(
            //   //     context,
            //   //     MaterialPageRoute(
            //   //       builder: (context) => (){},
            //   //     ),
            //   //   );
            //   // },
            // ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              trailing: Icon(Icons.cancel),
              title: Text('Close'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('nurul'),
                    // TextField(
                    //   controller: dateinput,
                    //   decoration: InputDecoration(
                    //     icon: Icon(Icons.calendar_today),
                    //     labelText: "Enter Date",
                    //   ),
                    //   readOnly: true,
                    //   onTap: () async {
                    //     DateTime? pickedDate = await showDatePicker(
                    //       context: context,
                    //       initialDate: _selectedDate,
                    //       firstDate: DateTime(2000),
                    //       lastDate: DateTime(2100),
                    //     );
                    //     if (pickedDate != null) {
                    //       setState(() {
                    //         _selectedDate = pickedDate;
                    //         dateinput.text =
                    //             DateFormat('yyyy-MM-dd').format(_selectedDate);
                    //       });
                    //     } else {
                    //       print("Date is not selected");
                    //     }
                    //   },
                    // ),
                    // TextField(
                    //   controller: _jenisController,
                    //   decoration: InputDecoration(labelText: 'Jenis Transaksi'),
                    // ),
                    // TextField(
                    //   controller: _JumlahController,
                    //   keyboardType: TextInputType.number,
                    //   decoration: InputDecoration(labelText: 'Jumlah'),
                    // ),
                    // TextField(
                    //   controller: _KeteranganController,
                    //   decoration: InputDecoration(labelText: 'Keterangan'),
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     _addTransaction();
                    //   },
                    //   child: Text('Simpan'),
                    // ),
                  ],
                ),
              ),
            ),
            //TransactionList(_userTransactions),
          ],
        ),
      ),
    );
  }
}