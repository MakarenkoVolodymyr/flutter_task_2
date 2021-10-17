import 'package:flutter/material.dart';
import 'package:flutter_task_2/models/contactModel.dart';
import 'package:flutter_task_2/models/listModel.dart';
import 'package:provider/src/provider.dart';

import 'contactScreenComponent.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);
  static const routeName = '/contactScreen';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Contact;
    final TextEditingController nameController =
        TextEditingController(text: args.firstName);
    final TextEditingController lastNameController =
        TextEditingController(text: args.lastName);
    final TextEditingController companyController =
        TextEditingController(text: args.company);
    final TextEditingController phoneController =
        TextEditingController(text: args.phone);
    final TextEditingController bioController =
        TextEditingController(text: args.description);
    var list = context.read<ListModel>();

    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                list.changeItem(args,
                    Contact(
                        firstName: nameController.text,
                        lastName: lastNameController.text,
                        phone: phoneController.text,
                        company: companyController.text,
                        description: bioController.text,
                        avatarPhoto: args.avatarPhoto)
                );
                Navigator.pop(
                    context,
                );
              },
              child: Text(
                "Save".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    foregroundImage: args.avatarPhoto,
                    backgroundColor: Colors.cyanAccent,
                    radius: 75,
                  ),
                ),
                buildText("Name"),
                buildTextField(nameController),
                buildText("Last name"),
                buildTextField(lastNameController),
                buildText("Phone"),
                buildTextField(phoneController),
                buildText("Company"),
                buildTextField(companyController),
                buildText("BIO"),
                buildTextField(bioController),
              ],
            ),
          ),
        )
    );
  }
}
