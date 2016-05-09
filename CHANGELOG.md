# Changelog

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
