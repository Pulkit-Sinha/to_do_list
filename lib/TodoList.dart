import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:to_do_list/Audio/markSpecialSound.dart';
import 'package:to_do_list/Audio/specialTaskSound.dart';
import 'package:to_do_list/Audio/taskSound.dart';
import 'package:to_do_list/Audio/undoSound.dart';
import 'package:to_do_list/Frontend/completedTask.dart';
import 'package:to_do_list/Frontend/createTaskDialogue.dart';
import 'package:to_do_list/Frontend/editTaskDialogue.dart';
import 'package:to_do_list/Frontend/mainBody.dart';
import 'package:to_do_list/Frontend/specialTask.dart';
import 'package:to_do_list/TaskStorage/storageHelper.dart';
import 'package:to_do_list/Frontend/regularTask.dart';
import 'package:to_do_list/Audio/deleteSound.dart';

//the main todo list, calling everything else
class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  List<String> _todoList = <String>[];  //list of regular tasks
  List<String> _todoSpecialList = <String>[];  //list of special tasks
  final List<String> _completedList = <String>[];  //list of recently completed tasks (still in RAM, can be undone)
  final TextEditingController _textFieldController = TextEditingController();  //text field for creating new tasks
  final TextEditingController _textEdit = TextEditingController();  //text field for editing tasks
  String listKey = "listKey"; //key for list of regular tasks
  String speciallistKey = "speciallistKey"; //key for list of special tasks
  String completedlistKey = "completedlistKey"; //key for list of recently completed tasks (still in RAM, can be undone)
  SpecialTaskSound specialTaskSound = SpecialTaskSound();
  TaskSound taskSound = TaskSound();

  @override
  void initState() {
    super.initState();

    //loading sounds
    taskSound.loadMusic();
    specialTaskSound.loadMusic();
    MarkSpecialSound.loadMusic();
    DeleteSound.loadMusic();
    UndoSound.loadMusic();
  }

  //getting tasks from shared preferences
  void getTaskList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(
      () {
        if (prefs.getStringList(listKey) != null) {
          _todoList = prefs.getStringList(listKey)!;
        }
        if (prefs.getStringList(speciallistKey) != null) {
          _todoSpecialList = prefs.getStringList(speciallistKey)!;
        }
      },
    );
  }

  //create new todos
  void _addTask(String title, bool isSpecial) {
    if (isSpecial) {
      //adding new special task
      setState(() => _todoSpecialList.insert(0,title));
      _textFieldController.clear();
      storeStringList(speciallistKey, _todoSpecialList);
    } else {
      //adding new regular task
      setState(() => _todoList.insert(0,title));
      _textFieldController.clear();
      storeStringList(listKey, _todoList);
    }
  }

  //remove a todo
  void taskDone(String title, bool isSpecial) {
    setState(
          () {
        if (isSpecial) {
          _todoSpecialList.remove(title);
        } else {
          _todoList.remove(title);
        }
      },
    );
    if (isSpecial) {
      storeStringList(speciallistKey, _todoSpecialList);
    } else {
      storeStringList(listKey, _todoList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainBody(
      items: _getItems(),
      onAddTask: () => _displayDialog(context),
      displayDialog: _displayDialog,
    );
  }

  // Generate list of regular tasks
  Widget _buildTodoItem(String title) {
    return RegularTask(
      //task name
      title: title,

      //when task marked as complete (circle button on left)
      onComplete: () {
        _completedList.insert(0, title);
        taskDone(title, false);
        taskSound.loadMusic();
      },

      //when task is edited (pencil button on right)
      onEdit: () async {
        await showEditDialog(
          context: context,
          title: title,
          textEditController: _textEdit,
          onSave: () {
            setState(() {
              _todoList.remove(title);
            });
            _addTask(_textEdit.text, false);
          },
        );
      },

      //when regular task is marked as special (star button on right)
      onMarkSpecial: () {
        _addTask(title, true);
        taskDone(title, false);
        MarkSpecialSound.loadMusic();
      },
    );
  }

  // Generate list of special tasks
  Widget _buildSpecialTodoItem(String title) {
    return SpecialTask(

      //special task name
      title: title,

      //when task marked as complete (circle button on left)
      onComplete: () {
        _completedList.insert(0, title);
        taskDone(title, true);
        specialTaskSound.loadMusic();
      },

      //when task is edited (pencil button on right)
      onEdit: () async {
        await showEditDialog(
          context: context,
          title: title,
          textEditController: _textEdit,
          onSave: () {
            setState(() {
              _todoSpecialList.remove(title);
            });
            _addTask(_textEdit.text, true);
          },
        );
      },

      //when special task is marked as regular (star button on right)
      onMarkRegular: () {
        _addTask(title, false);
        taskDone(title, true);
        MarkSpecialSound.loadMusic();
      },
    );
  }

  // Generate list of completed item widgets
  Widget _buildCompletedTodoItem(String title) {
    return CompletedTask(

      //name of completed task
      title: title,

      //when task is undone (circle button on left)
      onUndo: () {
        _todoList.insert(0, title);
        storeStringList(listKey, _todoList);
        _completedList.remove(title);
        UndoSound.loadMusic();
      },

      //when task is deleted (trash button on right)
      onDelete: () {
        _completedList.remove(title);
        DeleteSound.loadMusic();
      },
    );
  }

  //Create a new task (can only create regular tasks, which may be marked as special later)
  Future<AlertDialog> _displayDialog(BuildContext context) async {
    return showAddTaskDialog(
      context: context,
      textFieldController: _textFieldController,
      onAdd: (String text) => _addTask(text, false),
    ).then((value) {                          //converting Future<AlertDialog?> (returned by showAddTaskDialog) to Future<AlertDialog>
      if (value == null) {
        throw Exception("AlertDialog is null");
      }
      return value;
    });
  }

  //display list of todo items
  List<Widget> _getItems() {
    getTaskList();      //retrieve list of regular and special tasks from shared preferences
    final List<Widget> todoWidgets = <Widget>[];

    //we add tasks in order of priority: special tasks, regular tasks, completed tasks

    for (String title in _todoSpecialList) {
      todoWidgets.add(_buildSpecialTodoItem(title));
    }

    for (String title in _todoList) {
      todoWidgets.add(_buildTodoItem(title));
    }

    for (String title in _completedList) {
      todoWidgets.add(_buildCompletedTodoItem(title));
    }

    return todoWidgets;
  }
}