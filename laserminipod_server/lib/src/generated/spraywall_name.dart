/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class SpraywallName
    implements _i1.TableRow, _i1.ProtocolSerialization {
  SpraywallName._({
    this.id,
    required this.name,
  });

  factory SpraywallName({
    int? id,
    required String name,
  }) = _SpraywallNameImpl;

  factory SpraywallName.fromJson(Map<String, dynamic> jsonSerialization) {
    return SpraywallName(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
    );
  }

  static final t = SpraywallNameTable();

  static const db = SpraywallNameRepository._();

  @override
  int? id;

  String name;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [SpraywallName]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SpraywallName copyWith({
    int? id,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
    };
  }

  static SpraywallNameInclude include() {
    return SpraywallNameInclude._();
  }

  static SpraywallNameIncludeList includeList({
    _i1.WhereExpressionBuilder<SpraywallNameTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SpraywallNameTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SpraywallNameTable>? orderByList,
    SpraywallNameInclude? include,
  }) {
    return SpraywallNameIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SpraywallName.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SpraywallName.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SpraywallNameImpl extends SpraywallName {
  _SpraywallNameImpl({
    int? id,
    required String name,
  }) : super._(
          id: id,
          name: name,
        );

  /// Returns a shallow copy of this [SpraywallName]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SpraywallName copyWith({
    Object? id = _Undefined,
    String? name,
  }) {
    return SpraywallName(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
    );
  }
}

class SpraywallNameTable extends _i1.Table {
  SpraywallNameTable({super.tableRelation})
      : super(tableName: 'spraywall_name') {
    name = _i1.ColumnString(
      'name',
      this,
    );
  }

  late final _i1.ColumnString name;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
      ];
}

class SpraywallNameInclude extends _i1.IncludeObject {
  SpraywallNameInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => SpraywallName.t;
}

class SpraywallNameIncludeList extends _i1.IncludeList {
  SpraywallNameIncludeList._({
    _i1.WhereExpressionBuilder<SpraywallNameTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SpraywallName.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => SpraywallName.t;
}

class SpraywallNameRepository {
  const SpraywallNameRepository._();

  /// Returns a list of [SpraywallName]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<SpraywallName>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SpraywallNameTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SpraywallNameTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SpraywallNameTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<SpraywallName>(
      where: where?.call(SpraywallName.t),
      orderBy: orderBy?.call(SpraywallName.t),
      orderByList: orderByList?.call(SpraywallName.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [SpraywallName] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<SpraywallName?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SpraywallNameTable>? where,
    int? offset,
    _i1.OrderByBuilder<SpraywallNameTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SpraywallNameTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<SpraywallName>(
      where: where?.call(SpraywallName.t),
      orderBy: orderBy?.call(SpraywallName.t),
      orderByList: orderByList?.call(SpraywallName.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [SpraywallName] by its [id] or null if no such row exists.
  Future<SpraywallName?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<SpraywallName>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [SpraywallName]s in the list and returns the inserted rows.
  ///
  /// The returned [SpraywallName]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SpraywallName>> insert(
    _i1.Session session,
    List<SpraywallName> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SpraywallName>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SpraywallName] and returns the inserted row.
  ///
  /// The returned [SpraywallName] will have its `id` field set.
  Future<SpraywallName> insertRow(
    _i1.Session session,
    SpraywallName row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SpraywallName>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SpraywallName]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SpraywallName>> update(
    _i1.Session session,
    List<SpraywallName> rows, {
    _i1.ColumnSelections<SpraywallNameTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SpraywallName>(
      rows,
      columns: columns?.call(SpraywallName.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SpraywallName]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SpraywallName> updateRow(
    _i1.Session session,
    SpraywallName row, {
    _i1.ColumnSelections<SpraywallNameTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SpraywallName>(
      row,
      columns: columns?.call(SpraywallName.t),
      transaction: transaction,
    );
  }

  /// Deletes all [SpraywallName]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SpraywallName>> delete(
    _i1.Session session,
    List<SpraywallName> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SpraywallName>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SpraywallName].
  Future<SpraywallName> deleteRow(
    _i1.Session session,
    SpraywallName row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SpraywallName>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SpraywallName>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SpraywallNameTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SpraywallName>(
      where: where(SpraywallName.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SpraywallNameTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SpraywallName>(
      where: where?.call(SpraywallName.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
