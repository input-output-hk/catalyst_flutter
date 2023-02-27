import 'package:js/js.dart';
import 'governance_model.dart';

@JS()
class WebWallet {
  external String get name;
  external String get apiVersion;
  external String get icon;
  external enable();
  external isEnabled();
  external Governance get governance;
}

@JS()
class WebWalletApi {
  external getNetworkId();
  external getBalance();
  external getUsedAddresses();
  external getUnusedAddresses();
}
