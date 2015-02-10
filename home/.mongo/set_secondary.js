db.getMongo().setSlaveOk();

// Pass the name of a retialer and get all collections

//Pass the name of a retailer and get the id
rId = function(name) {
  name = name.toLowerCase();
  var re = new RegExp(name,"i");
  r = db.RetailerSettings.findOne({name : re});
  print("Retailer name - "+r.name + "\nRetailer id - "+r.id);
}

get_products = function(name) {
}

get_lists = function(name) { 
  local = connect('localhost:27017/product')
  db
}
