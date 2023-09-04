import 'package:fake_store_joao/presentation/commum_widgets/drawer_menu.dart';
import 'package:flutter/material.dart';

//this component is to wrap a standard scafold that has a drawer
class ScaffoldWithDrawe extends StatelessWidget {
  const ScaffoldWithDrawe({super.key, required this.body, this.appBar});

  final Widget body;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      key: scaffoldKey,
      appBar: appBar,
      drawer: const DrawerMenu(),
      body: body,
    );
  }
}
