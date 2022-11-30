// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_task_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDailyTaskDbCollection on Isar {
  IsarCollection<DailyTaskDb> get dailyTaskDbs => this.collection();
}

const DailyTaskDbSchema = CollectionSchema(
  name: r'DailyTaskDb',
  id: -4975505763418389571,
  properties: {
    r'dailyTaskType': PropertySchema(
      id: 0,
      name: r'dailyTaskType',
      type: IsarType.byte,
      enumMap: _DailyTaskDbdailyTaskTypeEnumValueMap,
    ),
    r'endDate': PropertySchema(
      id: 1,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'hoursInDay': PropertySchema(
      id: 2,
      name: r'hoursInDay',
      type: IsarType.double,
    ),
    r'initialDate': PropertySchema(
      id: 3,
      name: r'initialDate',
      type: IsarType.dateTime,
    ),
    r'neonColor': PropertySchema(
      id: 4,
      name: r'neonColor',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 5,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _dailyTaskDbEstimateSize,
  serialize: _dailyTaskDbSerialize,
  deserialize: _dailyTaskDbDeserialize,
  deserializeProp: _dailyTaskDbDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dailyTaskDbGetId,
  getLinks: _dailyTaskDbGetLinks,
  attach: _dailyTaskDbAttach,
  version: '3.0.5',
);

int _dailyTaskDbEstimateSize(
  DailyTaskDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.neonColor.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _dailyTaskDbSerialize(
  DailyTaskDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.dailyTaskType.index);
  writer.writeDateTime(offsets[1], object.endDate);
  writer.writeDouble(offsets[2], object.hoursInDay);
  writer.writeDateTime(offsets[3], object.initialDate);
  writer.writeString(offsets[4], object.neonColor);
  writer.writeString(offsets[5], object.title);
}

DailyTaskDb _dailyTaskDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyTaskDb(
    dailyTaskType: _DailyTaskDbdailyTaskTypeValueEnumMap[
            reader.readByteOrNull(offsets[0])] ??
        DailyTaskType.programing,
    endDate: reader.readDateTime(offsets[1]),
    hoursInDay: reader.readDouble(offsets[2]),
    initialDate: reader.readDateTime(offsets[3]),
    neonColor: reader.readString(offsets[4]),
    title: reader.readString(offsets[5]),
  );
  object.id = id;
  return object;
}

P _dailyTaskDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_DailyTaskDbdailyTaskTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          DailyTaskType.programing) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DailyTaskDbdailyTaskTypeEnumValueMap = {
  'programing': 0,
  'studying': 1,
  'work': 2,
};
const _DailyTaskDbdailyTaskTypeValueEnumMap = {
  0: DailyTaskType.programing,
  1: DailyTaskType.studying,
  2: DailyTaskType.work,
};

Id _dailyTaskDbGetId(DailyTaskDb object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dailyTaskDbGetLinks(DailyTaskDb object) {
  return [];
}

void _dailyTaskDbAttach(
    IsarCollection<dynamic> col, Id id, DailyTaskDb object) {
  object.id = id;
}

extension DailyTaskDbQueryWhereSort
    on QueryBuilder<DailyTaskDb, DailyTaskDb, QWhere> {
  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DailyTaskDbQueryWhere
    on QueryBuilder<DailyTaskDb, DailyTaskDb, QWhereClause> {
  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterWhereClause> idBetween(
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

extension DailyTaskDbQueryFilter
    on QueryBuilder<DailyTaskDb, DailyTaskDb, QFilterCondition> {
  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      dailyTaskTypeEqualTo(DailyTaskType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyTaskType',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      dailyTaskTypeGreaterThan(
    DailyTaskType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dailyTaskType',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      dailyTaskTypeLessThan(
    DailyTaskType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dailyTaskType',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      dailyTaskTypeBetween(
    DailyTaskType lower,
    DailyTaskType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dailyTaskType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition> endDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      endDateGreaterThan(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition> endDateLessThan(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition> endDateBetween(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      hoursInDayEqualTo(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      hoursInDayLessThan(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      hoursInDayBetween(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      initialDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'initialDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      initialDateLessThan(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      initialDateBetween(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      neonColorEqualTo(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      neonColorLessThan(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      neonColorBetween(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      neonColorStartsWith(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      neonColorEndsWith(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      neonColorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'neonColor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      neonColorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'neonColor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      neonColorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'neonColor',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      neonColorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'neonColor',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      titleGreaterThan(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition> titleContains(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition> titleMatches(
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

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension DailyTaskDbQueryObject
    on QueryBuilder<DailyTaskDb, DailyTaskDb, QFilterCondition> {}

extension DailyTaskDbQueryLinks
    on QueryBuilder<DailyTaskDb, DailyTaskDb, QFilterCondition> {}

extension DailyTaskDbQuerySortBy
    on QueryBuilder<DailyTaskDb, DailyTaskDb, QSortBy> {
  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> sortByDailyTaskType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyTaskType', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy>
      sortByDailyTaskTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyTaskType', Sort.desc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> sortByHoursInDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hoursInDay', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> sortByHoursInDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hoursInDay', Sort.desc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> sortByInitialDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialDate', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> sortByInitialDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialDate', Sort.desc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> sortByNeonColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'neonColor', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> sortByNeonColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'neonColor', Sort.desc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension DailyTaskDbQuerySortThenBy
    on QueryBuilder<DailyTaskDb, DailyTaskDb, QSortThenBy> {
  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> thenByDailyTaskType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyTaskType', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy>
      thenByDailyTaskTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyTaskType', Sort.desc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> thenByHoursInDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hoursInDay', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> thenByHoursInDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hoursInDay', Sort.desc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> thenByInitialDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialDate', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> thenByInitialDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialDate', Sort.desc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> thenByNeonColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'neonColor', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> thenByNeonColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'neonColor', Sort.desc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension DailyTaskDbQueryWhereDistinct
    on QueryBuilder<DailyTaskDb, DailyTaskDb, QDistinct> {
  QueryBuilder<DailyTaskDb, DailyTaskDb, QDistinct> distinctByDailyTaskType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyTaskType');
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QDistinct> distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QDistinct> distinctByHoursInDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hoursInDay');
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QDistinct> distinctByInitialDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'initialDate');
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QDistinct> distinctByNeonColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'neonColor', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskDb, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension DailyTaskDbQueryProperty
    on QueryBuilder<DailyTaskDb, DailyTaskDb, QQueryProperty> {
  QueryBuilder<DailyTaskDb, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DailyTaskDb, DailyTaskType, QQueryOperations>
      dailyTaskTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyTaskType');
    });
  }

  QueryBuilder<DailyTaskDb, DateTime, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<DailyTaskDb, double, QQueryOperations> hoursInDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hoursInDay');
    });
  }

  QueryBuilder<DailyTaskDb, DateTime, QQueryOperations> initialDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'initialDate');
    });
  }

  QueryBuilder<DailyTaskDb, String, QQueryOperations> neonColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'neonColor');
    });
  }

  QueryBuilder<DailyTaskDb, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
