import 'package:campus_roots/freelancing.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'companies.dart';
import 'intern.dart';
import 'fund.dart';
import 'disc.dart';
import 'directory.dart';

void main() {
  runApp(CampusRootsApp());
}

class CampusRootsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Roots',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, // Light Blue for primary color
          primary: Color(0xFFB3E5FC), // Soft Blue
          secondary: Color(0xFFBDFCC9), // Mint Green
        ),
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.montserrat(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333), // Dark Gray
          ),
          labelLarge: GoogleFonts.montserrat(
            fontSize: 18.0,
            color: Color(0xFF333333), // Dark Gray
          ),
          bodyLarge: GoogleFonts.montserrat(
            fontSize: 16.0,
            color: Color(0xFF606060), // Charcoal Gray
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(200.0, 50.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 5.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Campus Roots',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFFB3E5FC), // Soft Blue
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFB3E5FC), // Soft Blue
              Colors.white,
            ],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildHeader(context),
            SizedBox(height: 20),
            _buildOptionTile(
              context,
              icon: Icons.person,
              title: 'Alumni directory',
              color: Color(0xFFB3E5FC), // Mint Green
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CampusApp(),
                    maintainState: true,
                  ),
                );
              },
            ),
            _buildOptionTile(
              context,
              icon: Icons.business,
              title: 'Companies',
              color: Color(0xFFBDFCC9), // Mint Green
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SoftwareCompaniesPage(),
                    maintainState: true,
                  ),
                );
              },
            ),
            _buildOptionTile(
              context,
              icon: Icons.work_outline,
              title: 'Freelancing',
              color: Color(0xFFB3E5FC), // Soft Blue
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FreelancingRequestsPage(),
                    maintainState: true,
                  ),
                );
              },
            ),
            _buildOptionTile(
              context,
              icon: Icons.assignment_ind,
              title: 'Internships/Workshops',
              color: Color(0xFFBDFCC9), // Mint Green
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InternshipWorkshopWindow(),
                    maintainState: true,
                  ),
                );
              },
            ),
            _buildOptionTile(
              context,
              icon: Icons.attach_money,
              title: 'Project Funding/Scholarships',
              color: Color(0xFFB3E5FC), // Soft Blue
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FundingAndScholarshipsScreen(),
                    maintainState: true,
                  ),
                );
              },
            ),
            _buildOptionTile(
              context,
              icon: Icons.format_align_justify_sharp,
              title: 'Forms',
              color: Color(0xFFBDFCC9), // Mint Green
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DiscussionApp(),
                    maintainState: true,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Hero(
          tag: 'appIcon',
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Image.asset('assets/images/campusroots.png',height: 200,width: 200,)
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Welcome to Campus Roots',
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        Text(
          'Connecting Students with Alumni for a Brighter Future',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildOptionTile(BuildContext context,
      {required IconData icon,
        required String title,
        required Color color,
        required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 30, color: Colors.white),
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Curved borders
          ),
          elevation: 5.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}
