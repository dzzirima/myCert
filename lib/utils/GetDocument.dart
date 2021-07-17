import 'package:flutter/material.dart';
import 'package:my_cert/widgets/DocumentCard.dart';

class GetDocuments{

  Future<String> getDocs() async {
    var order = await fetchUserOrder();
    return 'Your order is: $order';
  }

  Future<String> fetchUserOrder() =>
      // Imagine that this function is
  // more complex and slow.
  Future.delayed(
    const Duration(seconds: 2),
        () => 'Large Latte',
  );

  // Future<String> getDocs() async{
  //   Future<String> David = "David" as Future<String>;
    //
    // List<DocumentCard>documentNames = [
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    //   DocumentCard(nameOfDocument: "david",icon: Icons.dangerous,uploadDate: "today"),
    // ];
    //
    // return Future.delayed(const Duration(seconds: 2));


}

