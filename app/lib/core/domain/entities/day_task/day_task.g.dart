// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_task.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDayTaskCollection on Isar {
  IsarCollection<DayTask> get dayTasks => this.collection();
}

const DayTaskSchema = CollectionSchema(
  name: r'DayTask',
  id: 5135669765479385792,
  properties: {
    r'day': PropertySchema(
      id: 0,
      name: r'day',
      type: IsarType.string,
    ),
    r'dayNumber': PropertySchema(
      id: 1,
      name: r'dayNumber',
      type: IsarType.long,
    )
  },
  estimateSize: _dayTaskEstimateSize,
  serialize: _dayTaskSerialize,
  deserialize: _dayTaskDeserialize,
  deserializeProp: _dayTaskDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'isarTasks': LinkSchema(
      id: -2400247536468003508,
      name: r'isarTasks',
      target: r'DailyTask',
      single: false,
    ),
    r'isarTypes': LinkSchema(
      id: 7822960879640391452,
      name: r'isarTypes',
      target: r'DailyTaskType',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _dayTaskGetId,
  getLinks: _dayTaskGetLinks,
  attach: _dayTaskAttach,
  version: '3.0.5',
);

int _dayTaskEstimateSize(
  DayTask object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.day.length * 3;
  return bytesCount;
}

void _dayTaskSerialize(
  DayTask object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.day);
  writer.writeLong(offsets[1], object.dayNumber);
}

DayTask _dayTaskDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DayTask(
    day: reader.readString(offsets[0]),
    dayNumber: reader.readLong(offsets[1]),
  );
  object.id = id;
  return object;
}

P _dayTaskDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dayTaskGetId(DayTask object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dayTaskGetLinks(DayTask object) {
  return [object.isarTasks, object.isarTypes];
}

void _dayTaskAttach(IsarCollection<dynamic> col, Id id, DayTask object) {
  object.id = id;
  object.isarTasks
      .attach(col, col.isar.collection<DailyTask>(), r'isarTasks', id);
  object.isarTypes
      .attach(col, col.isar.collection<DailyTaskType>(), r'isarTypes', id);
}

extension DayTaskQueryWhereSort on QueryBuilder<DayTask, DayTask, QWhere> {
  QueryBuilder<DayTask, DayTask, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DayTaskQueryWhere on QueryBuilder<DayTask, DayTask, QWhereClause> {
  QueryBuilder<DayTask, DayTask, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DayTaskQueryFilter
    on QueryBuilder<DayTask, DayTask, QFilterCondition> {
  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> dayEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> dayGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> dayLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> dayBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'day',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> dayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> dayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> dayContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> dayMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'day',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> dayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day',
        value: '',
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> dayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'day',
        value: '',
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> dayNumberEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> dayNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dayNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> dayNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dayNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> dayNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dayNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DayTaskQueryObject
    on QueryBuilder<DayTask, DayTask, QFilterCondition> {}

extension DayTaskQueryLinks
    on QueryBuilder<DayTask, DayTask, QFilterCondition> {
  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> isarTasks(
      FilterQuery<DailyTask> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'isarTasks');
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> isarTasksLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarTasks', length, true, length, true);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> isarTasksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarTasks', 0, true, 0, true);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> isarTasksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarTasks', 0, false, 999999, true);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> isarTasksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarTasks', 0, true, length, include);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition>
      isarTasksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarTasks', length, include, 999999, true);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> isarTasksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'isarTasks', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> isarTypes(
      FilterQuery<DailyTaskType> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'isarTypes');
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> isarTypesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarTypes', length, true, length, true);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> isarTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarTypes', 0, true, 0, true);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> isarTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarTypes', 0, false, 999999, true);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> isarTypesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarTypes', 0, true, length, include);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition>
      isarTypesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarTypes', length, include, 999999, true);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterFilterCondition> isarTypesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'isarTypes', lower, includeLower, upper, includeUpper);
    });
  }
}

extension DayTaskQuerySortBy on QueryBuilder<DayTask, DayTask, QSortBy> {
  QueryBuilder<DayTask, DayTask, QAfterSortBy> sortByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.asc);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterSortBy> sortByDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.desc);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterSortBy> sortByDayNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayNumber', Sort.asc);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterSortBy> sortByDayNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayNumber', Sort.desc);
    });
  }
}

extension DayTaskQuerySortThenBy
    on QueryBuilder<DayTask, DayTask, QSortThenBy> {
  QueryBuilder<DayTask, DayTask, QAfterSortBy> thenByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.asc);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterSortBy> thenByDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.desc);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterSortBy> thenByDayNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayNumber', Sort.asc);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterSortBy> thenByDayNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayNumber', Sort.desc);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DayTask, DayTask, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension DayTaskQueryWhereDistinct
    on QueryBuilder<DayTask, DayTask, QDistinct> {
  QueryBuilder<DayTask, DayTask, QDistinct> distinctByDay(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'day', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DayTask, DayTask, QDistinct> distinctByDayNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dayNumber');
    });
  }
}

extension DayTaskQueryProperty
    on QueryBuilder<DayTask, DayTask, QQueryProperty> {
  QueryBuilder<DayTask, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DayTask, String, QQueryOperations> dayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'day');
    });
  }

  QueryBuilder<DayTask, int, QQueryOperations> dayNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dayNumber');
    });
  }
}
