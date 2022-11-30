// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_task.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDailyTaskCollection on Isar {
  IsarCollection<DailyTask> get dailyTasks => this.collection();
}

const DailyTaskSchema = CollectionSchema(
  name: r'DailyTask',
  id: -233896565239787639,
  properties: {
    r'endDate': PropertySchema(
      id: 0,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'hoursInDay': PropertySchema(
      id: 1,
      name: r'hoursInDay',
      type: IsarType.double,
    ),
    r'initialDate': PropertySchema(
      id: 2,
      name: r'initialDate',
      type: IsarType.dateTime,
    ),
    r'neonColor': PropertySchema(
      id: 3,
      name: r'neonColor',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 4,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _dailyTaskEstimateSize,
  serialize: _dailyTaskSerialize,
  deserialize: _dailyTaskDeserialize,
  deserializeProp: _dailyTaskDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'type': LinkSchema(
      id: -605064033064957206,
      name: r'type',
      target: r'DailyTaskType',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _dailyTaskGetId,
  getLinks: _dailyTaskGetLinks,
  attach: _dailyTaskAttach,
  version: '3.0.5',
);

int _dailyTaskEstimateSize(
  DailyTask object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.neonColor.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _dailyTaskSerialize(
  DailyTask object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.endDate);
  writer.writeDouble(offsets[1], object.hoursInDay);
  writer.writeDateTime(offsets[2], object.initialDate);
  writer.writeString(offsets[3], object.neonColor);
  writer.writeString(offsets[4], object.title);
}

DailyTask _dailyTaskDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyTask(
    endDate: reader.readDateTime(offsets[0]),
    hoursInDay: reader.readDouble(offsets[1]),
    initialDate: reader.readDateTime(offsets[2]),
    neonColor: reader.readString(offsets[3]),
    title: reader.readString(offsets[4]),
  );
  object.id = id;
  return object;
}

P _dailyTaskDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dailyTaskGetId(DailyTask object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dailyTaskGetLinks(DailyTask object) {
  return [object.type];
}

void _dailyTaskAttach(IsarCollection<dynamic> col, Id id, DailyTask object) {
  object.id = id;
  object.type.attach(col, col.isar.collection<DailyTaskType>(), r'type', id);
}

extension DailyTaskQueryWhereSort
    on QueryBuilder<DailyTask, DailyTask, QWhere> {
  QueryBuilder<DailyTask, DailyTask, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DailyTaskQueryWhere
    on QueryBuilder<DailyTask, DailyTask, QWhereClause> {
  QueryBuilder<DailyTask, DailyTask, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<DailyTask, DailyTask, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterWhereClause> idBetween(
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

extension DailyTaskQueryFilter
    on QueryBuilder<DailyTask, DailyTask, QFilterCondition> {
  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> endDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> endDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> endDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> endDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> hoursInDayEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hoursInDay',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition>
      hoursInDayGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hoursInDay',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> hoursInDayLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hoursInDay',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> hoursInDayBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hoursInDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> initialDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'initialDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition>
      initialDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'initialDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> initialDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'initialDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> initialDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'initialDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> neonColorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'neonColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition>
      neonColorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'neonColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> neonColorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'neonColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> neonColorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'neonColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> neonColorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'neonColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> neonColorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'neonColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> neonColorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'neonColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> neonColorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'neonColor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> neonColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'neonColor',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition>
      neonColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'neonColor',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension DailyTaskQueryObject
    on QueryBuilder<DailyTask, DailyTask, QFilterCondition> {}

extension DailyTaskQueryLinks
    on QueryBuilder<DailyTask, DailyTask, QFilterCondition> {
  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> type(
      FilterQuery<DailyTaskType> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'type');
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'type', 0, true, 0, true);
    });
  }
}

extension DailyTaskQuerySortBy on QueryBuilder<DailyTask, DailyTask, QSortBy> {
  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> sortByHoursInDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hoursInDay', Sort.asc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> sortByHoursInDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hoursInDay', Sort.desc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> sortByInitialDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialDate', Sort.asc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> sortByInitialDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialDate', Sort.desc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> sortByNeonColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'neonColor', Sort.asc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> sortByNeonColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'neonColor', Sort.desc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension DailyTaskQuerySortThenBy
    on QueryBuilder<DailyTask, DailyTask, QSortThenBy> {
  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> thenByHoursInDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hoursInDay', Sort.asc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> thenByHoursInDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hoursInDay', Sort.desc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> thenByInitialDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialDate', Sort.asc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> thenByInitialDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialDate', Sort.desc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> thenByNeonColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'neonColor', Sort.asc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> thenByNeonColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'neonColor', Sort.desc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension DailyTaskQueryWhereDistinct
    on QueryBuilder<DailyTask, DailyTask, QDistinct> {
  QueryBuilder<DailyTask, DailyTask, QDistinct> distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<DailyTask, DailyTask, QDistinct> distinctByHoursInDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hoursInDay');
    });
  }

  QueryBuilder<DailyTask, DailyTask, QDistinct> distinctByInitialDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'initialDate');
    });
  }

  QueryBuilder<DailyTask, DailyTask, QDistinct> distinctByNeonColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'neonColor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyTask, DailyTask, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension DailyTaskQueryProperty
    on QueryBuilder<DailyTask, DailyTask, QQueryProperty> {
  QueryBuilder<DailyTask, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DailyTask, DateTime, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<DailyTask, double, QQueryOperations> hoursInDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hoursInDay');
    });
  }

  QueryBuilder<DailyTask, DateTime, QQueryOperations> initialDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'initialDate');
    });
  }

  QueryBuilder<DailyTask, String, QQueryOperations> neonColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'neonColor');
    });
  }

  QueryBuilder<DailyTask, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
