// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

/// Data model for the built_json chat example.
library data_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';
import 'package:built_value/built_value.dart';
import 'package:enum_class/enum_class.dart';

part 'data_model.g.dart';

/// Marker interface for classes sent from client to server.
abstract class Command {}

/// Sends a chat.
abstract class Chat implements Built<Chat, ChatBuilder>, Command {
  static Serializer<Chat> get serializer => _$chatSerializer;

  // Chat text.
  String get text;

  /// Set of usernames to send the chat to, or empty to send to everyone.
  BuiltSet<String> get targets;

  Chat._();
  factory Chat([updates(ChatBuilder b)]) = _$Chat;
}

/// Logs in.
abstract class Login implements Built<Login, LoginBuilder>, Command {
  static Serializer<Login> get serializer => _$loginSerializer;
  String get username;
  String get password;

  Login._();
  factory Login([updates(LoginBuilder b)]) = _$Login;
}

/// User status: online, away or offline, and a message.
///
/// Sent as a command, sets the current user status.
abstract class Status implements Built<Status, StatusBuilder>, Command {
  static Serializer<Status> get serializer => _$statusSerializer;
  String get message;
  StatusType get type;

  Status._();
  factory Status([updates(StatusBuilder b)]) = _$Status;
}

/// User status: online, away or offline.
class StatusType extends EnumClass {
  static Serializer<StatusType> serializer = _$statusTypeSerializer;

  static const StatusType online = _$online;
  static const StatusType away = _$away;
  static const StatusType offline = _$offline;

  const StatusType._(String name) : super(name);

  static BuiltSet<StatusType> get values => _$stValues;
  static StatusType valueOf(String name) => _$stValueOf(name);
}

/// Lists users, filtered by status.
abstract class ListUsers
    implements Built<ListUsers, ListUsersBuilder>, Command {
  static Serializer<ListUsers> get serializer => _$listUsersSerializer;

  /// Set of statuses to filter by.
  BuiltSet<StatusType> get statusTypes;

  ListUsers._();
  factory ListUsers([updates(ListUsersBuilder b)]) = _$ListUsers;
}

/// Classes sent from server to client.
abstract class Response {
  String render();
}

/// Response to a login attempt.
class LoginResponse extends EnumClass implements Response {
  static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;
  static const LoginResponse success = _$success;
  static const LoginResponse badPassword = _$badPassword;
  static const LoginResponse reset = _$reset;

  const LoginResponse._(String name) : super(name);

  static BuiltSet<LoginResponse> get values => _$lrValues;
  static LoginResponse valueOf(String name) => _$lrValueOf(name);

  @override
  String render() {
    switch (this) {
      case success:
        return 'You have logged in successfully.';
      case badPassword:
        return 'Incorrect password.';
      case reset:
        return 'You have been logged out.';
      default:
        throw new StateError(this.name);
    }
  }
}

/// Displays a chat message.
abstract class ShowChat implements Built<ShowChat, ShowChatBuilder>, Response {
  static Serializer<ShowChat> get serializer => _$showChatSerializer;

  /// Originator of the message.
  String get username;

  /// Whether the message is a /tell or a general message.
  bool get private;

  /// Message text.
  String get text;

  ShowChat._();
  factory ShowChat([updates(ShowChatBuilder b)]) = _$ShowChat;

  @override
  String render() => '$username${private ? " (private)" : ""}: $text';
}

/// Displays a list of users and their status messages.
abstract class ListUsersResponse
    implements Built<ListUsersResponse, ListUsersResponseBuilder>, Response {
  static Serializer<ListUsersResponse> get serializer =>
      _$listUsersResponseSerializer;

  /// Map from username to status.
  BuiltMap<String, Status> get statuses;

  ListUsersResponse._();
  factory ListUsersResponse([updates(ListUsersResponseBuilder b)]) =
      _$ListUsersResponse;

  @override
  String render() {
    final result = new StringBuffer('The following users are online:\n\n');
    for (final username in statuses.keys) {
      final status = statuses[username];
      result.write(
          status.message.isEmpty ? username : '$username ${status.message}');
      result.write('\n');
    }
    return result.toString();
  }
}