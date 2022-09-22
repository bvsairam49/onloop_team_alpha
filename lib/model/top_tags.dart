import 'dart:ui';

class TopTag {
  final CaptureTag captureTag;
  final int count;

  TopTag({this.captureTag, this.count});
}

enum CaptureTagColor {
  red,
  orange,
  yellow,
  green,
  lime,
  blue,
  purple,
  teal,
  pink,
  grey,
  white,
  red2,
  orange2,
  yellow2,
  lime2,
  green2,
  teal2,
  blue2,
  purple2,
  pink2,
  deep_purple
}

enum CaptureTagSentiment { weekly, monthly, threeMonths, sixMonths, yearly }

class CaptureTag {
  String id;
  String name;
  bool isCustom;
  String type;
  CaptureTagColor color;
  String tagDescription;
  String categoryDescription;
  String disciplineName;

  CaptureTag(
      {this.id,
      this.name,
      this.isCustom = false,
      this.type,
      this.color,
      this.tagDescription,
      this.categoryDescription,
      this.disciplineName});

  bool operator ==(obj) =>
      obj is CaptureTag &&
      name.toLowerCase() == obj.name.toLowerCase() &&
      type == obj.type &&
      color == obj.color;

  int get hashCode =>
      name.toLowerCase().hashCode ^ type.hashCode ^ color.hashCode;

  factory CaptureTag.fromMap(Map<String, dynamic> map) {
    final captureTag = CaptureTag(
      name: map['name'],
      isCustom: map['is_custom'] ?? false,
      type: map['type'],
      color: CaptureTagColorUtil.typeFromString(map['color']),
      tagDescription: map['tag_description'],
      categoryDescription: map['category_description'],
      disciplineName: map['discipline_name'] ?? '',
    );
    return captureTag;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'is_custom': isCustom,
      'type': type,
      'color': color.name,
      'tag_description': tagDescription,
      'category_description': categoryDescription,
      'discipline_name': disciplineName,
    };
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }

  bool similar(CaptureTag anotherTag) {
    return name == anotherTag.name &&
        isCustom == anotherTag.isCustom &&
        type == anotherTag.type &&
        color == anotherTag.color;
  }
}

extension CaptureTagColorUtil on CaptureTagColor {
  static CaptureTagColor typeFromString(String typeString) {
    switch (typeString) {
      case 'red':
        return CaptureTagColor.red;
        break;
      case 'orange':
        return CaptureTagColor.orange;
        break;
      case 'yellow':
        return CaptureTagColor.yellow;
        break;
      case 'green':
        return CaptureTagColor.green;
        break;
      case 'lime':
        return CaptureTagColor.lime;
        break;
      case 'blue':
        return CaptureTagColor.blue;
        break;
      case 'purple':
        return CaptureTagColor.purple;
        break;
      case 'teal':
        return CaptureTagColor.teal;
        break;
      case 'pink':
        return CaptureTagColor.pink;
        break;
      case 'grey':
        return CaptureTagColor.grey;
        break;
      case 'white':
        return CaptureTagColor.white;
        break;
      case 'red2':
        return CaptureTagColor.red2;
        break;
      case 'orange2':
        return CaptureTagColor.orange2;
        break;
      case 'yellow2':
        return CaptureTagColor.yellow2;
        break;
      case 'lime2':
        return CaptureTagColor.lime2;
        break;
      case 'green2':
        return CaptureTagColor.green2;
        break;
      case 'teal2':
        return CaptureTagColor.teal2;
        break;
      case 'blue2':
        return CaptureTagColor.blue2;
        break;
      case 'purple2':
        return CaptureTagColor.purple2;
        break;
      case 'pink2':
        return CaptureTagColor.pink2;
        break;
      case 'deep_purple':
        return CaptureTagColor.deep_purple;
        break;
      default:
        return null;
    }
  }

  static const names = {
    CaptureTagColor.red: 'red',
    CaptureTagColor.orange: 'orange',
    CaptureTagColor.yellow: 'yellow',
    CaptureTagColor.green: 'green',
    CaptureTagColor.lime: 'lime',
    CaptureTagColor.blue: 'blue',
    CaptureTagColor.purple: 'purple',
    CaptureTagColor.teal: 'teal',
    CaptureTagColor.pink: 'pink',
    CaptureTagColor.grey: 'grey',
    CaptureTagColor.white: 'white',
    CaptureTagColor.red2: 'red2',
    CaptureTagColor.orange2: 'orange2',
    CaptureTagColor.yellow2: 'yellow2',
    CaptureTagColor.lime2: 'lime2',
    CaptureTagColor.green2: 'green2',
    CaptureTagColor.teal2: 'teal2',
    CaptureTagColor.blue2: 'blue2',
    CaptureTagColor.purple2: 'purple2',
    CaptureTagColor.pink2: 'pink2',
    CaptureTagColor.deep_purple: 'deep_purple'
  };

  String get name => names[this];
}

const captureTagDarkColor = {
  CaptureTagColor.red: const Color(0xFFE34B4B),
  CaptureTagColor.blue: const Color(0xFF1B95DA),
  CaptureTagColor.yellow: const Color(0xFFC6920C),
  CaptureTagColor.green: const Color(0xFF17AA6C),
  CaptureTagColor.lime: const Color(0xFF76B116),
  CaptureTagColor.orange: const Color(0xFFDE8D29),
  CaptureTagColor.purple: const Color(0xFF8E71D0),
  CaptureTagColor.teal: const Color(0xFF1D9DAE),
  CaptureTagColor.pink: const Color(0xFFE75D7F),
  CaptureTagColor.grey: const Color(0xFF4F697C),
  CaptureTagColor.orange2: Color(0XFFBA722F),
  CaptureTagColor.green2: Color(0XFF2B9367),
  CaptureTagColor.lime2: Color(0XFF60A545),
  CaptureTagColor.pink2: Color(0XFFE570A5),
  CaptureTagColor.blue2: Color(0XFF4978F2),
  CaptureTagColor.teal2: Color(0XFF00AAAA)
};
const captureTagBorderColor = {
  CaptureTagColor.red: const Color(0xFFFAE1E2),
  CaptureTagColor.blue: const Color(0xFFDCECFA),
  CaptureTagColor.yellow: const Color(0xFFF9F3D3),
  CaptureTagColor.green: const Color(0xFFE4F9EE),
  CaptureTagColor.lime: const Color(0xFF76B116),
  CaptureTagColor.orange: const Color(0xFFFCEADA),
  CaptureTagColor.purple: const Color(0xFFE7E0F9),
  CaptureTagColor.teal: const Color(0xFFD4F0F2),
  CaptureTagColor.pink: const Color(0xFFFFE8F6),
  CaptureTagColor.grey: const Color(0xFFDDEAEF),
  CaptureTagColor.orange2: Color(0XFFEBCEB3),
  CaptureTagColor.green2: Color(0XFFBEEEDA),
  CaptureTagColor.lime2: Color(0XFFDBF3D3),
  CaptureTagColor.pink2: Color(0XFFFBD4ED),
  CaptureTagColor.blue2: Color(0XFFE4DFFD),
  CaptureTagColor.teal2: Color(0XFFBBE8EC)
};

const captureTagLightColor = {
  CaptureTagColor.red: const Color(0xFFFFEFEF),
  CaptureTagColor.blue: const Color(0xFFEAF6FF),
  CaptureTagColor.yellow: const Color(0xFFFFF9DA),
  CaptureTagColor.green: const Color(0xFFF4FFF9),
  CaptureTagColor.lime: const Color(0xFF76B116),
  CaptureTagColor.orange: const Color(0xFFFFF1E3),
  CaptureTagColor.purple: const Color(0xFFF3EEFF),
  CaptureTagColor.teal: const Color(0xFFEAFAFB),
  CaptureTagColor.pink: const Color(0xFFFFF2FB),
  CaptureTagColor.grey: const Color(0xFFE9F3F8),
  CaptureTagColor.orange2: Color(0XFFFFE9D4),
  CaptureTagColor.green2: Color(0XFFD7FFEE),
  CaptureTagColor.lime2: Color(0XFFF4FFF0),
  CaptureTagColor.pink2: Color(0XFFFFEAF3),
  CaptureTagColor.blue2: Color(0XFFEFECFF),
  CaptureTagColor.teal2: Color(0XFFD4F6F9)
};
const captureTagColor = {
  CaptureTagColor.red: const Color(0xFFFF656A),
  CaptureTagColor.blue: const Color(0xFF3E9BFF),
  CaptureTagColor.yellow: const Color(0xFFF6C760),
  CaptureTagColor.green: const Color(0xFF29C88B),
  CaptureTagColor.lime: const Color(0xFF76B116),
  CaptureTagColor.orange: const Color(0xFFFBA664),
  CaptureTagColor.purple: const Color(0xFFBA8DF3),
  CaptureTagColor.teal: const Color(0xFF12C8D8),
  CaptureTagColor.pink: const Color(0xFFE75D7F),
  CaptureTagColor.grey: const Color(0xFFE9F3F8),
  CaptureTagColor.orange2: Color(0XFFBA722F),
  CaptureTagColor.green2: Color(0XFF2B9367),
  CaptureTagColor.lime2: Color(0XFF60A545),
  CaptureTagColor.pink2: Color(0XFFE570A5),
  CaptureTagColor.blue2: Color(0XFF4978F2),
  CaptureTagColor.teal2: Color(0XFF00C0C0)
};

const captureTagColorGradients = {
  CaptureTagColor.red: [const Color(0xFFF57F7F), const Color(0xFFE74747)],
  CaptureTagColor.blue: [const Color(0xFF6BB0F0), const Color(0xFF3C7AD9)],
  CaptureTagColor.yellow: [const Color(0xFFF3D155), const Color(0xFFC39902)],
  CaptureTagColor.green: [const Color(0xFF77DF94), const Color(0xFF2CAA4F)],
  CaptureTagColor.lime: [const Color(0xFFBBE05F), const Color(0xFF76B116)],
  CaptureTagColor.orange: [const Color(0xFFECA874), const Color(0xFFE28137)],
  CaptureTagColor.purple: [const Color(0xFFBF94F6), const Color(0xFF8E54D8)],
  CaptureTagColor.teal: [const Color(0xFF81E0F4), const Color(0xFF2AAFC1)],
  CaptureTagColor.pink: [const Color(0xFFFF90A3), const Color(0xFFD15C70)],
  CaptureTagColor.grey: [const Color(0xFFFBFBFD), const Color(0xFFCECFD6)],
  CaptureTagColor.white: [const Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
  CaptureTagColor.red2: [const Color(0xFFFF7272), const Color(0xFFCD2B2B)],
  CaptureTagColor.blue2: [const Color(0xFF4896FB), const Color(0xFF1E65C1)],
  CaptureTagColor.yellow2: [const Color(0xFFE4B14A), const Color(0xFFCF8E1C)],
  CaptureTagColor.green2: [const Color(0xFF40CB91), const Color(0xFF2B9367)],
  CaptureTagColor.lime2: [const Color(0xFFA2DF64), const Color(0xFF6B9A3C)],
  CaptureTagColor.orange2: [const Color(0xFFF99079), const Color(0xFFD45B40)],
  CaptureTagColor.purple2: [const Color(0xFFC083DD), const Color(0xFF874E95)],
  CaptureTagColor.teal2: [const Color(0xFF6BBBEB), const Color(0xFF3A8BBB)],
  CaptureTagColor.pink2: [const Color(0xFFF991D6), const Color(0xFFDE5F98)],
  CaptureTagColor.deep_purple: [
    const Color(0xFF735CFF),
    const Color(0xFF4E36AB)
  ]
};

extension CaptureTagSentimentUtil on CaptureTagSentiment {
  static const names = {
    CaptureTagSentiment.weekly: 'W',
    CaptureTagSentiment.monthly: 'M',
    CaptureTagSentiment.threeMonths: '3M',
    CaptureTagSentiment.sixMonths: '6M',
    CaptureTagSentiment.yearly: 'Y',
  };
}
