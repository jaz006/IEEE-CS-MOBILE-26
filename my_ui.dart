import 'package:flutter/material.dart';

void main() {
  runApp(const JazApp());
}

class JazApp extends StatelessWidget {
  const JazApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0E0E0E),
        fontFamily: 'Roboto',
      ),
      home: const JazProfile(),
    );
  }
}

class JazProfile extends StatelessWidget {
  const JazProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Jaz"),
        actions: const [
          Icon(Icons.music_note),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // Profile Card
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1B0F14),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: const Color.fromARGB(255, 41, 1, 13), width: 0.6),
              ),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Color.fromARGB(255, 37, 3, 13),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jaz",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "unsetteld.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Quote Card
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1B0F14),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: const Color.fromARGB(255, 39, 1, 13), width: 0.6),
              ),
              child: const Text(
                "Don't you wanna be alive before you die?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            //Review Container
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1B0F14),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: const Color.fromARGB(255, 37, 1, 12), width: 0.6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: Color.fromARGB(255, 85, 30, 48)),
                  Icon(Icons.star, color: Color.fromARGB(255, 85, 30, 48)),
                  Icon(Icons.star, color: Color.fromARGB(255, 85, 30, 48)),
                  Icon(Icons.star, color: Color.fromARGB(255, 85, 30, 48)),
                  Icon(Icons.star, color: Color.fromARGB(255, 85, 30, 48)),
                  SizedBox(width: 8),
                  Text(
                    "150 reviews",
                    style: TextStyle(color: Colors.white70),
                  )
                ],
              ),
            ),

            // Stats Card
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1B0F14),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: const Color.fromARGB(255, 42, 1, 13), width: 0.6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Column(
                    children: [
                      Icon(Icons.psychology,
                          color: Color.fromARGB(255, 85, 30, 48)),
                      SizedBox(height: 6),
                      Text("Depth",
                          style: TextStyle(color: Colors.grey)),
                      Text("∞",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.nightlight_round,
                          color: Color.fromARGB(255, 85, 30, 48)),
                      SizedBox(height: 6),
                      Text("Chaos",
                          style: TextStyle(color: Colors.grey)),
                      Text("Soft",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.coffee,
                          color: Color.fromARGB(255, 85, 30, 45)),
                      SizedBox(height: 6),
                      Text("Coffee",
                          style: TextStyle(color: Colors.grey)),
                      Text("Always",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),

            // Things I love
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1B0F14),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: const Color.fromARGB(255, 42, 1, 13), width: 0.6),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "my hobbies",
                    style: TextStyle(
                      color: Color.fromARGB(255, 85, 30, 45),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("• Daydreaming",
                      style: TextStyle(color: Colors.white70)),
                  Text("• Writing",
                      style: TextStyle(color: Colors.white70)),
                  Text("• chess(doesn't mean im good at it)",
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
