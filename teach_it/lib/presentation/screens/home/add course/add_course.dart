import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teach_it/presentation/screens/home/widgets/choose_image.dart';

class Addcourse extends StatefulWidget {
  const Addcourse({
    super.key,
    required this.databaseRef,
  });
  final CollectionReference databaseRef;
  @override
  State<Addcourse> createState() => _AddcourseState();
}

class _AddcourseState extends State<Addcourse> {
  List<String> categories = [
    'Coding',
    'Design',
    'Science',
    'Language',
    'Arts',
    'Maths',
    'Marketing',
    'Business',
    'Music',
    'Productivity',
    'Life style',
    'Other'
  ];

  String dropdownvalue = 'Coding';

  final titlecontroller = TextEditingController();

  final discriptioncontroller = TextEditingController();

  final pricecontroller = TextEditingController();

  String? imageurl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Course')),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    backgroundBlendMode: BlendMode.darken,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: titlecontroller,
                  autofocus: true,
                  maxLength: 30,
                  decoration: const InputDecoration(
                      hintText: ' Course Title',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 3, left: 2)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: pricecontroller,
                    maxLength: 10,
                    decoration: const InputDecoration(
                        hintText: 'Price',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 6, left: 5)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 3),
                      child: Text(
                        'Category',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: dropdownvalue,
                          items: categories.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() async {
                  imageurl = await imageChooser();
                });
              },
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(10)),
                child: imageurl == null
                    ? const Center(
                        child: Text(
                          'Tap to add Thumbnail',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Image.network(imageurl!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: discriptioncontroller,
                    maxLines: 20,
                    maxLength: 1200,
                    decoration: const InputDecoration(
                        hintText: 'Discription',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 10, left: 5)),
                  )),
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final user = FirebaseAuth.instance.currentUser;
          widget.databaseRef.doc(titlecontroller.text.toString()).set({
            'id': user!.uid,
            'username': user.displayName,
            'title': titlecontroller.text.toString(),
            'discription': discriptioncontroller.text.toString(),
            'links': [],
            'discriptions': [],
            'price': pricecontroller.text.toString(),
            'category': dropdownvalue,
            'imgurl' : imageurl
          });
          titlecontroller.clear();
          discriptioncontroller.clear();
          Navigator.pop(context);
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
