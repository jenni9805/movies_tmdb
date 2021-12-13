class VideoObject {
  static const String dbIso6391 = 'iso_639_1';
  static const String dbIso31661 = 'iso_3166_1';
  static const String dbName = 'name';
  static const String dbKey = 'key';
  static const String dbSite = 'site';
  static const String dbSize = 'size';
  static const String dbType = 'type';
  static const String dbOfficial = 'official';
  static const String dbPublishedAt = 'published_at';
  static const String dbId = 'id';

  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String piblishedAt;
  final String id;

  VideoObject({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.piblishedAt,
    required this.id,
  });

  static List<VideoObject> toList({
    required List<dynamic> json,
  }) =>
      json.map((e) => VideoObject.fromJSon(json: e)).toList();

  factory VideoObject.fromJSon({
    required Map<String, dynamic> json,
  }) =>
      VideoObject(
        iso6391: json[dbIso6391] ?? '',
        iso31661: json[dbIso31661] ?? '',
        name: json[dbName] ?? '',
        key: json[dbKey] ?? '',
        site: json[dbSite] ?? '',
        size: json[dbSize] ?? 0,
        type: json[dbType] ?? '',
        official: json[dbOfficial] ?? false,
        piblishedAt: json[dbPublishedAt] ?? '',
        id: json[dbId] ?? '',
      );

  Map<String, dynamic> toJson() => {
    dbIso6391: iso6391,
    dbIso31661: iso31661,
    dbName: name,
    dbKey: key,
    dbSite: site,
    dbSize: size,
    dbType: type,
    dbOfficial: official,
    dbPublishedAt: piblishedAt,
    dbId: id,
  };
}
