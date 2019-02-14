class Word {
  String phrase;
  String langFrom;
  String langTo;
  String phraseAcute;
  String phraseIpa;
  String _translation =
      '<p><abbr title="средний род">ср.</abbr><br />1) <a>сөз</a><br />2) <a>сөйлеу</a>; сөйлеу қабілеті; <a>тіл</a><br />3) <a>әңгіме</a>; <a>сөз</a><br />4) <abbr title="только единственное число">только ед.</abbr> <em>(речь, выступление)</em> <a>жарыссөз</a>; <a>сөз</a> <em>(алқада айтылатын)</em><br />5) <abbr title="только единственное число">только ед.</abbr> <abbr title="устаревшее слово">уст.</abbr> <em>(повествование, рассказ)</em> <a>аңыз</a>; <a>әңгіме</a>; <a>дастан</a>; <a>жыр</a><br />6) <em>(право говорить публично)</em> <a>сөз</a> <em>(жұрт алдында сөйлеу құқығы)</em><br />7) <em>(мнение, заключение)</em> <a>қорытынды</a>; <a>пікір</a>; <a>сөз</a><br />8) <em>(обещание)</em> <a>сөз</a>; сөз беру; <a>уәде</a><br />9) <abbr title="только множественное число">только мн.</abbr> <em>(текст к песне)</em> өлеңнің мәтіні; <a>жыр</a>; <a>өлең</a><br />10) <abbr title="множественное число">мн.</abbr> <abbr title="неодобрительно">неодобр.</abbr> <em>(болтовня)</em> мағынасыз сөз; мылжың сөз<br />11)<br /><br /><abbr title="синонимы">син.</abbr> <syn>гарантия</syn>, <syn>зарок</syn>, <syn>клятва</syn>, <syn>обет</syn>, <syn>обещание</syn>, <syn>обязательство</syn>, <syn>порука</syn>, <syn>поручительство</syn>, <syn>посул</syn>, <syn>присяга</syn>, <syn>ручательство</syn></p>';
  int favourite;
  String audioHash;
  String urlShort;
  BigInt translatedAt;
  List<String> similarPhrases;

  Word(this.phrase, this.langFrom, this.langTo);

  String getTranslation() {
    var result =
        _translation.replaceAllMapped(RegExp(r'(<a>)(.*?)(</a>)'), (match) {
      return '"<a href="/dictionary/translate/$langTo/$langFrom/${match.group(2)}/">${match.group(2)}</a>"';
    });
    return result.replaceAllMapped(RegExp(r'(<syn>)(\w+)(</syn>)'), (match) {
      return '"<a href="/dictionary/translate/$langFrom/$langTo/${match.group(2)}/">${match.group(2)}</a>"';
    });
  }

  @override
  String toString() {
    return phrase;
  }
}
