import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InternshipWorkshopWindow extends StatefulWidget {
  const InternshipWorkshopWindow({super.key});

  @override
  State<InternshipWorkshopWindow> createState() => _InternshipWorkshopWindowState();
}

class _InternshipWorkshopWindowState extends State<InternshipWorkshopWindow> {
  static const List<Map<String, dynamic>> internships = [
    {
      'title': 'Software Engineering Internship',
      'description': 'Gain practical experience in software development',
      'location': 'Remote',
      'paid': true,
      'duration': '3 months',
      'mode': 'Online',
      'deadline': 'October 15',
    },
    {
      'title': 'Marketing Internship',
      'description': 'Learn about marketing strategies and campaigns',
      'location': 'On-site',
      'paid': true,
      'duration': '6 months',
      'mode': 'Offline',
      'deadline': 'November 30',
    },
    {
      'title': 'Data Science Workshop',
      'description': 'Explore the world of data analysis and machine learning',
      'location': 'Online',
      'paid': false,
      'duration': '2 weeks',
      'mode': 'Online',
      'deadline': 'September 10',
    },
    {
      'title': 'UI/UX Design Workshop',
      'description': 'Learn how to create user-friendly and visually appealing interfaces',
      'location': 'Online',
      'paid': false,
      'duration': '1 month',
      'mode': 'Online',
      'deadline': 'October 25',
    },
    {
      'title': 'Financial Analysis Workshop',
      'description': 'Understand financial concepts and tools',
      'location': 'On-site',
      'paid': true,
      'duration': '5 days',
      'mode': 'Offline',
      'deadline': 'November 15',
    },
    {
      'title': 'Writing Workshop',
      'description': 'Improve your writing skills and techniques',
      'location': 'Online',
      'paid': false,
      'duration': '3 weeks',
      'mode': 'Online',
      'deadline': 'September 20',
    },
  ];

  String selectedType = 'All';
  String selectedDuration = 'All';

  List<Map<String, dynamic>> filteredInternships = [];

  @override
  void initState() {
    super.initState();
    filteredInternships = internships;
  }

  void filterInternships() {
    filteredInternships = internships.where((internship) {
      if (selectedType != 'All' && internship['title'].toLowerCase().contains(selectedType.toLowerCase())) {
        return true;
      }
      if (selectedDuration != 'All' && internship['duration'].toLowerCase().contains(selectedDuration.toLowerCase())) {
        return true;
      }
      return selectedType == 'All' && selectedDuration == 'All';
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow),
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Internships and Workshops',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back), // Back arrow icon
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous page
            },
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                          filterInternships();
                        });
                      },
                      items: ['All', 'Internship', 'Workshop'].map((type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        labelText: 'Type',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedDuration,
                      onChanged: (value) {
                        setState(() {
                          selectedDuration = value!;
                          filterInternships();
                        });
                      },
                      items: ['All', '1 week', '2 weeks', '1 month', '3 months', '6 months'].map((duration) {
                        return DropdownMenuItem<String>(
                          value: duration,
                          child: Text(duration),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        labelText: 'Duration',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.green, Colors.yellow],
                  ),
                ),
                child: ListView.builder(
                  itemCount: filteredInternships.length,
                  itemBuilder: (context, index) {
                    final internship = filteredInternships[index];
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              internship['title'],
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              internship['description'],
                              style: GoogleFonts.roboto(fontSize: 16),
                            ),
                            const SizedBox(height: 10), // Added spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Location: ${internship['location']}',
                                  style: GoogleFonts.roboto(fontSize: 14),
                                ),
                                Text(
                                  'Duration: ${internship['duration']}',
                                  style: GoogleFonts.roboto(fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mode: ${internship['mode']}',
                                  style: GoogleFonts.roboto(fontSize: 14),
                                ),
                                Text(
                                  internship['paid'] ? 'Paid' : 'Free of cost',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: internship['paid'] ? Colors.red : Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Apply by: ${internship['deadline']}',
                              style: GoogleFonts.roboto(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
