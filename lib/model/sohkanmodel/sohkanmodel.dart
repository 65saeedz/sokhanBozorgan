import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sohkanmodel.g.dart';

@JsonSerializable()
class Sohkanmodel {
  @JsonKey(name: '_id')
  String? id;
  List<String>? tags;
  String? content;
  String? author;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  Sohkanmodel({
    this.id,
    this.tags,
    this.content,
    this.author,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified,
  });

  @override
  String toString() {
    return 'Sohkanmodel(id: $id, tags: $tags, content: $content, author: $author, authorSlug: $authorSlug, length: $length, dateAdded: $dateAdded, dateModified: $dateModified)';
  }

  factory Sohkanmodel.fromJson(Map<String, dynamic> json) {
    return _$SohkanmodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SohkanmodelToJson(this);

  Sohkanmodel copyWith({
    String? id,
    List<String>? tags,
    String? content,
    String? author,
    String? authorSlug,
    int? length,
    String? dateAdded,
    String? dateModified,
  }) {
    return Sohkanmodel(
      id: id ?? this.id,
      tags: tags ?? this.tags,
      content: content ?? this.content,
      author: author ?? this.author,
      authorSlug: authorSlug ?? this.authorSlug,
      length: length ?? this.length,
      dateAdded: dateAdded ?? this.dateAdded,
      dateModified: dateModified ?? this.dateModified,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Sohkanmodel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      tags.hashCode ^
      content.hashCode ^
      author.hashCode ^
      authorSlug.hashCode ^
      length.hashCode ^
      dateAdded.hashCode ^
      dateModified.hashCode;
}
