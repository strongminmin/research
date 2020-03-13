import 'package:flutter/material.dart';
import 'package:yanyou/models/Talk.dart';

class TalkProvider extends ChangeNotifier {
  List<TalkModel> talksModel;

  initTalkModel(List json) {
    List<TalkModel> tempModels = json
        .map((item) {
          return TalkModel.fromJson(item);
        })
        .cast<TalkModel>()
        .toList();
    talksModel = tempModels;
    notifyListeners();
  }

  addTalkModel(List json) {
    List<TalkModel> tempModels = json
        .map((item) {
          return TalkModel.fromJson(item);
        })
        .cast<TalkModel>()
        .toList();
    talksModel.addAll(tempModels);
    notifyListeners();
  }

  updateLike(int talkId, Map<String, dynamic> json) {
    Like like = Like.fromJson(json);
    talksModel.forEach((talkModel) {
      if (talkModel.talkId == talkId) {
        talkModel.talkLike = like;
      }
    });
    notifyListeners();
  }

  updateComment(int talkId, int comment) {
    talksModel.forEach((talkModel) {
      if (talkModel.talkId == talkId) {
        talkModel.comment = comment;
      }
    });
    notifyListeners();
  }
}
