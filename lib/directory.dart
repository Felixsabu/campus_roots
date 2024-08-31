import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

class CampusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Roots',
      theme: ThemeData(
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.roboto(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Light color scheme
          ),
          labelLarge: GoogleFonts.roboto(
            fontSize: 18.0,
            color: Colors.white,
          ),
          bodyLarge: GoogleFonts.roboto(
            fontSize: 16.0,
            color: Colors.grey[800], // Darker gray for readability
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent, // Button color
            minimumSize: Size(200.0, 50.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
      home: AlumniDirectoryPage(),
    );
  }
}

class AlumniDirectoryPage extends StatefulWidget {
  @override
  _AlumniDirectoryPageState createState() => _AlumniDirectoryPageState();
}

class _AlumniDirectoryPageState extends State<AlumniDirectoryPage> {
  String? selectedFilter;
  final List<String> filters = ['All', 'CS', 'EC', 'EEE','ME','CE'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alumni Directory'),
        backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CampusRootsApp(),
                maintainState: true,
              ),
            ); // Navigate back to the previous page
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildFilterDropdown(),
            SizedBox(height: 20),
            Expanded(child: _buildAlumniList()),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedFilter,
      onChanged: (String? newValue) {
        setState(() {
          selectedFilter = newValue;
        });
      },
      decoration: InputDecoration(
        labelText: 'Filter by Department',
        labelStyle: TextStyle(color: Colors.grey[800]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.deepPurpleAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
        ),
      ),
      items: filters.map((filter) {
        return DropdownMenuItem<String>(
          value: filter,
          child: Text(filter),
        );
      }).toList(),
    );
  }

  Widget _buildAlumniList() {
    // Sample data
    final List<Map<String, String>> alumni = [
      {'name': 'John Doe', 'department': 'CS'},
      {'name': 'Jane Smith', 'department': 'EC'},
      {'name': 'Michael Johnson', 'department': 'CS'},
      {'name': 'Emily Davis', 'department': 'ME'},
      {'name': 'Felix Sabu', 'department': 'CS'},
      {'name': 'Aswin Arun', 'department': 'EC'},
      {'name': 'Alfin K J', 'department': 'CS'},
      {'name': 'Jithin K A', 'department': 'EEE'},
      {'name': 'Rahul K S', 'department': 'ME'},
      {'name': 'Vysakh Sanal', 'department': 'EEE'},
      {'name': 'Nived Tharun', 'department': 'CE'},
      {'name': 'Imthiyaz', 'department': 'CE'},
    ];

    // Filter alumni based on the selected filter
    final filteredAlumni = selectedFilter == 'All' || selectedFilter == null
        ? alumni
        : alumni
            .where((alumnus) => alumnus['department'] == selectedFilter)
            .toList();

    return ListView.builder(
      itemCount: filteredAlumni.length,
      itemBuilder: (context, index) {
        final alumnus = filteredAlumni[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(color: Colors.deepPurpleAccent, width: 2),
          ),
          elevation: 4.0,
          child: ListTile(
            title: Text(
              alumnus['name']!,
              style: GoogleFonts.roboto(fontSize: 18.0),
            ),
            subtitle: Text(
              'Department: ${alumnus['department']}',
              style:
                  GoogleFonts.roboto(fontSize: 14.0, color: Colors.grey[600]),
            ),
            contentPadding: EdgeInsets.all(16.0),
          ),
        );
      },
    );
  }
}
