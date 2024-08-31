import 'package:flutter/material.dart';

class FreelancingRequestsPage extends StatelessWidget {
  const FreelancingRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final requests = [
      {
        'title': 'Web Development Project',
        'description': 'Need a skilled web developer to build a responsive e-commerce website.',
        'budget': '₹50,000',
        'deadline': 'October 15, 2024',
      },
      {
        'title': 'Mobile App Development',
        'description': 'Looking for a mobile app developer to create an iOS and Android app.',
        'budget': '₹75,000',
        'deadline': 'November 30, 2024',
      },
      {
        'title': 'Natural Language Processing (NLP) Chatbot Development',
        'description': 'Create a sophisticated chatbot capable of understanding and responding to user queries in a human-like manner.',
        'budget': '₹100,000',
        'deadline': 'December 31, 2024',
      },
      {
        'title': 'Computer Vision-Based Object Detection and Tracking',
        'description': 'Develop a system that can accurately detect and track objects in real-time using cameras or other sensors.',
        'budget': '₹80,000',
        'deadline': 'January 15, 2025',
      },
      {
        'title': 'Autonomous Robot Navigation',
        'description': 'Build a robot capable of navigating complex environments without human intervention.',
        'budget': '₹120,000',
        'deadline': 'February 28, 2025',
      },
      {
        'title': 'Smart Energy Grid Optimization',
        'description': 'Develop AI-powered solutions to optimize energy distribution and consumption in electrical grids.',
        'budget': '₹90,000',
        'deadline': 'March 31, 2025',
      },
      {
        'title': 'LLM-Based Content Generation',
        'description': 'Create a language model capable of generating high-quality text, such as articles, code, or creative writing.',
        'budget': '₹70,000',
        'deadline': 'April 30, 2025',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Freelancing Requests'),
        foregroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: requests.length,
          itemBuilder: (context, index) {
            final request = requests[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RequestDetailsPage(request: request),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(request['title']!, style: TextStyle(color: Colors.blue)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(request['description']!),
                          Text('Budget: ${request['budget']}'),
                          Text('Deadline: ${request['deadline']}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class RequestDetailsPage extends StatelessWidget {
  final Map<String, dynamic> request;

  const RequestDetailsPage({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Details'),
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(request['title'], style: const TextStyle(fontSize: 20, color: Colors.blue)),
                const SizedBox(height: 16),
                Text(request['description']),
                const SizedBox(height: 16),
                Text('Budget: ${request['budget']}'),
                const SizedBox(height: 16),
                Text('Deadline: ${request['deadline']}'),
              ],
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Apply'),
                      content: Text('Are you sure you want to apply for "${request['title']}"?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle the application action here
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Applied for "${request['title']}" successfully!'),
                              ),
                            );
                          },
                          child: const Text('Apply'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Apply'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green, padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
