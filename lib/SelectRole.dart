import 'package:flutter/material.dart';

class SelectRole extends StatefulWidget {
  const SelectRole({Key? key}) : super(key: key);

  @override
  _SelectRoleState createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _email, _password, _confirmPassword;
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/imageApp.jpg"),  // Ensure correct path in pubspec.yaml
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content (App Name and Branding)
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 150),
                Text(
                  'My App',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white,
             shadows:[
              Shadow(
                offset:Offset(-2.0,2.0),
                
                
              )
             ]
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Nexforce",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          // Bottom container for form and sign-up button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      // Full Name Field with styling
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Full Name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            onSaved: (value) => _name = value,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Email Field with styling
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Email',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty || !value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            onSaved: (value) => _email = value,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Password Field with styling
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Password',
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty || value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            onSaved: (value) => _password = value,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Confirm Password Field with styling
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Confirm Password',
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty || value != _password) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            onSaved: (value) => _confirmPassword = value,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Terms and Conditions with Checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: _isAgreed,
                            onChanged: (bool? value) {
                              setState(() {
                                _isAgreed = value!;
                              });
                            },
                          ),
                          Expanded(child: Text("I agree to the terms and conditions")),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Submit Button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate() && _isAgreed) {
                            _formKey.currentState!.save();
                            // Handle sign up logic here
                            print("Sign Up Successful with name: $_name, email: $_email");
                          } else if (!_isAgreed) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Please agree to the terms and conditions"))
                            );
                          }
                        },
                        child: Text("Sign Up"),
                      ),
                      SizedBox(height: 20),
                      // Login Link
                      TextButton(
                        onPressed: () {
                          // Navigate to login screen (if any)
                          Navigator.pop(context);
                        },
                        child: Text("Already have an account? Login"),
                      ),
                    ],
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
