import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:gitbbs/constant/ColorConstant.dart';
import 'package:gitbbs/model/GitIssue.dart';
import 'package:gitbbs/ui/issuedetail/state.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gitbbs/ui/widget/avatar_img.dart';

Widget buildView(
    IssueDetailState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text(state.getIssue().getTitle()),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            _headerBuild(state.getIssue()),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            _bodyBuild(state)
          ],
        ),
      ),
    ),
  );
}

Widget _bodyBuild(IssueDetailState state) {
  return MarkdownBody(data: state.getBody());
}

Widget _headerBuild(GitIssue issue) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(issue.getTitle(),
            style: TextStyle(
                fontSize: 24,
                color: text_title_color,
                fontWeight: FontWeight.bold)),
        Padding(padding: EdgeInsets.fromLTRB(0, 16, 0, 0)),
        Row(children: <Widget>[
          AvatarImg(
            issue.getAuthor().getAvatarUrl(),
            radius: 16,
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                issue.getAuthor().getName(),
                style: TextStyle(fontSize: 16, color: text_content_color),
              ),
              Text(
                DateUtil.getDateStrByDateTime(
                    DateTime.parse(issue.getCreateTime())),
                style: TextStyle(fontSize: 12, color: text_summary_color),
              )
            ],
          )
        ])
      ]);
}
