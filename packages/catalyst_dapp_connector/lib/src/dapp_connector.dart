@JS('cardano')
library cardano_wallet;

import 'package:catalyst_dapp_connector/src/models/cip62_api_model.dart';
import 'package:catalyst_dapp_connector/src/models/voting_credentials_model.dart';
import 'package:catalyst_dapp_connector/src/models/wallet_model.dart';
import 'package:catalyst_dapp_connector/src/models/web_wallet_model.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

/// The CCVault wallet.
external WebWallet get ccvault;

/// The Flint wallet.
external WebWallet get flint;

/// The GeroWallet.
external WebWallet get gerowallet;

/// The Nami wallet.
external WebWallet get nami;

/// The Nufi wallet.
external WebWallet get nufi;

/// Wallet connection function
Future<String> connect(String walletName) async {
  try {
    final wallet = getWalletApi(walletName);

    final cip62Api =
        await promiseToFuture<Cip62Api>(wallet.governance.enable(<int>[0]));
    final votingCredentials = await promiseToFuture<VotingCredentials>(
        cip62Api.getVotingCredentials(),);
    final votingKey = votingCredentials.votingKey;

    final walletApi = await promiseToFuture<WebWalletApi>(wallet.enable());

    final networkId =
        await promiseToFuture<WebWalletApi>(walletApi.getNetworkId());
    final walletBalance =
        await promiseToFuture<WebWalletApi>(walletApi.getBalance());

    final usedAddresses =
        await promiseToFuture<List<String>>(walletApi.getUsedAddresses());
    final unusedAddresses =
        await promiseToFuture<List<String>>(walletApi.getUnusedAddresses());

    final addresses =
        usedAddresses.isNotEmpty ? usedAddresses : unusedAddresses;

    return 'Wallet: ${wallet.name}.\n'
        'Wallet Connected to Network ID: $networkId.\n'
        'Wallet Balance: $walletBalance.\n'
        'Address: $addresses.\n'
        'Voting key: $votingKey.\n'
        'Cip-62: $cip62Api.';
  } catch (e) {
    throw Exception('Error connecting to wallet: $e');
  }
}

/// Function for returning wallets based on name
WebWallet getWalletApi(String name) {
  switch (name) {
    case 'nufi':
      return nufi;
    case 'flint':
      return flint;
    default:
      return nufi;
  }
}

///Function for obtaining wallet versions
Wallet version(String walletName) {
  try {
    return Wallet.formWebWallet(getWalletApi(walletName));
  } catch (e) {
    throw Exception('Error getting wallet version: $e');
  }
}
