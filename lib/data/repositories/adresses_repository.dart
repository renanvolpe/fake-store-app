import 'package:fake_store_joao/data/models/address.dart';
import 'package:fake_store_joao/database/db.dart';
import 'package:sqflite/sqflite.dart';

abstract class AddressesService {
  getAddress();
  getListAddresses();
  postAddresses();
  putAddresses();
  deleteAdddresses();
}

class AddressesRepository implements AddressesService {
  late Database db;

  AddressesRepository(this.db);

  @override
  getAddress() async {
    db = await DB.instance.database;
    var listRetuns = await db.query("address");
    print(listRetuns);
    var listAddresses = [];
    for (var element in listRetuns) {
      listAddresses.add(Address.fromMap(element));
    }
    return listAddresses;
  }

  @override
  getListAddresses() {
    // TODO: implement getListAddresses
    throw UnimplementedError();
  }

  @override
  deleteAdddresses() {
    // TODO: implement deleteAdddresses
    throw UnimplementedError();
  }

  @override
  postAddresses() async {
    db = await DB.instance.database;
    // street TEXT,
    // district TEXT,
    // num TEXT,
    // city TEXT,
    // state TEXT,
    // complement TEXT
    var listAddresses = await db.insert("address", {
      "street": "street test2",
      "district": "district test2",
      "num": "num test2",
      "city": "city test2",
      "state": "state test2",
      "complement": "complement test2",
    });
    print(listAddresses);
  }

  @override
  putAddresses() {
    // TODO: implement putAddresses
    throw UnimplementedError();
  }
}
