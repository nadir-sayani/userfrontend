import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:leadmanagement/model.dart';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;                // Singleton Database
  String leadTable = 'lead_table';
  String colId = 'id';
  String colref = 'ref';
  String colFirstname = 'firstname';
  String collastname = 'lastname';
  String colmobile1 =  'mobile1';
  String colmobile2 = 'mobile2 ';
  String colemail1 = 'email1';
  String colemail2 = 'email2 ';
  String colhomeaddress = 'homeaddress';
  String colcity = 'city';
  String colstate = 'state';
  String colcountry = 'country';
  String colpin = 'pin';
  String colcompanyname = 'companyname';
  String coldesignation = 'designation';
  String colworkadd = 'workadd';
  String colnotes = 'notes';
  //String colleadstage = 'leadstage';
  //String colpotential = 'potential';
  //String colproductgroup = 'productgroup';
  //String colleadgroup = 'leadgroup';
  String colDate = 'date';
  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'leads.db';

    // Open/create the database at a given path
    var leadsDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return leadsDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    /* await db.execute('CREATE TABLE $leadTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colref TEXT, $colFirstname TEXT, '
        '$collastname TEXT, $colmobile1 TEXT, $colmobile2 TEXT, $colemail1 TEXT,$colemail2 TEXT,$colhomeaddress TEXT,$colcity TEXT,'
        '$colstate TEXT,$colcountry TEXT,$colpin TEXT,$colcompanyname TEXT,$coldesignation TEXT,$colworkadd TEXT,$colleadstage TEXT,'
        '$colpotential TEXT,$colproductgroup TEXT,$colleadgroup TEXT,$colDate TEXT)');*/

    await db.execute('CREATE TABLE $leadTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colref TEXT, $colFirstname TEXT,$collastname TEXT,'
        ' $colmobile1 TEXT, $colmobile2 TEXT, $colemail1 TEXT,$colemail2 TEXT,$colhomeaddress TEXT,$colcity TEXT,'
        '$colstate TEXT,$colcountry TEXT,$colpin TEXT,$colcompanyname TEXT,$coldesignation TEXT,$colworkadd TEXT,$colDate TEXT,$colnotes TEXT)');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getLeadMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(leadTable);
    return result;
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertLead(Lead lead) async {
    Database db = await this.database;
    var result = await db.insert(leadTable, lead.toMap());
    return result;
  }

  // Update Operation: Update a Note object and save it to database
  Future<int> updateLead(Lead lead) async {
    var db = await this.database;
    var result = await db.update(leadTable,lead.toMap(), where: '$colId = ?', whereArgs: [lead.id]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteLead(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $leadTable WHERE $colId = $id');
    return result;
  }

  // Get number of Note objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $leadTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Lead>> getLeadList() async {

    var leadMapList = await getLeadMapList(); // Get 'Map List' from database
    int count = leadMapList.length;         // Count the number of map entries in db table

    List<Lead> leadList = List<Lead>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      leadList.add(Lead.fromMapObject(leadMapList[i]));
    }

    return leadList;
  }

}
