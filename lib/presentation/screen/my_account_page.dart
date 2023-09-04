import 'package:fake_store_joao/core/themes/style.dart';
import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Meu Perfil"),
      ),
      body: Column(
        children: [
          for (int i = 0; i < 5; i++)
            ListTile(
                onTap: () {},
                title: Text(
                  "About $i",
                  style: Style.defaultTextStyle,
                ),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.chevron_right)))
        ],
      ),
    );
  }
}
