void main() {

  save(key: Keys.username, value: "Amir");
  save(key: Keys.email, value: "Amir@gmail.com");
  save(key: Keys.language, value: "ar");
  save(key: Keys.theme, value: "dark");

  print(getData(key: Keys.username));
  print(getData(key: Keys.email));
  print(getData(key: Keys.language));
  print(getData(key: Keys.theme));
}

enum Keys{
  username,
  email,
  language,
  theme
}

void save({required Keys key, required String value}){
  // key:value
}

String getData({required Keys key}) => "";


class IAnimations{

  void startAnimation(){
    print('');
  }

  void stopAnimation(){
    print('');
  }
}

abstract class BaseScreen implements IAnimations {
  void getData();

  @override
  void startAnimation(){

  }

  @override
  void stopAnimation(){

  }

  String screenName = "";

  BaseScreen(this.screenName);

  void currentScreen() {
    print(screenName);
  }

  bool isWifiOn() => false;

  bool isDataOn() => true;

  void navigateToMainScreen() {
    print('Navigate');
  }

  void navigateToLoginScreen() {
    print('Navigate');
  }
}

class FirstScreen extends BaseScreen {
  FirstScreen(super.screenName);

  @override
  void currentScreen() {
    print('=> ${super.screenName} <=');
  }

  void build() {
    if (super.isWifiOn()) {
      super.navigateToLoginScreen();
      return;
    }

    if (super.isDataOn()) {
      super.navigateToMainScreen();
      return;
    }
  }

  @override
  void getData() {
    // TODO: implement getData
  }


}

class SecondScreen extends BaseScreen {
  SecondScreen() : super("SecondScreen");

  @override
  void currentScreen() {
    print('- - - - - - - - -');
    super.currentScreen();
    print('- - - - - - - - -');
  }

  void build() {
    currentScreen();

    if (super.isWifiOn()) {
      super.navigateToLoginScreen();
      return;
    }

    if (super.isDataOn()) {
      super.navigateToMainScreen();
      return;
    }
  }

  @override
  void getData() {
    // TODO: implement getData
  }

}
