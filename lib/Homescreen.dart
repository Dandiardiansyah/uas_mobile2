import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _profesiController = TextEditingController();

  CollectionReference _users = FirebaseFirestore.instance.collection("users");

  void _addUser() {
    _users.add({
      'nama': _namaController.text,
      'profesi': _profesiController.text,
    });
    _namaController.clear();
    _profesiController.clear();
  }

  void _deleteUser(String userId) {
    _users.doc(userId).delete();
  }

  void _editUser(DocumentSnapshot user) {
    _namaController.text = user['nama'];
    _profesiController.text = user['profesi'];

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Edit User"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: InputDecoration(labelText: "user nama"),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _profesiController,
                  decoration: InputDecoration(labelText: "user profesi"),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    _updateUser(user.id);
                    Navigator.pop(context);
                  },
                  child: Text("Update"))
            ],
          );
        });
  }

  void _updateUser(String userId) {
    _users.doc(userId).update(
        {'nama': _namaController.text, 'profesi': _profesiController.text});

    _namaController.clear();
    _profesiController.clear();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(labelText: "Enter user nama"),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _profesiController,
              decoration: InputDecoration(labelText: "Enter profesi user"),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                _addUser();
              },
              child: Text("Add user"),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
                child: StreamBuilder(
              stream: _users.snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var user = snapshot.data!.docs[index];
                    return Dismissible(
                      key: Key(user.id),
                      background: Container(
                        color: Colors.redAccent,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (direction) {
                        _deleteUser(user.id);
                      },
                      direction: DismissDirection.endToStart,
                      child: Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(
                            user['nama'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            user['profesi'],
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              _editUser(user);
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
