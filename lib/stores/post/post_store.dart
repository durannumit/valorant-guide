import 'package:valorant_guide/data/repository.dart';
import 'package:valorant_guide/models/agents/agent.dart';
import 'package:valorant_guide/stores/error/error_store.dart';
import 'package:valorant_guide/utils/dio/dio_error_util.dart';
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
  static ObservableFuture<Agent?> emptyAgentResponse = ObservableFuture.value(null);

  @observable
  ObservableFuture<Agent?> fetchAgentsFuture = ObservableFuture<Agent?>(emptyAgentResponse);

  @observable
  Agent? agentList;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchAgentsFuture.status == FutureStatus.pending;

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
