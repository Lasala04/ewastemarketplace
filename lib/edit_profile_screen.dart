import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        actions: [
          TextButton(
            child: const Text("SAVE", style: TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.pop(context); // Simulate saving
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=12"),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey[900],
                    child: CircleAvatar(
                      backgroundColor: Colors.tealAccent,
                      radius: 20,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt, color: Colors.black),
                        onPressed: () { /* Mock change avatar */ },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          TextFormField(
              initialValue: "John Doe",
              decoration: const InputDecoration(labelText: 'Username')),
          const SizedBox(height: 16),
          TextFormField(
              initialValue: "Eco Warrior | Giving old tech a new purpose.",
              decoration: const InputDecoration(labelText: 'Bio')),
        ],
      ),
    );
  }
}