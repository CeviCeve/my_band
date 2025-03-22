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
      Instruments.acousticGuitar;
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
          Instruments.acousticGuitar) as P;
    case 1:
      return (_ProficiencyLevellevelValueEnumMap[
              reader.readByteOrNull(offset)] ??
          Proficiency.Beginner) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ProficiencyLevelinstrumentEnumValueMap = {
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
const _ProficiencyLevelinstrumentValueEnumMap = {
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
