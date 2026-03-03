import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:day_2/screens/auth/login.dart';
import 'package:file_picker/file_picker.dart';
 import 'package:flutter/foundation.dart' show kIsWeb;
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

  bool _isSigningOut = false;
  bool _isAddingTask = false;
  bool _isEditingTask = false;

  Future<void> _signOut() async {
    setState(() {
      _isSigningOut = true;
    });
    try {
      await _auth.signOut();
      if (mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error signing out: ${e.message}')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An unexpected error occurred: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSigningOut = false;
        });
      }
    }
  }

  Future<void> _deleteTask(String docId) async {

    try {
      await _firestore.collection('tasks').doc(docId).delete();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Task deleted successfully!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete task: $e')),
        );
      }
    }

  }

  Future<void> selectImage() async {
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No image selected.')),
          );
        }
        return;
      }
      setState(() {
        pickedImage = result.files.first;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking image: $e')),
        );
      }
    }
  }

  Future<String?> uploadImage() async {
    if (pickedImage == null) return null;

    final path = 'files/${pickedImage!.name}';
    final file = File(pickedImage!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);

    try {
      setState(() {
        uploadImg = ref.putFile(file);
      });

      final snapshot = await uploadImg!.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      print('Download Link: $urlDownload');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image uploaded successfully!')),
        );
      }
      return urlDownload;
    } on FirebaseException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error uploading image: ${e.message}')),
        );
      }
      return null;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An unexpected error occurred during image upload: $e')),
        );
      }
      return null;
    } finally {
      if (mounted) {
        setState(() {
          uploadImg = null;
        });
      }
    }
  }

  Future<void> _addTaskDialog() async {
    TextEditingController taskController = TextEditingController();

    if (pickedImage != null) {
      setState(() {
        pickedImage = null;
      });
    }

    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Add New Task"),
              content: SingleChildScrollView(
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
                        constraints: const BoxConstraints(maxHeight: 200),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: kIsWeb // Check if running on web
                              ? Image.network(pickedImage!.path!, fit: BoxFit.cover)
                              : Image.file(
                                  File(pickedImage!.path!),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    if (pickedImage != null) const SizedBox(height: 10),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: _isAddingTask
                              ? null
                              : () async {
                                  await selectImage();
                                  setDialogState(() {});
                                },
                          icon: const Icon(Icons.image),
                          label: const Text("Select Image"),
                        ),
                        const SizedBox(width: 10),
                        if (pickedImage != null)
                          ElevatedButton.icon(
                            onPressed: uploadImg != null || _isAddingTask
                                ? null
                                : () async {
                                    setDialogState(() {
                                      uploadImage();
                                    });
                                  },
                            icon: const Icon(Icons.cloud_upload),
                            label: const Text("Upload"),
                          ),
                      ],
                    ),
                    buildProgress(),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: _isAddingTask
                      ? null
                      : () {
                          Navigator.pop(context);
                          setDialogState(() {
                            pickedImage = null;
                            uploadImg = null;
                          });
                        },
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: _isAddingTask || taskController.text.isEmpty
                      ? null
                      : () async {
                          setDialogState(() {
                            _isAddingTask = true;
                          });
                          try {
                            String? imageUrl;
                            if (pickedImage != null) {
                              imageUrl = await uploadImage();
                              if (imageUrl == null) {
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Image upload failed, task not added.')),
                                  );
                                }
                                return;
                              }
                            }

                            await _firestore.collection('tasks').add({
                              'title': taskController.text,
                              'imageUrl': imageUrl,
                              'timestamp': FieldValue.serverTimestamp(),
                              'userId': _auth.currentUser?.uid,
                            });

                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Task added successfully!')),
                              );
                              Navigator.of(context).pop();
                            }
                          } on FirebaseException catch (e) {
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Error adding task: ${e.message}')),
                              );
                            }
                          } catch (e) {
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('An unexpected error occurred: $e')),
                              );
                            }
                          } finally {
                            if (mounted) {
                              setDialogState(() {
                                _isAddingTask = false;
                                pickedImage = null;
                                uploadImg = null;
                              });
                            }
                          }
                        },
                  child: _isAddingTask
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text("Add"),
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
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Edit Task"),
              content: TextField(
                controller: taskController,
                decoration: const InputDecoration(hintText: "Edit task here"),
              ),
              actions: [
                TextButton(
                  onPressed: _isEditingTask
                      ? null
                      : () {
                          Navigator.of(context).pop();
                        },
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: _isEditingTask || taskController.text.isEmpty
                      ? null
                      : () async {
                          setDialogState(() {
                            _isEditingTask = true;
                          });
                          try {
                            await _firestore.collection('tasks').doc(docId).update({
                              'title': taskController.text,
                              'timestamp': FieldValue.serverTimestamp(),
                            });
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Task updated successfully!')),
                              );
                              Navigator.of(context).pop();
                            }
                          } on FirebaseException catch (e) {
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Error updating task: ${e.message}')),
                              );
                            }
                          } catch (e) {
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('An unexpected error occurred: $e')),
                              );
                            }
                          } finally {
                            if (mounted) {
                              setDialogState(() {
                                _isEditingTask = false;
                              });
                            }
                          }
                        },
                  child: _isEditingTask
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text("Save"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String? currentUserId = _auth.currentUser?.uid;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Tasks'),
            const Spacer(),
            ElevatedButton(
              onPressed: _isSigningOut ? null : _signOut,
              child: _isSigningOut
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text("Logout"),
            ),
          ],
        ),
      ),
      body: currentUserId == null
          ? const Center(child: Text("Please login to see your tasks."))
          : StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('tasks')
                  .where('userId', isEqualTo: currentUserId)
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
                ));
          } else {
            return Container();
          }
        },
      );
}
