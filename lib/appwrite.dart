import 'package:appwrite/appwrite.dart';

late String uid;

Client client = Client()
    .setEndpoint(
        'https://8080-appwrite-integrationfor-sul11sa731h.ws-us94.gitpod.io/v1') // Your Appwrite Endpoint
    .setProject('6438d48ca4e7d0ee0dd7') // Your project ID
    .setSelfSigned(
        status: true); // For self signed certificates, only use for development

// Register User
Account account = Account(client);

Future<void> addUser(String email, String password, String name) async {
  final user = await account.create(
      userId: ID.unique(), email: email, password: password, name: name);
  uid = email;
}

Future<void> authUser(String email, String password) async {
  final session =
      await account.createEmailSession(email: email, password: password);
  print("Logged in!");
  uid = email;
}

final databases = Databases(client);

addDoc(String task) {
  try {
    final document = databases.createDocument(
        databaseId: '643aa66b3c6e0cf96d31',
        collectionId: '643aa678d85ab8566dea',
        documentId: ID.unique(),
        data: {'taskContent': task, 'isDone': false, 'userID': uid});
  } on AppwriteException catch (e) {
    print(e);
  }
}

Future<List<List>> getDoc() async {
  List<List<dynamic>> tasks = [];
  try {
    print("uid: $uid");
    final documents = await databases.listDocuments(
        databaseId: '643aa66b3c6e0cf96d31',
        collectionId: '643aa678d85ab8566dea',
        queries: [Query.equal('userID', uid)]);

    for (var document in documents.documents) {
      var taskContent = document.data['taskContent'];
      var isDone = document.data['isDone'];
      tasks.add([taskContent, isDone]);
    }

    return tasks;
    // print(tasks);
  } on AppwriteException catch (e) {
    print(e);
  }
  return tasks;
}
