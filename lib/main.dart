import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom sheet',
      home: BottomSheetExample(),
    );
  }
}

class BottomSheetExample extends StatefulWidget {
  const BottomSheetExample({Key? key}) : super(key: key);

  @override
  State<BottomSheetExample> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheetExample> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.up,
          children: [
            ElevatedButton(
                onPressed: () => _scaffoldKey.currentState
                    ?.showBottomSheet((context) => _buildBottomSheet(context)),
                child: const Text("Show bottom sheet")),
            ElevatedButton(
                onPressed: () => showModalBottomSheet(
                    context: context, builder: (ctx) => _buildBottomSheet(ctx)),
                child: const Text('Show modal bottom sheet'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Fluttertoast.showToast(msg: 'Floating bottom action'),
        child: const Icon(Icons.add),
      ),
    );
  }

  Container _buildBottomSheet(BuildContext context) {
    return Container(
      height: 300.0,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(8.0)),
      child: ListView(
        children: [
          const Text('Bottom Sheet'),
          const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.attach_money),
                labelText: 'Enter integer'),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.save),
                label: const Text('Save and close')),
          )
        ],
      ),
    );
  }
}
