import 'package:boilerplate/data/repository.dart';
import 'package:boilerplate/models/agents/agent.dart';
import 'package:boilerplate/models/post/post_list.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:boilerplate/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  // repository instance
  late Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _PostStore(Repository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<PostList?> emptyPostResponse = ObservableFuture.value(null);
  static ObservableFuture<Agent?> emptyAgentResponse = ObservableFuture.value(null);

  @observable
  ObservableFuture<PostList?> fetchPostsFuture = ObservableFuture<PostList?>(emptyPostResponse);

  @observable
  ObservableFuture<Agent?> fetchAgentsFuture = ObservableFuture<Agent?>(emptyAgentResponse);

  @observable
  PostList? postList;

  @observable
  Agent? agentList;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future getPosts() async {
    final future = _repository.getPosts();
    fetchPostsFuture = ObservableFuture(future);

    future.then((postList) {
      this.postList = postList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Future getAgents() async {
    final future = _repository.getAgents();
    fetchAgentsFuture = ObservableFuture(future);

    future.then((response) {
      this.agentList = response;
      print(agentList);
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
