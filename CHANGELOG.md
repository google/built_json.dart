# Changelog

## 0.2.0

- Deleted. Equivalent functionality is now available from built_value.

## 0.1.5

- Allow quiver 0.23.

## 0.1.4

- Upgrade analyzer, build and source_gen dependencies.

## 0.1.3

- Fix serialization when built_value builder is fully generated.

## 0.1.2

- Fix issue with BuiltMap deserialization.

## 0.1.1

- Fix error in pubspec.yaml.

## 0.1.0

- Upgrade to source_gen 0.5.0.
- Breaking change; see example for required changes to build.dart.

## 0.0.7

- Allow non-serializable static types provided runtime types are serializable.

## 0.0.6

- Fix serialization of null @nullable fields: omit them entirely.

## 0.0.5

- Add PrimitiveSerializer and StructuredSerializer interfaces.

## 0.0.4

- Update built_value dependency to 0.0.6.
- Fix analyzer version constraints.

## 0.0.3

- Stop falling back to "<Object>" for collection type parameters.
- Extend code generation to add the builders needed for collections.
- Differentiate Object from unspecified.

## 0.0.2

- Rewrite to fully use static type information.

## 0.0.1

- Generator, tests and example.
