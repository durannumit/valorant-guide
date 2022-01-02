// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostStore on _PostStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_PostStore.loading'))
      .value;

  final _$fetchAgentsFutureAtom = Atom(name: '_PostStore.fetchAgentsFuture');

  @override
  ObservableFuture<Agent?> get fetchAgentsFuture {
    _$fetchAgentsFutureAtom.reportRead();
    return super.fetchAgentsFuture;
  }

  @override
  set fetchAgentsFuture(ObservableFuture<Agent?> value) {
    _$fetchAgentsFutureAtom.reportWrite(value, super.fetchAgentsFuture, () {
      super.fetchAgentsFuture = value;
    });
  }

  final _$agentListAtom = Atom(name: '_PostStore.agentList');

  @override
  Agent? get agentList {
    _$agentListAtom.reportRead();
    return super.agentList;
  }

  @override
  set agentList(Agent? value) {
    _$agentListAtom.reportWrite(value, super.agentList, () {
      super.agentList = value;
    });
  }

  final _$successAtom = Atom(name: '_PostStore.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$getAgentsAsyncAction = AsyncAction('_PostStore.getAgents');

  @override
  Future<dynamic> getAgents() {
    return _$getAgentsAsyncAction.run(() => super.getAgents());
  }

  @override
  String toString() {
    return '''
fetchAgentsFuture: ${fetchAgentsFuture},
agentList: ${agentList},
success: ${success},
loading: ${loading}
    ''';
  }
}
