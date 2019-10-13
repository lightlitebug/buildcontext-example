import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Context Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // _MyHomePageState() {
  //   print('my build context: ${context.hashCode}');
  // }
  @override
  void initState() {
    super.initState();

    // Future.delayed(Duration.zero).then((_) {
    //   final color = Theme.of(context).primaryColor;
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final color = Theme.of(context).primaryColor;
    print('build context in didChangeDependencies ${context.hashCode}');
  }

  void showMyDialog() {
    print('in showMyDialog, ${context.hashCode}');
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Alert'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('build context in build method: ${context.hashCode}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Context Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(),
          RaisedButton(
            child: Text('Show Dialog'),
            onPressed: () {
              showMyDialog();
            },
          ),
          Simple(),
        ],
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Floating Action Button Pressed'),
                ),
              );
            },
            tooltip: 'Show Snackbar',
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}

class Simple extends StatelessWidget {
  void showMyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Simple Alert'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Simple Button'),
      onPressed: () {
        showMyDialog(context);
      },
    );
  }
}
