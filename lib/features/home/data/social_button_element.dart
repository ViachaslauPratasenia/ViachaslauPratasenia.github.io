import 'package:personal_website/const/assets/assets.gen.dart';

enum SocialButtonElement {
  email,
  github,
  linkedin,
  instagram,
  telegram
}

extension SocialButtonElementExt on SocialButtonElement {
  String get imagePath {
    switch (this) {
      case SocialButtonElement.email:
        return Assets.images.icEmail.path;
      case SocialButtonElement.github:
        return Assets.images.icGithub.path;
      case SocialButtonElement.linkedin:
        return Assets.images.icLinkedin.path;
      case SocialButtonElement.instagram:
        return Assets.images.icInstagram.path;
      case SocialButtonElement.telegram:
        return Assets.images.icTelegram.path;
    }
  }
}