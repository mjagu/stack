import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title , Key? key}) : super(key: key);

  final String title ;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0 ;
  void _incrementCounter(){
    setState(() {
      _counter ++ ;
    });
  }
  void _decrementCounter(){
    setState(() {
      _counter -- ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: const [
          Icon(Icons.search,size: 32,
          ),
        ],
      ),
      body: myStack(),
      drawer: myDrawer(),
      floatingActionButton: myFloatingActionButton(),
      bottomNavigationBar: myBottomNavigationBar(),
    );
  }

  Widget myStack(){
    return Column(
      children: [
        Flexible(
            flex: 7,
            fit: FlexFit.tight,
            child: Container(
          decoration: const BoxDecoration(
            boxShadow: [BoxShadow(
                offset: Offset(20,20),
                blurRadius: 10,
            color: Colors.deepOrange
            ),
            ],
          ),
              child: Stack(
                children:   [
                  const Image(
                      image: AssetImage(
                    'assets/images/mani.jpg'
                  ),
                  ),

                  Container(
                    decoration:  const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent
                          ,Colors.red],
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        stops: [0.4,1]
                      ),
                    ),
                  ),


                  const Positioned(
                      bottom: 20,
                      left: 40,
                      child: Text(
                    'Imran Nazeer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  ),
                ],
              ),
        ),
        ),
        Flexible(
            flex: 3,
            child: Container(
          color: Colors.amber,
        ),
        ),
      ],
    );
  }



  Widget myFloatingActionButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
            onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add,size: 24,),
        ),
        FloatingActionButton(
          onPressed: _decrementCounter,
          tooltip: 'Decrement',
          child: const Icon(Icons.remove,size: 24,),
        ),
      ],
    );
  }

  Widget myBottomNavigationBar(){
    return SizedBox(
      height: 70,
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home Page'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance),label: 'My Account'),
          BottomNavigationBarItem(icon: Icon(Icons.delete),label: 'Delete Data'),
      ],
      ),
    );
  }

  Widget myDrawer(){
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.amber,
            child: const DrawerHeader(
                child: Center(
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: ListTile(
              leading: Icon(Icons.account_balance,size: 24,),
              title: Text('My Account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),
              trailing: Icon(Icons.delete,size: 24,),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: ListTile(
              leading: Icon(Icons.work_sharp,size: 24,),
              title: Text('Work Sharp Time',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),
              trailing: Icon(Icons.delete,size: 24,),
            ),
          ),
        ],
      ),
    );
  }

}
