import 'package:fake_store_joao/core/themes/style.dart';
import 'package:fake_store_joao/presentation/commum_widgets/resumed_sizedbox.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cadastre-se para nova conta"),
      ),
      body: Column(
        children: [
          15.sizeH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(alignment: Alignment.center, children: [
                const CircleAvatar(radius: 55),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50)),
                        padding: const EdgeInsets.all(5),
                        child: const Icon(
                          Icons.edit,
                          size: 20,
                          color: Colors.white,
                        )))
              ])
            ],
          ),
          15.sizeH,
          for (int i = 0; i < 5; i++)
            ListTile(
                onTap: () {},
                title: Text(
                  "About $i",
                  style: Style.defaultTextStyle,
                ),
                trailing: const Icon(Icons.chevron_right))
        ],
      ),
    );
  }
}
