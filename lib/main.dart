
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/SelectRole.dart';
import 'package:my_app/loginclick.dart';
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyAppState(),
      ),
       routes: {
        '/login': (context) =>  loginclick (),
        '/Create account':(context)=> SelectRole (),
        
        
      },

    );
  }
}

class MyAppState extends StatefulWidget {
  const MyAppState({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppState> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/imageApp.jpg",
            fit: BoxFit.cover,
           
          ),
        ),
      
         Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height:150),
             Text(
            'My App',
             style:TextStyle(
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
                style: TextStyle(fontSize: 20,
                color:Colors.white,
                shadows: [
                  Shadow(
                     offset: Offset(2.0, 2.0), // Position of shadow (bottom-right)
                    color: Colors.black, // Shadow color (border color)
                     blurRadius: 3.0, // Blur radius for softer border
                     ),
                     ],
                 ),   
                 ),
            ],
          ),
         ),
        Positioned.fill(
          child: Container(
            child: Stack(
            
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: _isExpanded
                        ? MediaQuery.of(context).size.height * 0.6
                        : MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if(_isExpanded)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                          child:Text('Login',
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                        ),
                            
                        if (_isExpanded) 
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Email',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (_isExpanded) 
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Password',
                                  ),
                                  obscureText: true,
                                ),
                              ),
                            ),
                          ),
                        if (_isExpanded)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                            child: Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  // Handle forgot password click
                                },
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height:100),
                        if (_isExpanded)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                            child: Row(
                              children: [
                                Expanded(child: Divider(color:Colors.grey[700]),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    "New to our community?",
                                    style: TextStyle(color: Colors.black,fontSize:11),
                                  ),
                                ),
                                Expanded(child: Divider(color:Colors.grey[700])),
                              ],
                            ),
                          ),
                          SizedBox(height:10),
                        if (_isExpanded)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context,'/Create account');
                              },
                              child: Text(
                                'Create account',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration:TextDecoration.underline,
                                  decorationColor:Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: _isExpanded
                      ? MediaQuery.of(context).size.height * 0.4
                      : MediaQuery.of(context).size.height * 0.3,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: _isExpanded ? 0.0 : 1.0,
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: _isExpanded
                      ? MediaQuery.of(context).size.height * 0.1
                      : MediaQuery.of(context).size.height * 0.15,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 155),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_isExpanded) {
                            Navigator.pushNamed(context, '/login');
                          } else {
                            _isExpanded = !_isExpanded;
                          }
                        });
                      
                        
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 98, 206, 68),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: Colors.grey[600]!, width: 3.0),
                        ),
                        child: Center(
                          child: Text(
                            _isExpanded ? 'Login' : 'Get Started',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width * 0.045,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],  
    );
  }
}
