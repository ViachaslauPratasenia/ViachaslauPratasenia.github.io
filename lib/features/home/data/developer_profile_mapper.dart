import 'package:personal_website/features/home/data/developer_profile_dto.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';

class DeveloperProfileMapper {
  static DeveloperProfile map(DeveloperProfileDto dto) {
    return DeveloperProfile(
      name: dto.name ?? '',
      email: dto.email ?? '',
      subtitle: dto.subtitle ?? '',
      fullDescription: dto.fullDescription ?? '',
      aboutMe: dto.aboutMe ?? '',
      contactMeText: dto.contactMeText ?? '',
      recentTechnologies: dto.recentTechnologies,
      socialLinks: dto.socialLinks
              ?.map(
                (e) => SocialLink(name: e.name ?? '', url: e.url ?? ''),
              )
              .toList() ??
          [],
      work: dto.work
              ?.map((e) => WorkExperience(
                    title: e.title ?? '',
                    companyName: e.companyName ?? '',
                    companyLink: e.companyLink ?? '',
                    description: e.description ?? '',
                    workPeriod: e.workPeriod ?? '',
                    links: e.links
                            ?.map(
                              (link) => WorkLink(name: link.name ?? '', url: link.url ?? ''),
                            )
                            .toList() ??
                        [],
                  ))
              .toList() ??
          [],
      projects: dto.projects
              ?.map((e) => Project(
                    title: e.title ?? '',
                    description: e.description ?? '',
                    image: e.image ?? '',
                    linkName: e.linkName ?? '',
                    link: e.link ?? '',
                    tags: e.tags?.whereType<String>().toList() ?? [],
                  ))
              .toList() ??
          [],
      blogPosts: dto.blogPosts
              ?.map((e) => BlogPost(
                    title: e.title ?? '',
                    description: e.description ?? '',
                    link: e.link ?? '',
                    tags: e.tags?.whereType<String>().toList() ?? [],
                    date: e.date ?? '',
                  ))
              .toList() ??
          [],
    );
  }
}
