import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:day_2/screens/auth/login.dart';
import 'package:file_picker/file_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PlatformFile? pickedImage;
  UploadTask? uploadImg;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _signOut() async {
    await _auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
  }

  Future<void> _deleteTask(String docId) async {
    await _firestore.collection('tasks').doc(docId).delete();
  }

  Future selectImage() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState((){
      pickedImage = result.files.first;
    });
  }
  Future<String?> uploadImage() async {
    if (pickedImage == null) return null;

    final path = 'files/${pickedImage!.name}';
    final file = File(pickedImage!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);

    setState(() {
      uploadImg = ref.putFile(file);
    });

    final snapshot = await uploadImg!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link: $urlDownload');

    setState(() {
      uploadImg = null;
    });

    return urlDownload;
  }


  Future<void> _addTaskDialog() async {
    TextEditingController taskController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Add New Task"),
              content: SingleChildScrollView(
                child: SizedBox(
                  height: 600,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: taskController,
                        decoration: const InputDecoration(hintText: "Enter task here"),
                      ),
                      const SizedBox(height: 20),

                      if (pickedImage != null)
                        Container(
                          height: Image.file(File(pickedImage!.path!)).height,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(pickedImage!.path!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      const SizedBox(height: 5),

                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () async {
                                await selectImage();
                                setDialogState(() {});
                              },
                              child: const Text("Select Image")
                          ),
                          const SizedBox(width: 10),
                          if (pickedImage != null)
                            ElevatedButton(
                                onPressed: () async {
                                  setDialogState(() {
                                    uploadImage();
                                  });
                                },
                                child: const Text("Upload")
                            ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      buildProgress(),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
                ElevatedButton(
                  onPressed: () async {
                    if (taskController.text.isNotEmpty) {
                      String? imageUrl;

                      if (pickedImage != null) {
                        imageUrl = await uploadImage();
                      }

                      await _firestore.collection('tasks').add({
                        'title': taskController.text,
                        'imageUrl': imageUrl, // Store the URL here!
                        'timestamp': FieldValue.serverTimestamp(),
                        'userId': _auth.currentUser?.uid,
                      });

                      setState(() { pickedImage = null; });
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Add"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _editTaskDialog(String docId, String currentTitle) async {
    TextEditingController taskController = TextEditingController(text: currentTitle);
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Task"),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(hintText: "Edit task here"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (taskController.text.isNotEmpty) {
                  await _firestore.collection('tasks').doc(docId).update({
                    'title': taskController.text,
                    'timestamp': FieldValue.serverTimestamp(), // Update timestamp on edit
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the current user's UID to filter tasks
    final String? currentUserId = _auth.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Tasks'),
            const Spacer(),
            ElevatedButton(
              onPressed: _signOut,
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
      body: currentUserId == null
          ? const Center(child: Text("Please login to see your tasks."))
          : StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('tasks')
                  .where('userId', isEqualTo: currentUserId) // Filter tasks by user ID
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No tasks found. Add one!'));
                }

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = snapshot.data!.docs[index];
                    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                    String taskId = document.id;
                    String taskTitle = data['title'] ?? 'No Title';
                    String? imageUrl = data['imageUrl'];

                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (imageUrl != null && imageUrl.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  imageUrl,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.broken_image);
                                  },
                                ),
                              ),
                            ),
                          ListTile(
                            title: Text(taskTitle),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () => _editTaskDialog(taskId, taskTitle),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => _deleteTask(taskId),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
    stream: uploadImg?.snapshotEvents,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final snap = snapshot.data!;
        double progress = snap.bytesTransferred / snap.totalBytes;
        return Container(
            height: 35,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(value: progress),
                Center(
                  child: Text(
                    '${(100 * progress).roundToDouble()}%',
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
        );
      } else {
        return Container();
      }
    }
  );
}
