import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'chat.dart';

class SoftwareCompaniesPage extends StatelessWidget {
  const SoftwareCompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final companies = <Map<String, dynamic>>[
      {
        'name': 'Cognizant',
        'logo': 'assets/images/cognizant.jpg',
        'rating': 4.5,
        'description':
        'A global IT services company offering digital, technology, consulting, and operations services.',
        'details': 'https://www.cognizant.com/',
        'alumni': ['John Doe', 'Jane Smith', 'Sam Wilson'],
        'pdfs': [
          {'name': 'Interview Tips', 'url': 'assets/pdfs/cognizant_tips.pdf'},
          {'name': 'Hiring Process', 'url': 'assets/pdfs/cognizant_hiring.pdf'},
        ],
      },
      {
        'name': 'Accenture',
        'logo': 'assets/images/accenture.jpg',
        'rating': 4.2,
        'description':
        'A global professional services firm with expertise in digital, cloud, and security services.',
        'details': 'https://www.accenture.com/',
        'alumni': ['Emily Davis', 'Michael Brown'],
        'pdfs': [
          {'name': 'Accenture Interview Guide', 'url': 'assets/pdfs/accenture_guide.pdf'},
        ],
      },
      {
        'name': 'TCS',
        'logo': 'assets/images/tcs.jpg',
        'rating': 4.8,
        'description':
        'A leading global IT services, consulting, and business solutions organization.',
        'details': 'https://www.tcs.com/',
        'alumni': ['Alice Johnson', 'Bob Martin'],
        'pdfs': [
          {'name': 'TCS Interview Preparation', 'url': 'assets/pdfs/tcs_prep.pdf'},
        ],
      },
      {
        'name': 'KeyValue',
        'logo': 'assets/images/keyvalue.jpg',
        'rating': 4.8,
        'description':
        'A technology company specializing in custom software development and IT solutions.',
        'details': 'https://www.keyvalue.systems/',
        'alumni': ['Jithin K A', 'Richa Teresa'],
        'pdfs': [
          {'name': 'KeyValue Interview Process', 'url': 'assets/pdfs/keyvalue_process.pdf'},
        ],
      },
      // Add more companies here
    ];

    return Scaffold(

      appBar: AppBar(
        title: const Text('Software Companies'),
        foregroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: companies.length,
          itemBuilder: (context, index) {
            final company = companies[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompanyDetailsPage(company: company),
                    ),
                  );
                },
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      company['logo'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(company['name']!, style: const TextStyle(fontSize: 18)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text('${company['rating']}'),
                        ],
                      ),
                      Text(company['description']!, style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CompanyDetailsPage extends StatelessWidget {
  final Map<String, dynamic> company;

  const CompanyDetailsPage({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company['name']!),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset(
              company['logo'],
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 16),
            Text(company['description']!, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 4),
                Text('${company['rating']}'),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                final url = company['details'];
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Could not launch URL'),
                    ),
                  );
                }
              },
              child: const Text('Visit Website'),
            ),
            const SizedBox(height: 16),
            Text('Alumni:', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              children: company['alumni']!.map<Widget>((alumni) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(alumni, style: const TextStyle(fontSize: 16)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(alumniName: '$alumni',),
                              maintainState: true, // Add this parameter
                            ),
                          );
                          // Implement chat functionality here
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Starting chat with $alumni'),
                            ),
                          );
                        },
                        child: const Text('Chat'),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Text('Interview PDFs:', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: company['pdfs']!.map<Widget>((pdf) {
                return GestureDetector(
                  onTap: () async {
                    final pdfUrl = pdf['url'];
                    if (await canLaunch(pdfUrl)) {
                      await launch(pdfUrl);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Could not open PDF'),
                        ),
                      );
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.picture_as_pdf, color: Colors.red),
                      const SizedBox(width: 8),
                      Text(pdf['name'], style: const TextStyle(fontSize: 16, color: Colors.blue)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
