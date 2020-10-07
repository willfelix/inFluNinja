import 'package:inFluNinja/models/git.dart';
import 'package:inFluNinja/services/github.service.dart';

enum MockTypeHttpResponse {
  badRequestError,
  internalServerError,
  unauthorizedError,
  success,
  empty
}

class MockedGithubService implements GithubServiceInteface {
  MockTypeHttpResponse type;

  MockedGithubService({this.type});

  @override
  Future<List<Git>> fetchByUsername(String username) async {
    List<Git> list = List();
    List<Git> emptyList = List();

    Git git = Git();
    git.name = "willfelix";
    git.language = "dart";
    list.add(git);

    switch (type) {
      case MockTypeHttpResponse.badRequestError:
        return Future.error(400);
      case MockTypeHttpResponse.internalServerError:
        return Future.error(500);
      case MockTypeHttpResponse.unauthorizedError:
        return Future.error(403);
      case MockTypeHttpResponse.success:
        return Future.value(list);
      case MockTypeHttpResponse.empty:
        return Future.value(emptyList);
      default:
        return Future.error(404);
    }
  }
}
