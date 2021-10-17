import 'package:flutter/material.dart';

import 'contactModel.dart';

class ListModel extends ChangeNotifier{
  ListModel(){sort();}

  List<Contact> _contactList = [
    Contact(
        firstName: "John",
        lastName: "Agnew",
        phone: "+380661568651",
        company: "Google",
        description: "",
        avatarPhoto: NetworkImage(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Matthew_McConaughey_2019_%2848648344772%29.jpg/1200px-Matthew_McConaughey_2019_%2848648344772%29.jpg')),
    Contact(
        firstName: "Joshua",
        lastName: "Allison",
        phone: "+380661568624",
        company: "Uber",
        description: "",
        avatarPhoto: NetworkImage(
            'https://upload.wikimedia.org/wikipedia/commons/c/c1/Visit_of_Bill_Gates%2C_Chairman_of_Breakthrough_Energy_Ventures%2C_to_the_European_Commission_5_%28cropped%29.jpg')),
    Contact(
        firstName: "Sam",
        lastName: "Barnard",
        phone: "+380661538654",
        company: "Microsoft",
        description: "",
        avatarPhoto: NetworkImage(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Matthew_McConaughey_2019_%2848648344772%29.jpg/1200px-Matthew_McConaughey_2019_%2848648344772%29.jpg')),
    Contact(
        firstName: "Kele",
        lastName: "Dickenson",
        phone: "+380664568654",
        company: "Google",
        description: "",
        avatarPhoto: NetworkImage(
            'https://upload.wikimedia.org/wikipedia/commons/c/c1/Visit_of_Bill_Gates%2C_Chairman_of_Breakthrough_Energy_Ventures%2C_to_the_European_Commission_5_%28cropped%29.jpg')),
    Contact(
        firstName: "Steve",
        lastName: "Jobs",
        phone: "+380661565654",
        company: "Microsoft",
        description: "",
        avatarPhoto: NetworkImage(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Matthew_McConaughey_2019_%2848648344772%29.jpg/1200px-Matthew_McConaughey_2019_%2848648344772%29.jpg')),
    Contact(
        firstName: "Bill",
        lastName: "Gates",
        phone: "+380661568664",
        company: "Amazon",
        description: "",
        avatarPhoto: NetworkImage(
            'https://upload.wikimedia.org/wikipedia/commons/c/c1/Visit_of_Bill_Gates%2C_Chairman_of_Breakthrough_Energy_Ventures%2C_to_the_European_Commission_5_%28cropped%29.jpg')),
  ];

  void sort(){
    _contactList.sort((a,b)=> a.lastName.compareTo(b.lastName));
  }

  List<Contact> get contacts => _contactList;

  void setByIndex(int index, Contact contact){
    if(index != -1){
      _contactList[index] = contact;
    }
  }

  void changeItem(Contact oldContact,Contact newContact){
    int indx = -1;
    _contactList.forEach((element) {
     if(element.phone == oldContact.phone){
       indx = _contactList.indexOf(element);
     }
   });
    setByIndex(indx, newContact);

    notifyListeners();
  }
}