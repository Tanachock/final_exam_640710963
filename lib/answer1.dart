import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('โปรไฟล์ผู้ใช้'),
              backgroundColor: Colors.blue,
              centerTitle: false,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: Column(
                children: [
                  Container(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCtSeGT738HXknfdqANKF7fbspupik032yJQ&s"),
                    ),
                  ),
                  Text(
                    "ชื่อผู้ใช้ : Tanachock Saelo",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "อีเมล: saelo_t@silpakorn.edu",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.settings, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text("การตั้งค่า"),
                    ],
                  ),
                  SizedBox(height: 20),
                   Row(
                    children: [
                      const Icon(Icons.lock, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text("เปลี่ยนรหัสผ่าน"),
                    ],
                  ),
                  SizedBox(height: 20),
                   Row(
                    children: [
                      const Icon(Icons.privacy_tip, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text("ความเป็นส่วนตัว"),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: (){}, child: Text("แก้ไขโปรไฟล์")),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: (){}, child: Text("ออกจากระบบ"))
                ],
              )),
            )));
  }
}
