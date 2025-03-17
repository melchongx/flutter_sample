import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sample_one/pages/signup_page.dart';
import '../auth_service.dart';
import 'home_page.dart';
import 'application_process_page.dart';
import 'login_page.dart';
import 'success_page.dart';
import 'settings_page.dart';

class LegitNaHomePage extends StatefulWidget {
  const LegitNaHomePage({super.key});

  @override
  State<LegitNaHomePage> createState() => _LegitNaHomePageState();
}

class _LegitNaHomePageState extends State<LegitNaHomePage> {
  final AuthService _authService = AuthService();
  User? _currentUser;
  String _username = "";

  @override
  void initState() {
    super.initState();
    // Set up authentication state listener
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _currentUser = user;
        _username = user?.displayName ?? "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: const Text("JobAll"),
        backgroundColor: const Color(0xFF28356C),
        foregroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF28356C)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFFFFFFFF),
                        child: Icon(Icons.person, size: 30, color: Color(0xFF28356C)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _currentUser != null
                                  ? "Welcome Back, $_username!"
                                  : "Welcome!",
                              style: const TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (_currentUser == null) ...[
                              const SizedBox(height: 8),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                                  );
                                },
                                child: const Text(
                                  "Sign up to apply →",
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 14,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                _currentUser != null ? Icons.logout : Icons.login,
                color: const Color(0xE0E35559),
              ),
              title: Text(_currentUser != null ? 'Sign Out' : 'Log In'),
              onTap: () {
                Navigator.pop(context);
                if (_currentUser != null) {
                  _authService.signOut();
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }
              },
            ),
            if (_currentUser == null)
              ListTile(
                leading: const Icon(Icons.person_add, color: Color(0xE0E35559)),
                title: const Text('Sign Up'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
              ),
            ListTile(
              leading: const Icon(Icons.home, color: Color(0xE0E35559)),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LegitNaHomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.work, color: Color(0xE0E35559)),
              title: const Text('Look for Jobs'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xE0E35559)),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Image.asset(
                  'assets/lookjob.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  color: const Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "\"There is always a job for you. There is always Job for All.\"",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF28356C),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 26),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF28356C),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text(
                    "Start Searching",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Card(
                  color: const Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "JobAll Reviews",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF28356C),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "JobAll",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF28356C),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 30),
                            Icon(Icons.star, color: Colors.amber, size: 30),
                            Icon(Icons.star, color: Colors.amber, size: 30),
                            Icon(Icons.star, color: Colors.amber, size: 30),
                            Icon(Icons.star_half, color: Colors.amber, size: 30),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "4.7 out of 5 - Based on 10,000+ reviews",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF28356C),
                          ),
                        ),
                        SizedBox(height: 16),
                        CommentBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Comment {
  String name;
  String role;
  String review;

  Comment({required this.name, required this.role, required this.review});
}

class CommentBox extends StatefulWidget {
  const CommentBox({Key? key}) : super(key: key);

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();

  final List<Comment> _comments = []; // List to store submitted comments

  void _submitComment() {
    String name = _nameController.text.trim();
    String role = _roleController.text.trim();
    String review = _reviewController.text.trim();

    if (name.isNotEmpty && role.isNotEmpty && review.isNotEmpty) {
      setState(() {
        _comments.insert(0, Comment(name: name, role: role, review: review));
      });

      _nameController.clear();
      _roleController.clear();
      _reviewController.clear();
    }
  }

  void _editComment(int index) {
    _nameController.text = _comments[index].name;
    _roleController.text = _comments[index].role;
    _reviewController.text = _comments[index].review;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Review"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Your Name'),
              ),
              TextField(
                controller: _roleController,
                decoration: const InputDecoration(labelText: 'Your Role'),
              ),
              TextField(
                controller: _reviewController,
                decoration: const InputDecoration(labelText: 'Your Review'),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _comments[index].name = _nameController.text;
                  _comments[index].role = _roleController.text;
                  _comments[index].review = _reviewController.text;
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _deleteComment(int index) {
    setState(() {
      _comments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: 'Your Name'),
        ),
        TextField(
          controller: _roleController,
          decoration: const InputDecoration(labelText: 'Your Role'),
        ),
        TextField(
          controller: _reviewController,
          decoration: const InputDecoration(labelText: 'Your Review'),
          maxLines: 3,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _submitComment,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF28356C),
            foregroundColor: Colors.white,
          ),
          child: const Text('Submit Review'),
        ),
        const SizedBox(height: 20),
        Column(
          children: List.generate(_comments.length, (index) {
            return ReviewCard(
              comment: _comments[index],
              onEdit: () => _editComment(index),
              onDelete: () => _deleteComment(index),
            );
          }),
        ),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final Comment comment;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ReviewCard({Key? key, required this.comment, required this.onEdit, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Container(
        width: double.infinity, // Ensures it takes full width
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              comment.role,
              style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 6),
            Text(comment.review),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit, color: Colors.blue),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
