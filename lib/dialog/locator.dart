import '../dialog/dialog_handler.dart';
import '../dialog/dialog_handler_impl.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

///Register [DialogHandler] as a service locator
///so we can show dialogs anywhere in our app without BuildContext.
void setUpLocator() {
  locator.registerLazySingleton<DialogHandler>(() => DialogHandlerImpl());
}
