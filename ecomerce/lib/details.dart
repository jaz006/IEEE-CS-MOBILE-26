import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  final Map data;
  const ItemDetails({super.key, required this.data});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shop Now!", style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
      ),
      body: ListView(children: [
          Image.network(widget.data["Image"]),
          Container(child: Text(widget.data["title"], textAlign: TextAlign.center),),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 20),
            child: Text(widget.data["price"],
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                     ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Color: "),
                      SizedBox(width: 10),
                      Container(height: 20,width: 20, decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)
                      ),),
                      SizedBox(width: 10),
                      Container(height: 20,width: 20, decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 102, 2, 2),
                        borderRadius: BorderRadius.circular(30)
                      ),),
                     ],),
                     Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  child: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
    ),
    child: const Text(
      "Get It Now!",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  ),
)
        ],
      ));
  }
}
