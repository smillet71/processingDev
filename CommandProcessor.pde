//
String[]tokensTestCommand1 = {"TEST", "COMMAND", "ADD", "[STRING]", "AT", "[FLOAT]", "[FLOAT]", "AXIS", "[FLOAT]", "SIZE", "[FLOAT]", "[FLOAT]"};
String[]tokensTestCommand2 = {"TEST", "COMMAND", "REMOVE", "[STRING]", "AT", "[FLOAT]", "[FLOAT]", "AXIS", "[FLOAT]", "SIZE", "[FLOAT]", "[FLOAT]"};
String[]tokensTestCommand3 = {"TEST", "COMMAND", "ADD", "[STRING]", "AT", "[FLOAT]", "[FLOAT]", "AXIS", "[FLOAT]", "SIZE", "[FLOAT]", "[FLOAT]", "[FLOAT]"};

/**
 * Command definition
 */
class Command {
  String[] tokens = null;
  java.lang.reflect.Method method = null;
  Command(String[] _tokens, java.lang.reflect.Method _method) {
    tokens = _tokens;
    method = _method;
  }
}

/**
 * Command Processor
 */
class CommandProcessor {

  //
  Hashtable<String, String[]> commandList = new Hashtable<String, String[]>();
  Hashtable<String, java.lang.Object> commands = new Hashtable<String, java.lang.Object>();

  // Ajouter une commande
  void addCommand(String[] template) {
    String name = getCommandName(template);
    if (commandList.get(name) == null) {
      commandList.put(name, template);
      addCommand(name, template, commands, 0);
    } else {
      error("command already exists: "+name);
    }
  }

  // Ajouter une command (récursif)
  void addCommand(String name, String[] template, Hashtable<String, java.lang.Object> commands, int n) {
    // Compléter/Parcourir l'arborescence
    if (n<template.length) {
      Hashtable<String, java.lang.Object> list = (Hashtable<String, java.lang.Object>)commands.get(template[n]);
      if (list == null) {
        list = new Hashtable<String, java.lang.Object>();
        commands.put(template[n], list);
        println(template[n]+" - create");
      }
      else println(template[n]+" - go down");
      // Avancer dans l'arborescence
      addCommand(name, template, list, n+1);
    } 
    // Ajouter la commande
    else {
      Command cmd = new Command(template, null); 
      commands.put(name, cmd);
      println(name+" - create");
    }
  }

  // Créer le nom d'une commande
  String getCommandName(String[] tokens) {
    String prefix = "";
    for (int i=0; i<tokens.length; i++) {
      if (i!=tokens.length-1) {
        prefix = prefix+tokens[i]+" ";
      } else {
        prefix = prefix+tokens[i];
      }
    }
    return prefix;
  }
}
