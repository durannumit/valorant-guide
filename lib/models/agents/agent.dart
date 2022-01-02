class Agent {
  Agent({
    required this.status,
    required this.data,
  });
  late final int status;
  late final List<AgentData> data;

  Agent.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = List.from(json['data']).map((e) => AgentData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class AgentData {
  AgentData({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    this.characterTags,
    required this.displayIcon,
    required this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    required this.killfeedPortrait,
    required this.assetPath,
    required this.isFullPortraitRightFacing,
    required this.isPlayableCharacter,
    required this.isAvailableForTest,
    required this.isBaseContent,
    required this.role,
    required this.abilities,
    required this.voiceLine,
  });
  late final String uuid;
  late final String displayName;
  late final String description;
  late final String developerName;
  late final List<String>? characterTags;
  late final String displayIcon;
  late final String displayIconSmall;
  late final String? bustPortrait;
  late final String? fullPortrait;
  late final String killfeedPortrait;
  late final String assetPath;
  late final bool isFullPortraitRightFacing;
  late final bool isPlayableCharacter;
  late final bool isAvailableForTest;
  late final bool isBaseContent;
  late final Role? role;
  late final List<Abilities> abilities;
  late final VoiceLine voiceLine;

  AgentData.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    developerName = json['developerName'];
    characterTags = null;
    displayIcon = json['displayIcon'];
    displayIconSmall = json['displayIconSmall'];
    bustPortrait = null;
    fullPortrait = null;
    killfeedPortrait = json['killfeedPortrait'];
    assetPath = json['assetPath'];
    isFullPortraitRightFacing = json['isFullPortraitRightFacing'];
    isPlayableCharacter = json['isPlayableCharacter'];
    isAvailableForTest = json['isAvailableForTest'];
    isBaseContent = json['isBaseContent'];
    role = (json['role'] != null ? Role.fromJson(json['role']) : null);
    abilities = List.from(json['abilities']).map((e) => Abilities.fromJson(e)).toList();
    voiceLine = VoiceLine.fromJson(json['voiceLine']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uuid'] = uuid;
    _data['displayName'] = displayName;
    _data['description'] = description;
    _data['developerName'] = developerName;
    _data['characterTags'] = characterTags;
    _data['displayIcon'] = displayIcon;
    _data['displayIconSmall'] = displayIconSmall;
    _data['bustPortrait'] = bustPortrait;
    _data['fullPortrait'] = fullPortrait;
    _data['killfeedPortrait'] = killfeedPortrait;
    _data['assetPath'] = assetPath;
    _data['isFullPortraitRightFacing'] = isFullPortraitRightFacing;
    _data['isPlayableCharacter'] = isPlayableCharacter;
    _data['isAvailableForTest'] = isAvailableForTest;
    _data['isBaseContent'] = isBaseContent;
    _data['role'] = role;
    _data['abilities'] = abilities.map((e) => e.toJson()).toList();
    _data['voiceLine'] = voiceLine.toJson();
    return _data;
  }
}

class Role {
  Role({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.assetPath,
  });
  late final String uuid;
  late final String displayName;
  late final String description;
  late final String displayIcon;
  late final String assetPath;

  Role.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uuid'] = uuid;
    _data['displayName'] = displayName;
    _data['description'] = description;
    _data['displayIcon'] = displayIcon;
    _data['assetPath'] = assetPath;
    return _data;
  }
}

class Abilities {
  Abilities({
    required this.slot,
    required this.displayName,
    required this.description,
    this.displayIcon,
  });
  late final String slot;
  late final String displayName;
  late final String description;
  late final String? displayIcon;

  Abilities.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slot'] = slot;
    _data['displayName'] = displayName;
    _data['description'] = description;
    _data['displayIcon'] = displayIcon;
    return _data;
  }
}

class VoiceLine {
  VoiceLine({
    required this.minDuration,
    required this.maxDuration,
    required this.mediaList,
  });
  late final double minDuration;
  late final double maxDuration;
  late final List<MediaList> mediaList;

  VoiceLine.fromJson(Map<String, dynamic> json) {
    minDuration = json['minDuration'];
    maxDuration = json['maxDuration'];
    mediaList = List.from(json['mediaList']).map((e) => MediaList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['minDuration'] = minDuration;
    _data['maxDuration'] = maxDuration;
    _data['mediaList'] = mediaList.map((e) => e.toJson()).toList();
    return _data;
  }
}

class MediaList {
  MediaList({
    required this.id,
    required this.wwise,
    required this.wave,
  });
  late final int id;
  late final String wwise;
  late final String wave;

  MediaList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wwise = json['wwise'];
    wave = json['wave'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['wwise'] = wwise;
    _data['wave'] = wave;
    return _data;
  }
}
