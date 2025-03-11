// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instrument_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const InstrumentSchema = Schema(
  name: r'Instrument',
  id: 5927454867760510683,
  properties: {
    r'about': PropertySchema(
      id: 0,
      name: r'about',
      type: IsarType.string,
    ),
    r'instrumentPhoto': PropertySchema(
      id: 1,
      name: r'instrumentPhoto',
      type: IsarType.stringList,
    ),
    r'manufacturer': PropertySchema(
      id: 2,
      name: r'manufacturer',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'possessionTime': PropertySchema(
      id: 4,
      name: r'possessionTime',
      type: IsarType.string,
    ),
    r'proficiencyLevel': PropertySchema(
      id: 5,
      name: r'proficiencyLevel',
      type: IsarType.byte,
      enumMap: _InstrumentproficiencyLevelEnumValueMap,
    ),
    r'type': PropertySchema(
      id: 6,
      name: r'type',
      type: IsarType.byte,
      enumMap: _InstrumenttypeEnumValueMap,
    )
  },
  estimateSize: _instrumentEstimateSize,
  serialize: _instrumentSerialize,
  deserialize: _instrumentDeserialize,
  deserializeProp: _instrumentDeserializeProp,
);

int _instrumentEstimateSize(
  Instrument object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.about;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.instrumentPhoto;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.manufacturer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.possessionTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _instrumentSerialize(
  Instrument object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.about);
  writer.writeStringList(offsets[1], object.instrumentPhoto);
  writer.writeString(offsets[2], object.manufacturer);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.possessionTime);
  writer.writeByte(offsets[5], object.proficiencyLevel.index);
  writer.writeByte(offsets[6], object.type.index);
}

Instrument _instrumentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Instrument();
  object.about = reader.readStringOrNull(offsets[0]);
  object.instrumentPhoto = reader.readStringList(offsets[1]);
  object.manufacturer = reader.readStringOrNull(offsets[2]);
  object.name = reader.readString(offsets[3]);
  object.possessionTime = reader.readStringOrNull(offsets[4]);
  object.proficiencyLevel = _InstrumentproficiencyLevelValueEnumMap[
          reader.readByteOrNull(offsets[5])] ??
      Proficiency.Beginner;
  object.type =
      _InstrumenttypeValueEnumMap[reader.readByteOrNull(offsets[6])] ??
          Instruments.acousticGuitar;
  return object;
}

P _instrumentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringList(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (_InstrumentproficiencyLevelValueEnumMap[
              reader.readByteOrNull(offset)] ??
          Proficiency.Beginner) as P;
    case 6:
      return (_InstrumenttypeValueEnumMap[reader.readByteOrNull(offset)] ??
          Instruments.acousticGuitar) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _InstrumentproficiencyLevelEnumValueMap = {
  'Beginner': 0,
  'Elementary': 1,
  'Intermediate': 2,
  'UpperIntermediate': 3,
  'Advanced': 4,
  'Professional': 5,
};
const _InstrumentproficiencyLevelValueEnumMap = {
  0: Proficiency.Beginner,
  1: Proficiency.Elementary,
  2: Proficiency.Intermediate,
  3: Proficiency.UpperIntermediate,
  4: Proficiency.Advanced,
  5: Proficiency.Professional,
};
const _InstrumenttypeEnumValueMap = {
  'acousticGuitar': 0,
  'classicalGuitar': 1,
  'eightStringElectricGuitar': 2,
  'fretlessBassGuitar': 3,
  'fiveStringBassGuitar': 4,
  'fourStringBassGuitar': 5,
  'lapSteelGuitar': 6,
  'octaveMandolin': 7,
  'pedalSteelGuitar': 8,
  'resonatorGuitar': 9,
  'sevenStringAcousticGuitar': 10,
  'sixStringElectricGuitar': 11,
  'ukulele': 12,
  'altoSaxophone': 13,
  'baritoneSaxophone': 14,
  'bassTrombone': 15,
  'bassoon': 16,
  'bassetHorn': 17,
  'contrabassClarinet': 18,
  'flugelhorn': 19,
  'frenchHorn': 20,
  'oboe': 21,
  'piccoloTrumpet': 22,
  'sopranoClarinet': 23,
  'sopranoSaxophone': 24,
  'tenorSaxophone': 25,
  'trombone': 26,
  'trumpet': 27,
  'tuba': 28,
  'accordion': 29,
  'bandoneon': 30,
  'grandPiano': 31,
  'harpsichord': 32,
  'modularSynthesizer': 33,
  'organ': 34,
  'piano': 35,
  'synthesizer': 36,
  'electricPiano': 37,
  'drumKit': 38,
  'hang': 39,
  'marimba': 40,
  'vibraphone': 41,
  'xylophone': 42,
  'cello': 43,
  'doubleBass': 44,
  'electricHarp': 45,
  'electricViolin': 46,
  'guzheng': 47,
  'harp': 48,
  'koto': 49,
  'shamisen': 50,
  'sitar': 51,
  'violin': 52,
  'bagpipes': 53,
  'didgeridoo': 54,
  'gusli': 55,
  'panFlute': 56,
  'beatboxing': 57,
  'vocalAlto': 58,
  'vocalBass': 59,
  'vocalGrowlingScreaming': 60,
  'vocalSoprano': 61,
  'vocalTenor': 62,
};
const _InstrumenttypeValueEnumMap = {
  0: Instruments.acousticGuitar,
  1: Instruments.classicalGuitar,
  2: Instruments.eightStringElectricGuitar,
  3: Instruments.fretlessBassGuitar,
  4: Instruments.fiveStringBassGuitar,
  5: Instruments.fourStringBassGuitar,
  6: Instruments.lapSteelGuitar,
  7: Instruments.octaveMandolin,
  8: Instruments.pedalSteelGuitar,
  9: Instruments.resonatorGuitar,
  10: Instruments.sevenStringAcousticGuitar,
  11: Instruments.sixStringElectricGuitar,
  12: Instruments.ukulele,
  13: Instruments.altoSaxophone,
  14: Instruments.baritoneSaxophone,
  15: Instruments.bassTrombone,
  16: Instruments.bassoon,
  17: Instruments.bassetHorn,
  18: Instruments.contrabassClarinet,
  19: Instruments.flugelhorn,
  20: Instruments.frenchHorn,
  21: Instruments.oboe,
  22: Instruments.piccoloTrumpet,
  23: Instruments.sopranoClarinet,
  24: Instruments.sopranoSaxophone,
  25: Instruments.tenorSaxophone,
  26: Instruments.trombone,
  27: Instruments.trumpet,
  28: Instruments.tuba,
  29: Instruments.accordion,
  30: Instruments.bandoneon,
  31: Instruments.grandPiano,
  32: Instruments.harpsichord,
  33: Instruments.modularSynthesizer,
  34: Instruments.organ,
  35: Instruments.piano,
  36: Instruments.synthesizer,
  37: Instruments.electricPiano,
  38: Instruments.drumKit,
  39: Instruments.hang,
  40: Instruments.marimba,
  41: Instruments.vibraphone,
  42: Instruments.xylophone,
  43: Instruments.cello,
  44: Instruments.doubleBass,
  45: Instruments.electricHarp,
  46: Instruments.electricViolin,
  47: Instruments.guzheng,
  48: Instruments.harp,
  49: Instruments.koto,
  50: Instruments.shamisen,
  51: Instruments.sitar,
  52: Instruments.violin,
  53: Instruments.bagpipes,
  54: Instruments.didgeridoo,
  55: Instruments.gusli,
  56: Instruments.panFlute,
  57: Instruments.beatboxing,
  58: Instruments.vocalAlto,
  59: Instruments.vocalBass,
  60: Instruments.vocalGrowlingScreaming,
  61: Instruments.vocalSoprano,
  62: Instruments.vocalTenor,
};

extension InstrumentQueryFilter
    on QueryBuilder<Instrument, Instrument, QFilterCondition> {
  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> aboutIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'about',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> aboutIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'about',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> aboutEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'about',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> aboutGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'about',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> aboutLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'about',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> aboutBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'about',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> aboutStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'about',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> aboutEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'about',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> aboutContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'about',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> aboutMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'about',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> aboutIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'about',
        value: '',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      aboutIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'about',
        value: '',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'instrumentPhoto',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'instrumentPhoto',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instrumentPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instrumentPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instrumentPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instrumentPhoto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'instrumentPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'instrumentPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'instrumentPhoto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'instrumentPhoto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instrumentPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'instrumentPhoto',
        value: '',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instrumentPhoto',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instrumentPhoto',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instrumentPhoto',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instrumentPhoto',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instrumentPhoto',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      instrumentPhotoLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instrumentPhoto',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      manufacturerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'manufacturer',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      manufacturerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'manufacturer',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      manufacturerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'manufacturer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      manufacturerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'manufacturer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      manufacturerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'manufacturer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      manufacturerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'manufacturer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      manufacturerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'manufacturer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      manufacturerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'manufacturer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      manufacturerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'manufacturer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      manufacturerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'manufacturer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      manufacturerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'manufacturer',
        value: '',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      manufacturerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'manufacturer',
        value: '',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      possessionTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'possessionTime',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      possessionTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'possessionTime',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      possessionTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'possessionTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      possessionTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'possessionTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      possessionTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'possessionTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      possessionTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'possessionTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      possessionTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'possessionTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      possessionTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'possessionTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      possessionTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'possessionTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      possessionTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'possessionTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      possessionTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'possessionTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      possessionTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'possessionTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      proficiencyLevelEqualTo(Proficiency value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proficiencyLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      proficiencyLevelGreaterThan(
    Proficiency value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proficiencyLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      proficiencyLevelLessThan(
    Proficiency value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proficiencyLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition>
      proficiencyLevelBetween(
    Proficiency lower,
    Proficiency upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proficiencyLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> typeEqualTo(
      Instruments value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> typeGreaterThan(
    Instruments value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> typeLessThan(
    Instruments value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Instrument, Instrument, QAfterFilterCondition> typeBetween(
    Instruments lower,
    Instruments upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InstrumentQueryObject
    on QueryBuilder<Instrument, Instrument, QFilterCondition> {}
