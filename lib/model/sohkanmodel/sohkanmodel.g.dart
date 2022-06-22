// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sohkanmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sohkanmodel _$SohkanmodelFromJson(Map<String, dynamic> json) => Sohkanmodel(
      id: json['_id'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      content: json['content'] as String?,
      author: json['author'] as String?,
      authorSlug: json['authorSlug'] as String?,
      length: json['length'] as int?,
      dateAdded: json['dateAdded'] as String?,
      dateModified: json['dateModified'] as String?,
    );

Map<String, dynamic> _$SohkanmodelToJson(Sohkanmodel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'tags': instance.tags,
      'content': instance.content,
      'author': instance.author,
      'authorSlug': instance.authorSlug,
      'length': instance.length,
      'dateAdded': instance.dateAdded,
      'dateModified': instance.dateModified,
    };
