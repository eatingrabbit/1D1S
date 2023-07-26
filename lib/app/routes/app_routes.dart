part of './app_pages.dart';

//앱 내 라우트를 정의하는 공간. "/ + 이름"으로 작명해주세요
abstract class Routes {
  Routes._();

  static const TEST_PAGE = _Paths.TEST_PAGE;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const MAIN = _Paths.MAIN;
  static const CHAT_ROOM = _Paths.CHAT_ROOM;
  static const SETTING = _Paths.SETTING;
}

abstract class _Paths {
  static const TEST_PAGE = "/TEST_PAGE";
  static const LOGIN = "/login";
  static const REGISTER = "/register";
  static const MAIN = "/main";
  static const CHAT_ROOM = "/chat_room";
  static const SETTING = "/setting";
}