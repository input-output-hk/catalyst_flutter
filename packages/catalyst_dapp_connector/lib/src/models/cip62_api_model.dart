import 'package:js/js.dart';

/// An interface for interacting with the CIP-62 API provided by a wallet.
@JS()
class Cip62Api {
  /// Get the voting credentials associated with the enabled governance key.
  external Function getVotingCredentials();
}
