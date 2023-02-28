@JS('cardano')
library cardano_wallet;

import 'package:catalyst_dapp_connector/src/models/cip62_api_model.dart';
import 'package:catalyst_dapp_connector/src/models/voting_credentials_model.dart';
import 'package:catalyst_dapp_connector/src/models/wallet_model.dart';
import 'package:catalyst_dapp_connector/src/models/web_wallet_model.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

external WebWallet get flint;
external WebWallet get nami;
external WebWallet get ccvault;
external WebWallet get gerowallet;
external WebWallet get nufi;

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

Wallet version(String walletName) {
  try {
    return Wallet.formWebWallet(getWalletApi(walletName));
  } catch (e) {
    throw Exception('Error getting wallet version: $e');
  }
}

Future<String> connect(String walletName) async {
  try {
    final wallet = getWalletApi(walletName);

    final cip62Api =
        await promiseToFuture<Cip62Api>(wallet.governance.enable([0]));
    final votingCredentials = await promiseToFuture<VotingCredentials>(
        cip62Api.getVotingCredentials());
    final votingKey = votingCredentials.votingKey;

    final walletApi = await promiseToFuture<WebWalletApi>(wallet.enable());

    final networkId = await promiseToFuture(walletApi.getNetworkId());
    final walletBalance = await promiseToFuture(walletApi.getBalance());

    final usedAddresses = await promiseToFuture(walletApi.getUsedAddresses());
    final unusedAddresses =
        await promiseToFuture(walletApi.getUnusedAddresses());

    final addresses =
        usedAddresses.length > 0 ? usedAddresses : unusedAddresses;

    return 'Wallet: ${wallet.name}.\nWallet Connected to Network ID: $networkId.\nWallet Balance: $walletBalance.\nAddress: $addresses.\nVoting key: $votingKey.\nCip-62: $cip62Api.';
  } catch (e) {
    throw Exception('Error connecting to wallet: $e');
  }
}
