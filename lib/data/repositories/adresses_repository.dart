import 'package:fake_store_joao/data/models/address.dart';
import 'package:fake_store_joao/database/db.dart';
import 'package:result_dart/result_dart.dart';

abstract class AddressesService {
  getAddress(int id);
  getListAddresses();
  postAddresses(Address address);
  putAddresses(Address address);
  deleteAdddresses(int id);
}

class AddressesRepository implements AddressesService {
  late int idUser;

  AddressesRepository(this.idUser);

  @override
  Future<Result<Address, String>> getAddress(int id) async {
    var db = await DB.instance.database;
    var address = await db.database
        .rawQuery('SELECT * FROM address WHERE id = $id AND idUser = $idUser'); // here after request here
    var addr = Address.fromMap(address.first);
    return Success(addr);
  }

  @override
  Future<Result<List<Address>, String>> getListAddresses() async {
    var db = await DB.instance.database;
    var listRetuns = await db.query("address", where: 'idUser = ?', whereArgs: [idUser]);

    List<Address> addresses = listRetuns.map((map) => Address.fromMap(map)).toList();

    return Success(addresses);
  }

  @override
  Future<Result<int, String>> deleteAdddresses(int id) async {
    try {
      var db = await DB.instance.database;
      int result = await db.delete("address", where: 'id = ? AND idUser = ?', whereArgs: [id, idUser]);
      return Success(result);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<int, String>> postAddresses(Address address) async {
    var db = await DB.instance.database;
    Map<String, Object?> newMap = {
      "idUser": idUser,
    };
    newMap.addAll(address.toMap());
    newMap.removeWhere((key, value) => key == "id"); // remove id address

    var idAddress = await db.insert("address", newMap);
    return Success(idAddress);
  }

  @override
  Future<Result<int, String>> putAddresses(Address address) async {
    try {
      var db = await DB.instance.database;
      Map<String, Object?> newMap = address.toMap();
      newMap.remove("id"); // Assuming id is not updatable
      int result = await db.update("address", newMap, where: 'id = ? AND idUser = ?', whereArgs: [address.id, idUser]);
      return Success(result);
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
