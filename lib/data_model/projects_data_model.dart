// ignore_for_file: public_member_api_docs, sort_constructors_first
class Projects {
  final String title;
  final String description;
  final List<String> projectTeam;
  Projects({
    required this.title,
    required this.description,
    required this.projectTeam,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'projectTeam': projectTeam,
    };
  }

  factory Projects.fromMap(Map<String, dynamic> map) {
    return Projects(
      title: map['title'] as String,
      description: map['description'] as String,
      projectTeam: List<String>.from(
        (map['projectTeam'] as List<String>),
      ),
    );
  }

  Projects copyWith({
    String? title,
    String? description,
    List<String>? projectTeam,
  }) {
    return Projects(
      title: title ?? this.title,
      description: description ?? this.description,
      projectTeam: projectTeam ?? this.projectTeam,
    );
  }
}
