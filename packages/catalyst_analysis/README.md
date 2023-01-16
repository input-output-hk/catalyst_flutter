# Catalyst Analysis

This package provides lint rules for Dart and Flutter which are used at [Catalyst @ IOG](https://github.com/input-output-hk).
For more information, see the [complete list of options][analysis_options_yaml].

> This package was heavily inspired by .

- [Catalyst Analysis](#catalyst-analysis)
  - [Usage](#usage)
  - [Suppressing Lints](#suppressing-lints)
    - [Line Level](#line-level)
    - [File Level](#file-level)
    - [Project Level](#project-level)

## Usage

To use the lints, add as a dev dependency in your `pubspec.yaml`:

```yaml
dev_dependencies:
  catalyst_analysis: ^1.0.0
```

Then, add an include in `analysis_options.yaml`:

```yaml
include: package:catalyst_analysis/analysis_options.yaml
```

This will ensure you always use the latest version of the lints.
If you wish to restrict the lint version, specify a version of `analysis_options.yaml` instead:

```yaml
include: package:catalyst_analysis/analysis_options.1.0.0.yaml
```

## Suppressing Lints

There may be cases where specific lint rules are undesirable. Lint rules can be suppressed at the line, file, or project level.


### Line Level

To suppress a specific lint rule for a specific line of code, use an `ignore` comment directly above the line:

```dart
// ignore: public_member_api_docs
class A {}
```

### File Level

To suppress a specific lint rule of a specific file, use an `ignore_for_file` comment at the top of the file:

```dart
// ignore_for_file: public_member_api_docs

class A {}

class B {}
```

### Project Level

To suppress a specific lint rule for an entire project, modify `analysis_options.yaml`:

```yaml
include: package:very_good_analysis/analysis_options.yaml
linter:
  rules:
    public_member_api_docs: false
```