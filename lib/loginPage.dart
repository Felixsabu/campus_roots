import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  String? userType;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light Gray Background
      appBar: AppBar(
        title: Text(
          'Login',
          style: GoogleFonts.montserrat(), // Modern Font
        ),
        backgroundColor: const Color(0xFFFAF3E0), // Soft Beige
        elevation: 0, // Remove shadow from AppBar
      ),
      body: Stack(
        children: [
          // Background with decorative elements
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1), // Soft Blue Accent
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
          Positioned(
            bottom: -120,
            right: -120,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1), // Mint Green Accent
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  constraints: BoxConstraints(
                    maxWidth: 350, // Maximum width of the panel
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white, // Panel Background
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 8.0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: ListView( // Replacing Column with ListView for scrollability
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: 30,),
                        Image.asset('assets/images/campusroots.png',height: 200,width: 200,),
                        const SizedBox(height: 20,),
                        DropdownButtonFormField<String>(
                          value: userType,
                          onChanged: (String? newValue) {
                            setState(() {
                              userType = newValue;
                            });
                          },
                          validator: (value) => value == null ? 'Please select your role' : null,
                          decoration: InputDecoration(
                            labelText: 'Select your role',
                            labelStyle: GoogleFonts.montserrat(color: Colors.grey[700]), // Dark Gray Text
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(color: Color(0xFFDDDDDD)), // Light Gray Border
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFBBBBBB), width: 1.5), // Light Gray Focused Border
                            ),
                            filled: true,
                            fillColor: Colors.white, // White Background
                          ),
                          dropdownColor: Colors.white, // White Dropdown Background
                          items: const [
                            DropdownMenuItem(
                              value: 'Student',
                              child: Text('Student'),
                            ),
                            DropdownMenuItem(
                              value: 'Alumni',
                              child: Text('Alumni'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _usernameController,  // Assuming you have a separate controller for the username
                          keyboardType: TextInputType.text,  // Set to text since it's a username
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: GoogleFonts.montserrat(color: Colors.grey[700]), // Dark Gray Text
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(color: Color(0xFFDDDDDD)), // Light Gray Border
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFBBBBBB), width: 1.5), // Light Gray Focused Border
                            ),
                            filled: true,
                            fillColor: Colors.white, // White Background
                          ),
                          // No validator
                        ),

                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: GoogleFonts.montserrat(color: Colors.grey[700]), // Dark Gray Text
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(color: Color(0xFFDDDDDD)), // Light Gray Border
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFBBBBBB), width: 1.5), // Light Gray Focused Border
                            ),
                            filled: true,
                            fillColor: Colors.white, // White Background
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Forgot password functionality
                            },
                            child: Text(
                              'Forgot Password?',
                              style: GoogleFonts.montserrat(
                                color: Colors.grey[600], // Mid Grey Text
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            backgroundColor: const Color(0xFFB3E5FC), // Soft Blue Button
                            shadowColor: Colors.grey.withOpacity(0.3), // Subtle Shadow
                            elevation: 5.0,
                          ),
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   // Handle login
                            // }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CampusRootsApp(name:_usernameController.text),
                                maintainState: true,
                              ),
                            );
                          },
                          child: Text(
                            'Login',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
