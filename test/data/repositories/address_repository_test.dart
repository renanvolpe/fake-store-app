

// class MockDatabase extends Mock implements Database {}

// void main() async {
//   Database database;
//   // Initialize FFI
//   sqfliteFfiInit();
//   // Change the default factory for unit testing calls for SQFlite
//   databaseFactory = databaseFactoryFfi;
//   databaseFactory.openDatabase(join(await getDatabasesPath(), "store.db"));
//   database = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);

//   group("Groupt of test of user endpoint", () {
    
//     AddressesRepository localAddress = AddressesRepository(database);
//     late String tokenUser;
//     test("get address", () async {
//       var response = await localAddress.getAddress();

//       response.onSuccess((success) => tokenUser = success);

//       expect(response, isA<List>());
//     });

//     // test("get user s profile ", () async {
//     //   var response = await apiAuth.getProfile(tokenUser);

//     //   expect(response, isA<Success>());
//     // });
//   });
// }
