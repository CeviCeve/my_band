// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proficiency_level_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ProficiencyLevelSchema = Schema(
  name: r'ProficiencyLevel',
  id: -4966019454517164078,
  properties: {
    r'instrument': PropertySchema(
      id: 0,
      name: r'instrument',
      type: IsarType.byte,
      enumMap: _ProficiencyLevelinstrumentEnumValueMap,
    ),
    r'level': PropertySchema(
      id: 1,
      name: r'level',
      type: IsarType.byte,
      enumMap: _ProficiencyLevellevelEnumValueMap,
    )
  },
  estimateSize: _proficiencyLevelEstimateSize,
  serialize: _proficiencyLevelSerialize,
  deserialize: _proficiencyLevelDeserialize,
  deserializeProp: _proficiencyLevelDeserializeProp,
);

int _proficiencyLevelEstimateSize(
  ProficiencyLevel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _proficiencyLevelSerialize(
  ProficiencyLevel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.instrument.index);
  writer.writeByte(offsets[1], object.level.index);
}

ProficiencyLevel _proficiencyLevelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProficiencyLevel();
  object.instrument = _ProficiencyLevelinstrumentValueEnumMap[
          reader.readByteOrNull(offsets[0])] ??
      Instruments.bassoon;
  object.level =
      _ProficiencyLevellevelValueEnumMap[reader.readByteOrNull(offsets[1])] ??
          Proficiency.Beginner;
  return object;
}

P _proficiencyLevelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_ProficiencyLevelinstrumentValueEnumMap[
              reader.readByteOrNull(offset)] ??
          Instruments.bassoon) as P;
    case 1:
      return (_ProficiencyLevellevelValueEnumMap[
              reader.readByteOrNull(offset)] ??
          Proficiency.Beginner) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ProficiencyLevelinstrumentEnumValueMap = {
  'bassoon': 0,
  'bassetHorn': 1,
  'contrabassClarinet': 2,
  'flugelhorn': 3,
  'frenchHorn': 4,
  'oboe': 5,
};
const _ProficiencyLevelinstrumentValueEnumMap = {
  0: Instruments.bassoon,
  1: Instruments.bassetHorn,
  2: Instruments.contrabassClarinet,
  3: Instruments.flugelhorn,
  4: Instruments.frenchHorn,
  5: Instruments.oboe,
};
const _ProficiencyLevellevelEnumValueMap = {
  'Beginner': 0,
  'Elementary': 1,
  'Intermediate': 2,
  'UpperIntermediate': 3,
  'Advanced': 4,
  'Professional': 5,
};
const _ProficiencyLevellevelValueEnumMap = {
  0: Proficiency.Beginner,
  1: Proficiency.Elementary,
  2: Proficiency.Intermediate,
  3: Proficiency.UpperIntermediate,
  4: Proficiency.Advanced,
  5: Proficiency.Professional,
};

extension ProficiencyLevelQueryFilter
    on QueryBuilder<ProficiencyLevel, ProficiencyLevel, QFilterCondition> {
  QueryBuilder<ProficiencyLevel, ProficiencyLevel, QAfterFilterCondition>
      instrumentEqualTo(Instruments value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instrument',
        value: value,
      ));
    });
  }

  QueryBuilder<ProficiencyLevel, ProficiencyLevel, QAfterFilterCondition>
      instrumentGreaterThan(
    Instruments value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instrument',
        value: value,
      ));
    });
  }

  QueryBuilder<ProficiencyLevel, ProficiencyLevel, QAfterFilterCondition>
      instrumentLessThan(
    Instruments value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instrument',
        value: value,
      ));
    });
  }

  QueryBuilder<ProficiencyLevel, ProficiencyLevel, QAfterFilterCondition>
      instrumentBetween(
    Instruments lower,
    Instruments upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instrument',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProficiencyLevel, ProficiencyLevel, QAfterFilterCondition>
      levelEqualTo(Proficiency value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<ProficiencyLevel, ProficiencyLevel, QAfterFilterCondition>
      levelGreaterThan(
    Proficiency value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<ProficiencyLevel, ProficiencyLevel, QAfterFilterCondition>
      levelLessThan(
    Proficiency value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<ProficiencyLevel, ProficiencyLevel, QAfterFilterCondition>
      levelBetween(
    Proficiency lower,
    Proficiency upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'level',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProficiencyLevelQueryObject
    on QueryBuilder<ProficiencyLevel, ProficiencyLevel, QFilterCondition> {}
