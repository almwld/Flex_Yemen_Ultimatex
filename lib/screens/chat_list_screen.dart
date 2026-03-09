import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("الدردشة والوساطة", style: TextStyle(color: Color(0xFFD4AF37))),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(radius: 25, backgroundColor: Colors.white12, child: Icon(Icons.person, color: Colors.white)),
          title: Text("التاجر محمد علي", style: TextStyle(color: Colors.white)),
          subtitle: Text("هل المنتج لا يزال متوفراً؟", style: TextStyle(color: Colors.grey)),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("12:05", style: TextStyle(color: Colors.grey, fontSize: 10)),
              Container(padding: EdgeInsets.all(5), decoration: BoxDecoration(color: Color(0xFFD4AF37), shape: BoxShape.circle), child: Text("1", style: TextStyle(fontSize: 10))),
            ],
          ),
        ),
      ),
    );
  }
}
