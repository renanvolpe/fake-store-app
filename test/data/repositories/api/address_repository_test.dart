import 'package:fake_store_joao/data/models/address.dart';
import 'package:fake_store_joao/data/repositories/adresses_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:result_dart/result_dart.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  group("Groupt of test of user endpoint", () {
    AddressesRepository localAddress = AddressesRepository(50);
    late int idSuccess;
    test("test post address", () async {
      var response = await localAddress.postAddresses(Address.empty());

      response.onSuccess((success) => idSuccess = success);

      expect(response, isA<Success>());
    });

    // test("description", () => database.delete("address"));

    test("test get list addresses", () async {
      var response = await localAddress.getListAddresses();

      expect(response, isA<Success>());
    });

    test("test get address", () async {
      var response = await localAddress.getAddress(idSuccess);

      expect(response, isA<Success>());
    });

    test("test update address", () async {
      var newAdd = Address.empty();
      newAdd.city = "cidade diferente";
      var response = await localAddress.putAddresses(newAdd);

      expect(response, isA<Success>());
    });

    test("test get address", () async {
      var response = await localAddress.deleteAdddresses(idSuccess);

      expect(response, isA<Success>());
    });
  });
}
