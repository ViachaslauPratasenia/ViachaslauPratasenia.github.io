import 'package:personal_website/const/assets/assets.gen.dart';

enum SocialButtonElement { linkedin, github, medium, telegram, instagram }

extension SocialButtonElementExt on SocialButtonElement {
  String get imagePath {
    switch (this) {
      case SocialButtonElement.github:
        return Assets.svg.icGithub.path;
      case SocialButtonElement.linkedin:
        return Assets.svg.icLinkedin.path;
      case SocialButtonElement.instagram:
        return Assets.svg.icInstagram.path;
      case SocialButtonElement.telegram:
        return Assets.svg.icTelegram.path;
      case SocialButtonElement.medium:
        return Assets.svg.icMedium.path;
    }
  }
}
