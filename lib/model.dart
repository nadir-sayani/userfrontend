import 'package:flutter/material.dart';

class Lead {

  int _id;
  String _firstname;
  String _lastname;
  String _mobile1;
  String _mobile2;
  String _email1;
  String _email2;
  String _homeaddress;
  String _city;
  String _state;
  String _country;
  String _pin;
  String _companyname;
  String _designation;
  String _workadd;
  String _leadstage;
  String _potential;
  String _productgroup;
  String _leadgroup;
  String _date;


  Lead(
      this._firstname,
      this._lastname,
      this._mobile1,
      this._mobile2,
      this._email1,
      this._email2,
      this._homeaddress,
      this._city,
      this._state,
      this._country,
      this._pin ,
      this._companyname,
      this._designation,
      this._workadd,
      this._leadstage,
      this._potential,
      this._productgroup,
      this._leadgroup,
      this._date
      );


  Lead.withId(
      this._id,
      this._firstname,
      this._lastname,
      this._mobile1,
      this._mobile2,
      this._email1,
      this._email2,
      this._homeaddress,
      this._city,
      this._state,
      this._country,
      this._pin ,
      this._companyname,
      this._designation,
      this._workadd,
      this._leadstage,
      this._potential,
      this._productgroup,
      this._leadgroup,
      this._date
      );

  int get id => _id;
  String get firstname => _firstname ;
  String get lastname => _lastname;
  String get mobile1 => _mobile1;
  String get mobile2 => _mobile2;
  String get email1 => _email1;
  String get email2 => _email2;
  String get homeaddress => _homeaddress;
  String get city => _city;
  String get state => _state;
  String get country => _country;
  String get pin => _pin;
  String get companyname =>_companyname;
  String get designation => _designation;
  String get workadd =>_workadd;
  String get leadstage => _leadstage;
  String get potential => _potential;
  String get productgroup => _productgroup;
  String get leadgroup =>_leadgroup;
  String get date => _date;



  set firstname(String newFirstname) {
    if (newFirstname.length <= 255) {
      this._firstname= newFirstname;
    }
  }

  set lastname(String newlastname) {
    if (newlastname.length <= 255) {
      this._lastname= newlastname;
    }
  }

  set mobile1(String newmobile1) {
    if (newmobile1.length <= 11) {
      this._mobile1= newmobile1;
    }
  }

  set mobile2(String newmobile2) {
    if (newmobile2.length <= 11) {
      this._mobile2= newmobile2;
    }
  }

  set email1(String newemail1) {
    if (newemail1.length <= 255) {
      this._email1= newemail1;
    }
  }

  set email2(String newemail2) {
    if (newemail2.length <= 255) {
      this._email2= newemail2;
    }
  }

  set homeaddress(String newhomeadd) {
    if (newhomeadd.length <= 255) {
      this._homeaddress= newhomeadd;
    }
  }


  set city(String newcity) {
    if (newcity.length <= 255) {
      this._city= newcity;
    }
  }

  set state(String newstate) {
    if (newstate.length <= 255) {
      this._state= newstate;
    }
  }

  set country(String newcountry) {
    if (newcountry.length <= 255) {
      this._country= newcountry;
    }
  }

  set pin(String newpin) {
    if (newpin.length <= 10) {
      this._pin= newpin;
    }
  }

  set companyname(String newcompanyname) {
    if (newcompanyname.length <= 255) {
      this._companyname= newcompanyname;
    }
  }

  set designation(String newdesignation) {
    if (newdesignation.length <= 255) {
      this._designation= newdesignation;
    }
  }

  set workadd(String newworkadd) {
    if (newworkadd.length <= 255) {
      this._workadd= newworkadd;
    }
  }


  set leadstage(String newleadstage) {
      this._leadstage= newleadstage;
  }

  set potential(String newpotential) {
      this._potential = newpotential;
  }

  set productgroup(String newproductgroup) {
    this._productgroup = newproductgroup;
  }

  set leadgroup(String newleadgroup) {
    this._leadgroup = newleadgroup;
  }

  set date(String newdate) {
    this._date = newdate;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['mobile1'] = _mobile1;
    map['mobile2'] = _mobile2;
    map['email1'] = _email1;
    map['email2'] = _email2;
    map['homeaddress'] = _homeaddress;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['pin'] = _pin;
    map['companyname'] = _companyname;
    map['designation'] = _designation;
    map['workadd'] = _workadd;
    map['leadstage'] = _leadstage;
    map['potential'] = _potential;
    map['productgroup'] = _productgroup;
    map['leadgroup'] = _leadgroup;
    map['date'] = _date;

    return map;
  }

  // Extract a Note object from a Map object
  Lead.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._firstname = map['firstname'];
    this._lastname = map['lastname'];
    this._mobile1 = map['mobile1'];
    this._mobile2 = map['mobile2'];
    this._email1 = map['email1'];
    this._email2 = map['email2'];
    this._homeaddress = map['homeaddress'];
    this._city = map['city'];
    this._state = map['state'];
    this._country = map['country'];
    this._pin = map['pin'];
    this._companyname = map['companyname'];
    this._designation = map['designation'];
    this._workadd = map['workadd'];
    this._leadstage = map['leadstage'];
    this._potential = map['potential'];
    this._productgroup = map['productgroup'];
    this._leadgroup = map['leadgroup'];
    this._date = map['date'];
  }
}

