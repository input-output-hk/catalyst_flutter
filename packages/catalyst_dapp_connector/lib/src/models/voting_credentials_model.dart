import 'package:js/js.dart';

/// A class representing the voting credentials required for participating
/// in a voting process.
///
/// It contains a single field, `votingKey`,
/// which is a string representing the voting key.
@JS()
class VotingCredentials {
  ///voting credentials required for participating in a voting process.
  external String votingKey;
}
