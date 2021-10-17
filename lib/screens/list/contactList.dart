import 'package:flutter/material.dart';
import 'package:flutter_task_2/models/listModel.dart';
import 'package:provider/src/provider.dart';

import '../../models/contactModel.dart';
import 'contactListItem.dart';


class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final _contactCart = <Contact>{};
  String lastNameLetter = "";

  void _starTap(bool isFavorited, Contact contact) {
    setState(() {
      if (!isFavorited) {
        _contactCart.add(contact);
      } else {
        _contactCart.remove(contact);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var list = context.watch<ListModel>();
    list.sort();
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(3),
        children: list.contacts.map((Contact contact) {
          var item = ContactListItem(
            contact: contact,
            isFavorited: _contactCart.contains(contact),
            onFavoritChanged: _starTap,
          );
          if (contact.lastName[0] == lastNameLetter) {
            lastNameLetter = contact.lastName[0];
            return item;
          } else {
            lastNameLetter = contact.lastName[0];
            return Header(
              item: item,
              letter: lastNameLetter,
            );
          }
        }).toList(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key, required this.item, required this.letter})
      : super(key: key);
  final Widget item;
  final String letter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Text(
            "$letter",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black45),
          ),
        ),
        item
      ],
    );
  }
}