import 'package:flutter/material.dart';

class loginclick extends StatefulWidget {
  @override
  _loginclickState createState() => _loginclickState();
}

class _loginclickState extends State<loginclick> {
  int _currentIndex = 0; // Set to 0 to make Profile page the default

  // Pages for navigation
  final List<Widget> _pages = [
    ProfileScreen(),
    PortfolioScreen(),
    SettingsScreen(), // Keep the original SettingsScreen intact
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          _currentIndex == 0
              ? 'Profile'
              : _currentIndex == 1
                  ? 'Portfolio'
                  : 'Settings', // Corrected the title logic
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer Header (you can customize the header)
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/sherin_profile.jpg'), // Add your profile image
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Sherin Reeba Mathew',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'sherinasm813@gmail.com',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            // ListTile for Settings page
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
            // ListTile for Help
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                // You can add navigation or functionality for Help here
              },
            ),
            // ListTile for Logout
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                // Handle logout logic here, for example:
                Navigator.pop(context); // Close the drawer
                // Perform logout logic (clear session, redirect to login, etc.)
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.blue[50], // Background color for the entire screen
        child: _pages[_currentIndex], // Correctly display the current page
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update index to navigate between pages
          });
        },
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// ProfileScreen
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Profile Picture Section with Name and Email
            Container(
              width: 400,
              height: 150,
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow[50],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Circular image positioned at the bottom center
                  Positioned(
                    bottom: -30, // Moves the image below the container
                    left: 140, // Adjusts the horizontal position to center the image
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/sherin_profile.jpg'), // Add your profile image
                    ),
                  ),
                ],
              ),
            ),

            // Name and Email
            SizedBox(height: 60), // Space to accommodate the overlapped image
            Text(
              'Sherin Reeba Mathew',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'sherinasm813@gmail.com',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),

            // Current Role Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Role',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "HR Manager & App Developer at Nexforce ",
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Bio Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bio',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Hi, I'm Sherin Reeba Mathew! I'm currently the HR Manager at Nexforce Synergy, a dynamic student-run startup where we bridge the gap between academia and industry. With a passion for technology, I'm actively involved in app development using Flutter, creating user-friendly mobile applications.",
                    style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Skills Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Skills',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: Icon(Icons.check, color: Colors.green),
                    title: Text('Flutter & Dart for App Development'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check, color: Colors.green),
                    title: Text('Data Structures with C programming'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check, color: Colors.green),
                    title: Text('Human Resources Management'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check, color: Colors.green),
                    title: Text('Communication Skill'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Contact Information Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.blue),
                    title: Text('sherinasm813@gmail.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.blue),
                    title: Text('+91 9495992466'),
                  ),
                  ListTile(
                    leading: Icon(Icons.link, color: Colors.blue),
                    title: Text('LinkedIn Profile'),
                    onTap: () {
                      // Add LinkedIn navigation here
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// Portfolio Page
class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      child: ListView(
        children: [
          ProjectWidget(
            title: 'Project 1:Automated Google Search in Python',
            description: 
                 'This project was carried out under Projetaro, a project development program of the CSI Club. '
                'The application automates Google search tasks using Python libraries like Selenium for web automation and utilizes Tkinter for the user interface (UI). '
                'It enables users to fetch and display search results programmatically through an intuitive desktop UI.',
          ),
          ProjectWidget(
            title: 'Project 2:App Development using Flutter - "My App"',
            description: 
                'This mobile application serves as a personal portfolio showcasing my skills, profile, and projects, similar to a digital resume. '
                'The project was developed during my trainee period at Nexforce, demonstrating my expertise in Flutter for creating intuitive and user-friendly apps.',
          ),
        ],
      ),
    );
  }
}

// Settings Page
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          // Change Password Option
          ListTile(
            title: Text("Change Password"),
            leading: Icon(Icons.lock),
            onTap: () {
              // Handle change password
            },
          ),
          // Sign Out Option
          ListTile(
            title: Text("Sign Out"),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              // Handle sign out
            },
          ),
          // Theme Option
          ListTile(
            title: Text("Theme"),
            leading: Icon(Icons.color_lens),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle theme selection
            },
          ),
          // Brightness Option
          ListTile(
            title: Text("Brightness"),
            leading: Icon(Icons.brightness_6),
            trailing: Switch(
              value: MediaQuery.of(context).platformBrightness == Brightness.dark,
              onChanged: (bool value) {
                // Toggle brightness
                if (value) {
                  // Switch to dark mode
                } else {
                  // Switch to light mode
                }
              },
            ),
          ),
          // Font Option
          ListTile(
            title: Text("Font"),
            leading: Icon(Icons.text_fields),
            onTap: () {
              // Handle font selection
            },
          ),
          // Wallpaper Option
          ListTile(
            title: Text("Wallpaper"),
            leading: Icon(Icons.wallpaper),
            onTap: () {
              // Handle wallpaper change
            },
          ),
          // Notification Option
          ListTile(
            title: Text("Notifications"),
            leading: Icon(Icons.notifications),
            trailing: Switch(
              value: true, // Replace with actual notification state
              onChanged: (bool value) {
                // Handle notification toggle
              },
            ),
          ),
          // App Language Option
          ListTile(
            title: Text("App Language"),
            leading: Icon(Icons.language),
            onTap: () {
              // Handle app language selection
            },
          ),
        ],
      ),
    );
  }
}

// Project Widget for Portfolio Page
class ProjectWidget extends StatelessWidget {
  final String title;
  final String description;

  ProjectWidget({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
