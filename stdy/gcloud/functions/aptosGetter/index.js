let {brog_reduced} = require('./data/index');
let isNull = a => typeof a === 'undefined' || !a || a === 0 || a === '';
let filterEqProp = (a, b) => isNull(b) || a === b; 
let filterLessEqProp = (a, b) => isNull(b) || a <= b;

let query = (bedrooms = '', bathrooms = '', region = '', price = '') => {
  let data = brog_reduced;

  // console.log(bedrooms, bathrooms, region, price);

  // console.log(data);

  let returnee = data.filter(a => filterEqProp(a.bedrooms, bedrooms))
      .filter(a => filterEqProp(a.bathrooms, bathrooms))
      .filter(a => filterEqProp(a.region.toLowerCase(), region.toLowerCase()))
      .filter(a => filterLessEqProp(parseFloat(a.price), parseFloat(price)));

  return returnee;
};

exports.aptosGetter = function (req, res) {
  let params = req.body.result.parameters;

  let bedrooms = params['bedrooms'];
  let bathrooms = params['bathrooms'];
  let region = params['region'];
  let price = params['price'];

  let result = [];

   try {
    result = query(bedrooms, bathrooms, region, price);
   } catch (err) {
    result = err; 
   }

  res.setHeader('Content-Type', 'application/json');
  res.send(JSON.stringify({ 'speech': result, 'displayText': result }));
};


//console.log(query('2', '1', '', '1200'))