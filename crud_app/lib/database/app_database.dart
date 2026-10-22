import 'package:crud_app/models/product.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

@DataClassName('ProductEntry')
class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get imageUrl => text()();
  RealColumn get price => real()();
  TextColumn get description => text()();
}

@DriftDatabase(tables: [Products])
class AppDatabase extends _$AppDatabase {
  AppDatabase._internal([QueryExecutor? excutor])
    : super(excutor ?? _openConnection());

  static final AppDatabase instance = AppDatabase._internal();

  factory AppDatabase([QueryExecutor? excutor]) {
    if (excutor != null) {
      return AppDatabase._internal(excutor);
    }
    return instance;
  }

  @override
  int get schemaVersion => 1;

  Stream<List<Product>> watchAllProducts() {
    return select(products).watch().map((entries) {
      return entries
          .map(
            (entry) => Product(
              id: entry.id,
              name: entry.name,
              imageUrl: entry.imageUrl,
              price: entry.price,
              description: entry.description,
            ),
          )
          .toList();
    });
  }

  Future<List<Product>> getAllProducts() async {
    final entries = await select(products).get();

    return entries
        .map(
          (entry) => Product(
            id: entry.id,
            name: entry.name,
            imageUrl: entry.imageUrl,
            price: entry.price,
            description: entry.description,
          ),
        )
        .toList();
  }

  Future<int> insertProduct(Product product) {
    return into(products).insert(
      ProductsCompanion.insert(
        name: product.name,
        imageUrl: product.imageUrl,
        price: product.price,
        description: product.description,
      ),
    );
  }

  Future<bool> updateProducts(Product product) {
    if (product.id == null) return Future.value(false);

    return update(products).replace(
      ProductEntry(
        id: product.id!,
        name: product.name,
        imageUrl: product.imageUrl,
        price: product.price,
        description: product.description,
      ),
    );
  }

  Future<int> deleteProduct(int id) {
    return (delete(products)..where((pr) => pr.id.equals(id))).go();
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'crud_app_db');
  }
}
