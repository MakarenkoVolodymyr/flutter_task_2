import 'package:flutter/material.dart';

import 'components/Contact.dart';

void main() {
  runApp(const MyApp());
}

final List<Contact> contacts = [
  Contact(firstName: "John", lastName: "Agnew", company: "Google",description: "", avatarPhoto: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Matthew_McConaughey_2019_%2848648344772%29.jpg/1200px-Matthew_McConaughey_2019_%2848648344772%29.jpg')),
  Contact(firstName: "Joshua", lastName: "Allison", company: "Uber",description: "", avatarPhoto: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/c/c1/Visit_of_Bill_Gates%2C_Chairman_of_Breakthrough_Energy_Ventures%2C_to_the_European_Commission_5_%28cropped%29.jpg')),
  Contact(firstName: "Sam", lastName: "Barnard", company: "Microsoft",description: "", avatarPhoto: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Matthew_McConaughey_2019_%2848648344772%29.jpg/1200px-Matthew_McConaughey_2019_%2848648344772%29.jpg')),
  Contact(firstName: "Kele", lastName: "Dickenson", company: "Google",description: "", avatarPhoto: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/c/c1/Visit_of_Bill_Gates%2C_Chairman_of_Breakthrough_Energy_Ventures%2C_to_the_European_Commission_5_%28cropped%29.jpg')),
  Contact(firstName: "Steve", lastName: "Jobs", company: "Microsoft",description: "", avatarPhoto: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Matthew_McConaughey_2019_%2848648344772%29.jpg/1200px-Matthew_McConaughey_2019_%2848648344772%29.jpg')),
  Contact(firstName: "Bill", lastName: "Gates", company: "Amazon",description: "", avatarPhoto: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/c/c1/Visit_of_Bill_Gates%2C_Chairman_of_Breakthrough_Energy_Ventures%2C_to_the_European_Commission_5_%28cropped%29.jpg')),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    contacts.sort((Contact a,Contact b) {
      return a.lastName.compareTo(b.lastName);
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactList(
          contacts: contacts
      )
    );
  }
}



typedef FavoritChangedCallback = Function(bool isFavorit, Contact contact);

class ContactListItem extends StatelessWidget {
  const ContactListItem({Key? key, required this.contact, required this.isFavorited, required this.onFavoritChanged}) : super(key: key);

  final Contact contact;
  final bool isFavorited;
  final FavoritChangedCallback onFavoritChanged;

  Color _getColor(BuildContext context) {

    return isFavorited ? Colors.blue : Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        children: [
          IconButton(onPressed: () {
            onFavoritChanged(isFavorited,contact);
            },
              icon: Icon(Icons.star,
                color: _getColor(context),
              )
          ),
          CircleAvatar(
            foregroundImage: contact.avatarPhoto,
            backgroundColor: Colors.cyanAccent,
            radius: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contact.firstName + " " + contact.lastName,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(contact.company,
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ContactList extends StatefulWidget {
  const ContactList({required this.contacts, Key? key}) : super(key: key);

  final List<Contact> contacts;

  @override
  _ContactListState createState() => _ContactListState();
}



class _ContactListState extends State<ContactList> {
  final _contactCart = <Contact>{};
  String lastName = "";

  void _starTap(bool isFavorited, Contact contact) {
    setState(() {
      if(!isFavorited){
        _contactCart.add(contact);
      }else{
        _contactCart.remove(contact);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(3),
          children: widget.contacts.map((Contact contact) {
            var item = ContactListItem(
              contact: contact,
              isFavorited: _contactCart.contains(contact),
              onFavoritChanged: _starTap,
            );
            if(contact.lastName[0] == lastName){
              lastName = contact.lastName[0];
              return item;
            }
          else{
            lastName = contact.lastName[0];
            return Header(
              item: item,
              letter: lastName,
            );
          }
          }).toList(),
        ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key, required this.item, required this.letter}) : super(key: key);
  final Widget item;
  final String letter;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Text("$letter", style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black45
          ),
          ),
        ),
        item
      ],
    );
  }
}
