db.getMongo().setSlaveOk();

// Pass the name of a retialer and get all collections
getRetailerCollections = function(name){
  name = name.toLowerCase();
  var coll = db.getCollectionNames();
  for each(c in coll) {
    if(c.toLowerCase().indexOf(name) > 0) {
      print(c);
    }
  }
}

//Pass the name of a retailer and get the id
rId = function(name) {
  name = name.toLowerCase();
  var re = new RegExp(name,"i");
  r = db.RetailerSettings.findOne({name : re});
  print("Retailer name - "+r.name + "\nRetailer id - "+r.id);
}
