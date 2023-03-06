import 'package:catalyst_dapp_connector/src/models/web_wallet_model.dart';
import 'package:flutter/foundation.dart';

/// Represents a wallet.
@immutable
class Wallet {
  /// The name of the wallet.
  final String name;

  /// The version of the wallet API.
  final String apiVersion;

  /// The icon of the wallet encoded in base64.
  final String iconBase64;

  /// The wallet constructor
  const Wallet({
    required this.name,
    required this.apiVersion,
    required this.iconBase64,
  });

  ///Creating a Wallet object from WebWallet
  factory Wallet.formWebWallet(WebWallet webWallet) {
    return Wallet(
      name: webWallet.name,
      apiVersion: webWallet.apiVersion,
      iconBase64: webWallet.icon,
    );
  }

  @override
  String toString() =>
      'Wallet(name: $name, apiVersion:$apiVersion, icon: $iconBase64)';
}
