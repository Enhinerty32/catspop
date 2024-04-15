import 'dart:convert';

class PeopleModel {
    String name;
    String imgProfile;
    String description;
    String civilStatus;
    String beliefs;
    int age;
    String menstrualCycle;
    String phoneNumber;
    String occupation;
    String typeBlood;
    List<double> whereLive;
    List<double> whereWorks;
    List<int> confidenceLevel;
    List<List<int>> mbtiPersonality;
    List<List<String>> observations;
    List<double> fiveLanguages;

    PeopleModel({
        required this.name,
        required this.imgProfile,
        required this.description,
        required this.civilStatus,
        required this.beliefs,
        required this.age,
        required this.menstrualCycle,
        required this.phoneNumber,
        required this.occupation,
        required this.typeBlood,
        required this.whereLive,
        required this.whereWorks,
        required this.confidenceLevel,
        required this.mbtiPersonality,
        required this.observations,
        required this.fiveLanguages,
    });

    factory PeopleModel.fromRawJson(String str) => PeopleModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PeopleModel.fromJson(Map<String, dynamic> json) => PeopleModel(
        name: json["name"],
        imgProfile: json["imgProfile"],
        description: json["description"],
        civilStatus: json["civil status"],
        beliefs: json["beliefs"],
        age: json["age"],
        menstrualCycle: json["Menstrual Cycle"],
        phoneNumber: json["phone number"],
        occupation: json["occupation"],
        typeBlood: json["type blood"],
        whereLive: List<double>.from(json["where live"].map((x) => x?.toDouble())),
        whereWorks: List<double>.from(json["where  works"].map((x) => x?.toDouble())),
        confidenceLevel: List<int>.from(json["confidence level"].map((x) => x)),
        mbtiPersonality: List<List<int>>.from(json["mbti personality"].map((x) => List<int>.from(x.map((x) => x)))),
        observations: List<List<String>>.from(json["observations"].map((x) => List<String>.from(x.map((x) => x)))),
        fiveLanguages: List<double>.from(json["five languages"].map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "imgProfile": imgProfile,
        "description": description,
        "civil status": civilStatus,
        "beliefs": beliefs,
        "age": age,
        "Menstrual Cycle": menstrualCycle,
        "phone number": phoneNumber,
        "occupation": occupation,
        "type blood": typeBlood,
        "where live": List<dynamic>.from(whereLive.map((x) => x)),
        "where  works": List<dynamic>.from(whereWorks.map((x) => x)),
        "confidence level": List<dynamic>.from(confidenceLevel.map((x) => x)),
        "mbti personality": List<dynamic>.from(mbtiPersonality.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "observations": List<dynamic>.from(observations.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "five languages": List<dynamic>.from(fiveLanguages.map((x) => x)),
    };
}
