class PostRolesRequest {
  String title = '';
  String requirement = '';
  String description = '';

  PostRolesRequest();

  dynamic get body {
    return {
      'title': title,
      'requirement': requirement,
      'description': description
    };
  }
}