import 'dart:convert';
import '../../data/models/build.dart';

/// Encode a single build to a short shareable code.
String encodeBuild(Build build) {
  final json = jsonEncode(build.toJson());
  final bytes = utf8.encode(json);
  return base64UrlEncode(bytes);
}

/// Decode a short code back into a Build.
Build decodeBuild(String code) {
  final bytes = base64Url.decode(code);
  final json = jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>;
  return Build.fromJson(json);
}

/// Encode multiple builds into a single shareable code.
String encodeBuilds(List<Build> builds) {
  final json = jsonEncode(builds.map((b) => b.toJson()).toList());
  final bytes = utf8.encode(json);
  return base64UrlEncode(bytes);
}

/// Decode a multi-build code back into a list of builds.
List<Build> decodeBuilds(String code) {
  final bytes = base64Url.decode(code);
  final json = jsonDecode(utf8.decode(bytes)) as List;
  return json.map((m) => Build.fromJson(m as Map<String, dynamic>)).toList();
}
