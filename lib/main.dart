// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';



void main() {
  runApp(Data(
    email: 'falak@gmail.com',
    phone: '9878654654',
    name: 'falak',
    child: MaterialApp(
      title: 'Named Route Navigation',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      
      home: FirstScreen(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {

  //   String name;
  //  String email;
  //  String phone;
   TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();

  // _RootWidgetState(this.name, this.email, this.phone);

 
  // void gettext(){
    
  //   setState(() {
  //    name: _name.text;
  //   email: _email.text;
  //   phone: _phone.text;
  //   });
  // }
  // void getdata(){
  //   setState(() {
  //     //  Text('Name: $name');
  //     //     Text('Email: $email');
  //     //     Text('Phone: $phone');
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return FifthScreen(
      // gettext: gettext(),
      // getdata: getdata()
      
      // child:const FifthScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.8),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Enter Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.8),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Enter Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.8),
              child: TextField(
                controller: _phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Enter Phone'),
              ),
            ),

            SizedBox(
              height: 20,
            ),
           
            RaisedButton(
              child: Text('Second screen'),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SecondScreen(
                        name: _name.text,
                        email: _email.text,
                        phone: _phone.text,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
 

class SecondScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  const SecondScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Column(
        children: [
         
          Center(
            child: RaisedButton(
              color: Colors.blue,
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ThirdScreen(
                        name: name,
                        email: email,
                        phone: phone,
                      );
                    },
                  ),
                );
              },
              child: Text('thirdscreen'),
            ),
          ),
        ],
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  const ThirdScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Screen"),
      ),
      body: Column(
        children: [
         
          Center(
            child: RaisedButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FourthScreen(
                        name: name,
                        email: email,
                        phone: phone,
                      );
                    },
                  ),
                );
              },
              child: Text('Fourth Screen'),
            ),
          ),
        ],
      ),
    );
  }
}

class FourthScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  const FourthScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fourth Screen"),
      ),
      body: Column(
        children: [
         
          Center(
            child: RaisedButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FifthScreen(
                        name: name,
                        email: email,
                        phone: phone,
                      );
                    },
                  ),
                );
              },
              child: const Text('Fifth Screen'),
            ),
          ),
        ],
      ),
    );
  }
}

class FifthScreen extends StatelessWidget {
  final String? name, email, phone;
  FifthScreen({
     this.name,
    this.email,
     this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fifth Screen"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Name: ${Data.of(context).name}'),
          Text('Email: ${Data.of(context).email}'),
          Text('Phone: ${Data.of(context).phone}'),
        ]),
      ),
    );
  }
}
class Data extends InheritedWidget {

  final String name;
  final String email;
  final String  phone;
//  final Widget child;
 
 const Data({Key? key,required this.name,required this.phone,required this.email, required Widget child,})
      : super(key: key, child: child);

  static Data of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Data>()!);
  }

  @override
  bool updateShouldNotify(Data oldWidget) {
    return false;
   
  }
}
