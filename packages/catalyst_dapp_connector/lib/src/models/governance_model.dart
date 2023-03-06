import 'package:js/js.dart';

///A class representing the governance API of a wallet.
@JS()
class Governance {
  ///Enables governance with the provided list of voting keys.
  external Function enable(List<int> e);
}
