import 'package:flutter/material.dart';
import 'package:hellow_flutter/second.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MainPage(),
    );
  }
}

//内容
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

//内容状态
class MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  String title = "title";
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        title = "Home";
      } else if (_selectedIndex == 1) {
        title = "Business";
      } else {
        title = "School";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(title),
      body: () {
        if (_selectedIndex == 0) {
          return HomeBody();
        } else if (_selectedIndex == 1) {
          return BusinessBody();
        } else {
          return SchoolBody();
        }
      }(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

//标题
class HomeAppBar extends AppBar {
  String barTitle;

  HomeAppBar(this.barTitle);

  @override
  Key get key => new Key("KEY_APPBAR_HOME_PAGE");

  @override
  Widget get title => new Text(barTitle);

  @override
  bool get centerTitle => true;
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      Image(image: new AssetImage("images/img_girl.jpg")),
      Image(image: new AssetImage("images/img_girl.jpg")),
//      CachedNetworkImage(imageUrl: "")
    ]);
  }
}

class BusinessBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: 128,
      itemBuilder: (context, index) {
        return new ListTile(
          title: new GestureDetector(
            child: new Text("这是第${index + 1}个"),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new SecondPage("${index + 1}")));
            },
          ),
        );
      },
    );
  }
}

class SchoolBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GridView.count(
        crossAxisCount: 3, //3列
        children: List.generate(40, (i) {
          return Card(
            child: new GestureDetector(
              child: new Text("这是第${i + 1}个"),
              onTap: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new SecondPage("${i + 1}")));
              },
            ),
          );
        }));
  }
}

class Todo {
  String titles;

  Todo(this.titles);
}
