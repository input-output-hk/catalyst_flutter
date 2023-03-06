import 'package:catalyst_dapp_connector/src/models/governance_model.dart';
import 'package:js/js.dart';

/// An interface for interacting with a Web Wallet.
@JS()
class WebWallet {
  /// The version of the Web Wallet API.
  external String get apiVersion;

  /// An interface for interacting with the governance features
  /// of the Web Wallet.
  external Governance get governance;

  /// The URL of the Web Wallet's icon.
  external String get icon;

  /// The name of the Web Wallet.
  external String get name;

  /// Enables the Web Wallet and returns a promise
  /// that resolves with the enabled wallet.
  external Function enable();

  /// Returns a promise that resolves with true if the wallet is enabled,
  /// false otherwise.
  external Function isEnabled();
}

/// An interface for interacting with the Web Wallet API.
@JS()
class WebWalletApi {
  /// Returns the current wallet balance.
  external Function getBalance();

  /// Returns the network ID of the connected wallet.
  external Function getNetworkId();

  /// Returns a list of unused wallet addresses.
  external Function getUnusedAddresses();

  /// Returns a list of used wallet addresses.
  external Function getUsedAddresses();
}
