# Built JSON for Dart

## Introduction

Built JSON provides serialization for the [Libraries for Object Oriented Dart]
(https://github.com/google/built_value.dart/blob/master/libraries_for_object_oriented_dart.md#libraries-for-object-oriented-dart).

This allows a complete serializable object oriented data model to be based on
[Enum Classes](https://github.com/google/enum_class.dart#enum-classes-for-dart),
[Built Collections]
(https://github.com/google/built_collection.dart#built-collections-for-dart) and
[Built Values]
(https://github.com/google/built_value.dart#built-values-for-dart).

Built JSON for Java, a separate project, will provide compatible serialization
for Java, mapping Enum Classes to standard Java enums, Built Collections to
[Immutable Collections]
(https://github.com/google/guava/wiki/ImmutableCollectionsExplained) and Built
Values to [AutoValues]
(https://github.com/google/auto/tree/master/value#autovalue).

## Status

Built JSON is not yet ready for use. Watch this space!

## Motivation

There are many ways to serialize data. Why do we need another?

Built JSON is about serialization of object oriented data. There are many ways
to do this, too. Built JSON is different to other libraries for a number of
reasons:

Built JSON _fully supports object oriented design_: any object model that you
can design can be serialized, including full use of generics and interfaces.
Some other libraries require concrete types or do not fully support generics.

Built JSON _allows different object oriented models over the same data_. For
example, in a client server application, it's likely that the client and server
want different functionality from their data model. So, they are allowed to have
different classes that map to the same data. Most other libraries enforce a 1:1
mapping between classes and types on the wire.

Built JSON _requires well behaved types_. They must be immutable, can use
interface but not concrete inheritance, must have predictable nullability,
`hashCode`, `equals` and `toString`. In fact, they must be Enum Classes, Built
Collections or Built Values. Some other libraries allow badly behaved types to
be serialized.

Built JSON _supports changes to the data model_. Optional fields can be added or
removed, and fields can be switched from optional to required, allowing your
data model to evolve without breaking compatbility. Some other libraries break
compatability on any change to any serializable class.

Built JSON _is modular_. Each endpoint can choose which classes to know about;
for example, you can have multiple clients that each know about only a subset of
the classes the server knows. Most other libraries are monolithic, requiring all
endpoints to know all types.

Built JSON _is multi language_. Support will be come first for Dart, Java and
Java/GWT. Many other libraries support a single language only.

Built JSON _has first class support for validation_ via Built Values. An
important part of a powerful data model is ensuring it's valid, so classes can
make guarantees about what they can do. Other libraries also support validation
but usually in a less prominent way.

And, finally, Built JSON _is pluggable_. Arbitrary extensions can be added to
give custom JSON serialization for your own types. This could be used to
interoperate with other tools or to add hand coded high performance serializers
for specific classes. Some other libraries are not so extensible.

## Examples

See [this example]
(https://github.com/google/built_json.dart/tree/master/example) for a full
project with a `build.dart` and some examples.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/google/built_json.dart/issues
