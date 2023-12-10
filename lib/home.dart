import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Login.dart';
import 'package:flutter_application_3/pemasukan_firestore.dart';
import 'package:flutter_application_3/pengeluaran.dart';
import 'package:flutter_application_3/tambah2.dart';
import 'package:flutter_application_3/profile.dart';
import 'package:flutter_application_3/logout.dart';



void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 45, 136, 157),
        scaffoldBackgroundColor: Color.fromARGB(255, 45, 136, 157),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  
  bool isMenuOpen = false;
  late AnimationController _animationController;

  // List<FinancialRecord> filteredList = [];

  TextEditingController _searchController = TextEditingController();

  FirestoreService firestoreService = FirestoreService();


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }  

  void _toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
      isMenuOpen ? _animationController.forward() : _animationController.reverse();
    });
  }

  void _navigateToTambahData() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pengeluaran(),
      ),
    );
  }

  void _navigateToPemasukan() {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TambahData(), // Replace with the actual PemasukanPage
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 136, 157),
        title: Text('Catatan Keuangan'),
        actions: [
        ],
      ),
body: Container(
  color: Color.fromARGB(255, 43, 128, 125), // Background color
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          color: Color.fromARGB(255, 43, 128, 125), // Background color for income
          child: StreamBuilder<QuerySnapshot>(
            stream: firestoreService.getPemasukan(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }

              List<DocumentSnapshot> pemasukanDocs = snapshot.data!.docs;

              return ListView.builder(
                itemCount: pemasukanDocs.length,
                itemBuilder: (context, index) {
                  var data = pemasukanDocs[index].data() as Map<String, dynamic>;

                  return Card(
                    elevation: 5.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text('Pemasukan - Date: ${data['date']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jumlah: ${data['jumlah']}'),
                          Text('Keterangan: ${data['keterangan']}'),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
          Expanded(
              child: Container(
                color: Color.fromARGB(205, 179, 221, 216),
                child: StreamBuilder<QuerySnapshot>(
                  stream: firestoreService.getpengeluaran(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }

                    List<DocumentSnapshot> pengeluaranDocs = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: pengeluaranDocs.length,
                      itemBuilder: (context, index) {
                        var data = pengeluaranDocs[index].data() as Map<String, dynamic>;

                        return Card(
                          elevation: 5.0,
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            title: Text('Pengeluaran - Date: ${data['date']}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Jumlah: ${data['jumlah']}'),
                                Text('Keterangan: ${data['keterangan']}'),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),    ],
  ),
),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 90.0,
            right: 16.0,
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: isMenuOpen ? 0.25 : 0.0).animate(_animationController),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                child: FloatingActionButton(
                  onPressed: _toggleMenu,
                  child: Icon(isMenuOpen ? Icons.close : Icons.add),
                ),
              ),
            ),
          ),
          isMenuOpen
            ? Positioned(
                bottom: 160.0,
                right: 20.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 45, 136, 157),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle Tambah Data
                          _navigateToPemasukan(); 
                          _toggleMenu();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent, // Set the background color to transparent
                          elevation: 0, // Remove elevation
                          shadowColor: Colors.transparent, // Remove shadow
                        ),
                        child: Text(
                          'Pemasukan',
                          style: TextStyle(color: Colors.black), // Set text color
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle Edit Data
                          _navigateToTambahData();
                          _toggleMenu();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent, // Set the background color to transparent
                          elevation: 0, // Remove elevation
                          shadowColor: Colors.transparent, // Remove shadow
                        ),
                        child: Text(
                          'Pengeluaran',
                          style: TextStyle(color: Colors.black), // Set text color
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 45, 136, 157),
              ),
              child: Text('Welcome To Catatan Keuangan'),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
              ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: const Text('profile'),
              onTap: () {
                Navigator.pop(context);
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(), // Replace with the actual Profile class
                        ),
                      );          
                    },
                  ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: const Text('Logout'),
              onTap: () async {
                await _authService.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(), // Replace with your login page
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  }
class _authService {
  static signOut() {}
}

class _DataSearch extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Theme.of(context).primaryColor,
      scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Suggestions for: $query'),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String itemName;

  DetailPage({required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Text('Detail for $itemName'),
      ),
    );
  }
}


