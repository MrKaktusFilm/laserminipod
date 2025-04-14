class ServerConnection {
  final String serverUrl;
  final String name;
  bool active;

  ServerConnection(this.serverUrl, this.name, this.active);

  Map<String, dynamic> toMap() {
    return {
      'serverUrl': serverUrl,
      'name': name,
      'active': active ? 1 : 0,
    };
  }
}
