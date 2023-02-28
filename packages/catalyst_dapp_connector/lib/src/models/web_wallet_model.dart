import 'package:js/js.dart';

import 'governance_model.dart';

@JS()
class WebWallet {
  external String get apiVersion;
  external Governance get governance;
  external String get icon;
  external String get name;
  external enable();
  external isEnabled();
}

@JS()
class WebWalletApi {
  external getBalance();
  external getNetworkId();
  external getUnusedAddresses();
  external getUsedAddresses();
}
