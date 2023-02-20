import 'package:flutter/foundation.dart';
import 'package:catalyst_dapp_connector/src/models/web_wallet.dart';

@immutable
class Wallet {
  final String name;
  final String apiVersion;
  final String iconBase64;

  const Wallet({
    required this.name,
    required this.apiVersion,
    required this.iconBase64,
  });

  factory Wallet.formWebWallet(WebWallet webWallet) {
    return Wallet(
      name: webWallet.name,
      apiVersion: webWallet.apiVersion,
      iconBase64: webWallet.icon,
    );
  }

  @override
  String toString() =>
      'Wallet(name: $name, apiVersion: $apiVersion, icon: $iconBase64)';
}
