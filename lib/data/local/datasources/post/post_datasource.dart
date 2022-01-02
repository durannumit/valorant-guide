import 'package:boilerplate/data/local/constants/db_constants.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/models/post/post_list.dart';
import 'package:sembast/sembast.dart';

class PostDataSource {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map
  final _postsStore = intMapStoreFactory.store(DBConstants.STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
//  Future<Database> get _db async => await AppDatabase.instance.database;

  // database instance
  final Database _db;

  // Constructor
  PostDataSource(this._db);

  // DB functions:--------------------------------------------------------------
  Future<int> insert(Post post) async {
    return await _postsStore.add(_db, post.toMap());
  }

  Future<int> count() async {
    return await _postsStore.count(_db);
  }

  Future<List<Post>> getAllSortedByFilter({List<Filter>? filters}) async {
    //creating finder
    final finder = Finder(
        filter: filters != null ? Filter.and(filters) : null,
        sortOrders: [SortOrder(DBConstants.FIELD_ID)]);

    final recordSnapshots = await _postsStore.find(
      _db,
      finder: finder,
    );

    // Making a List<Post> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final post = Post.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      post.id = snapshot.key;
      return post;
    }).toList();
  }

  Future<PostList> getPostsFromDb() async {

    print('Loading from database');

    // post list
    var postsList;

    // fetching data
    final recordSnapshots = await _postsStore.find(
      _db,
    );

    // Making a List<Post> out of List<RecordSnapshot>
    if(recordSnapshots.length > 0) {
      postsList = PostList(
          posts: recordSnapshots.map((snapshot) {
            final post = Post.fromMap(snapshot.value);
            // An ID is a key of a record from the database.
            post.id = snapshot.key;
            return post;
          }).toList());
    }

    return postsList;
  }

  Future<int> update(Post post) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(post.id));
    return await _postsStore.update(
      _db,
      post.toMap(),
      finder: finder,
    );
  }

  Future<int> delete(Post post) async {
    final finder = Finder(filter: Filter.byKey(post.id));
    return await _postsStore.delete(
      _db,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _postsStore.drop(
      _db,
    );
  }

}
