import 'dart:developer';

import 'package:my_band/enum/instruments.dart';
import 'package:my_band/enum/proficiency.dart';

class EnumDecoder {
  final Map<Instruments, String> instrumentMap = {
    Instruments.acousticGuitar: "Акустическая гитара",
    Instruments.classicalGuitar: "Классическая гитара",
    Instruments.eightStringElectricGuitar: "8-струнная электрогитара",
    Instruments.fretlessBassGuitar: "Безладовый бас-гитара",
    Instruments.fiveStringBassGuitar: "5-струнная бас-гитара",
    Instruments.fourStringBassGuitar: "4-струнная бас-гитара",
    Instruments.lapSteelGuitar: "Лэп стил гитара",
    Instruments.octaveMandolin: "Октавная мандолина",
    Instruments.pedalSteelGuitar: "Педальная слайд-гитара",
    Instruments.resonatorGuitar: "Резонаторная гитара",
    Instruments.sevenStringAcousticGuitar: "7-струнная акустическая гитара",
    Instruments.sixStringElectricGuitar: "6-струнная электрогитара",
    Instruments.ukulele: "Укулеле",
    Instruments.altoSaxophone: "Альтовый саксофон",
    Instruments.baritoneSaxophone: "Баритоновый саксофон",
    Instruments.bassTrombone: "Бас-тромбон",
    Instruments.bassoon: "Фагот",
    Instruments.bassetHorn: "Бассетгорн",
    Instruments.contrabassClarinet: "Контрабас-кларнет",
    Instruments.flugelhorn: "Флюгельгорн",
    Instruments.frenchHorn: "Валторна",
    Instruments.oboe: "Гобой",
    Instruments.piccoloTrumpet: "Пикколо-труба",
    Instruments.sopranoClarinet: "Сопрано-кларнет",
    Instruments.sopranoSaxophone: "Сопрано-саксофон",
    Instruments.tenorSaxophone: "Теноровый саксофон",
    Instruments.trombone: "Тромбон",
    Instruments.trumpet: "Труба",
    Instruments.tuba: "Туба",
    Instruments.accordion: "Аккордеон",
    Instruments.bandoneon: "Бандонеон",
    Instruments.grandPiano: "Рояль",
    Instruments.harpsichord: "Клавесин",
    Instruments.modularSynthesizer: "Модульный синтезатор",
    Instruments.organ: "Орган",
    Instruments.piano: "Пианино",
    Instruments.synthesizer: "Синтезатор",
    Instruments.electricPiano: "Электропианино",
    Instruments.drumKit: "Барабанная установка",
    Instruments.hang: "Ханг",
    Instruments.marimba: "Маримба",
    Instruments.vibraphone: "Вибрафон",
    Instruments.xylophone: "Ксилофон",
    Instruments.cello: "Виолончель",
    Instruments.doubleBass: "Контрабас",
    Instruments.electricHarp: "Электроарфа",
    Instruments.electricViolin: "Электроскрипка",
    Instruments.guzheng: "Гучжэн",
    Instruments.harp: "Арфа",
    Instruments.koto: "Кото",
    Instruments.shamisen: "Шамисэн",
    Instruments.sitar: "Ситар",
    Instruments.violin: "Скрипка",
    Instruments.bagpipes: "Волынка",
    Instruments.didgeridoo: "Диджериду",
    Instruments.gusli: "Гусли",
    Instruments.panFlute: "Пан-флейта",
    Instruments.beatboxing: "Битбоксинг",
    Instruments.vocalAlto: "Вокал (альт)",
    Instruments.vocalBass: "Вокал (бас)",
    Instruments.vocalGrowlingScreaming: "Вокал (гроулинг/скриминг)",
    Instruments.vocalSoprano: "Вокал (сопрано)",
    Instruments.vocalTenor: "Вокал (тенор)",
  };

  final Map<Proficiency, String> proficiencyMap = {
    Proficiency.Beginner: "новичек",
    Proficiency.Elementary: "базовый",
    Proficiency.Intermediate: "средний",
    Proficiency.UpperIntermediate: "выше среднего",
    Proficiency.Advanced: "продвинутый",
    Proficiency.Professional: "профессионал",
  };

  String? instrumentDecoder(Instruments? instrument) {
    if (instrumentMap.containsKey(instrument)) {
      return instrumentMap[instrument]!;
    } else {
      log("decoder: error");
      return null;
    }
  }

  String? proficiencyDecoder(Proficiency? proficiency) {
    if (proficiencyMap.containsKey(proficiency)) {
      return proficiencyMap[proficiency]!;
    } else {
      log("decoder: error");
      return null;
    }
  }
}
