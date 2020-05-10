//weeeeeeeeeeeeeee
//weee youu weoriu fuck me in the butthole i love big ddididdies yeyeyeyeyyy
const plaid = require('plaid');
const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const app = express();
const dotenv = require('dotenv');
const stripe = require('stripe')('pk_test_0HD90PEgJcBBBZFyQ9DFubXV00xAg4IhvG');
const jsdom = require("jsdom");
//const mysql = require('mysql');
//const {MongoClient} = require('mongodb');
var MongoClient = require('mongodb').MongoClient;
const { JSDOM } = jsdom;

global.document = new JSDOM('localhost:8080').window.document;

// var connection = mysql.createConnection({
//   host     : 'localhost',
//   port     : '3306',
//   user     : 'root',
//   password : 'MyNewPass',
//   database : 'ligma'
// });




// connection.query('USE ligma', function(err) {
//   if (err) throw err;

//   console.log('Query Successful');
// });

// database.querySingle('SELECT Host FROM user', function(err, results) {
//     if (err) {
//         console.log('error fetching some active users: ' + err);
//         return;
//     }
//     log('Query Successful');
//     for (var i = 0; i < results.length; i++) {
//         console.log('got active user ' + results[i]);
//     }
// });


//const customer = await stripe.customers.create();

dotenv.config();

function handleError(errorMessage) {
    console.error(errorMessage);
}

const mongourl = "mongodb+srv://user_test:FatCheez9@cluster0-da4ds.mongodb.net/test?retryWrites=true&w=majority";

MongoClient.connect(mongourl, function(err, db) {
  if (err) throw err;
  var dbo = db.db("ligma");
  var myobj = { butthole: "prolapsed" };
  dbo.collection("balls").insertOne(myobj, function(err, res) {
    if (err) throw err;
    console.log("1 document inserted");
    db.close();
  });
});
/* ################################# MONGO SHIT################################  */
// async function mongoThing(){
//     /**
//      * Connection URI. Update <username>, <password>, and <your-cluster-url> to reflect your cluster.
//      * See https://docs.mongodb.com/ecosystem/drivers/node/ for more details
//      */
//     const uri = "mongodb+srv://user_test:FatCheez9@cluster0-da4ds.mongodb.net/test?retryWrites=true&w=majority";


//     const client = new MongoClient(uri);

//     try {
//         // Connect to the MongoDB cluster
//         await client.connect();

//         // Make the appropriate DB calls
//         await  listDatabases(client);

//     } catch (e) {
//         console.error(e);
//     } finally {
//         await client.close();
//     }
// }

// mongoThing().catch(console.error);

// async function listDatabases(client){
//     databasesList = await client.db().admin().listDatabases();

//     console.log("Databases:");
//     databasesList.databases.forEach(db => console.log(` - ${db.name}`));
// };
// ##################################################################################

// connection.connect(function(err) {
//       if (err) throw err;
//       con.query("SELECT * FROM User", function(err, results, fields) {
//         if (err) throw err;
//         console.log(result);
//       });

//       console.log('Connection Successful');
// });

app.get('/card-wallet', async (req, res) => {
  const intent =  await stripe.setupIntents.create({
    customer: customer.id,
  });
  res.render('card_wallet', { client_secret: intent.client_secret });
  // customer.createSource({source: {
  //   object: 'card',
  //   number: document.getElementById('card_number').value,
  //   exp_month: document.getElementById('exp_month').value,
  //   exp_year: document.getElementById('exp_year').value,
  //   cvc: document.getElementById('csv').value
  // }});
});

var cardButton = document.getElementById('the_button');

if (cardButton) {
    cardButton.addEventListener('click', function(ev) {
        // console.log("cum");

        // connection.connect(function(err) {
        //       if (err) throw err;
        //       con.query("SELECT * FROM User", function(err, results, fields) {
        //         if (err) throw err;
        //         console.log(result);
        //       });

        //       console.log('Connection Successful');
        // });

      stripe.confirmCardSetup(
        clientSecret,
        {
          payment_method: {
            card: {
                object: 'card',
                number: document.getElementById('card_number').value,
                exp_month: document.getElementById('exp_month').value,
                exp_year: document.getElementById('exp_year').value,
                cvc: document.getElementById('csv').value
              },
            billing_details: {
              name: document.getElementById('csv').value,
            },
          },
        }
      ).then(function(result) {
        if (result.error) {
          // Display error.message in your UI.
          console.log('yeyeyeyeyey');
        } else {
          // The setup has succeeded. Display a success message.
          console.log("fuck me");
        }
      });
    });
}

//var stripe = Stripe('pk_test_0HD90PEgJcBBBZFyQ9DFubXV00xAg4IhvG');

//var elements = stripe.elements();
//var cardElement = elements.create('card');

//process.env.PLAID_CLIENT_ID = '34b9a68ddd46b4bfafce060e01fe52';

const client = new plaid.Client(
    '5eb39eb98f238c0012403a10',
    '83c7edb91cdb57166bf3857d350dfa',
    '34b9a68ddd46b4bfafce060e01fe52',
    plaid.environments.sandbox
);
//const client = new plaid.Client(1234,1234,1234, plaid.environments.sandbox);


app.use(bodyParser.urlencoded({ extended: true}));
app.use(bodyParser.json());

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'))
});

var today = new Date();
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
var yyyy = today.getFullYear();

today = yyyy + '-' + mm + '-' + dd;

yesterday = new Date();
var ddy = String(yesterday.getDate() - 1).padStart(2, '0');
yesterday = yyyy + '-' + mm + '-' + ddy;
//document.write(today);

var startDate = today;
var endDate = today;
let changeArray = [];
let changeArrayIDS = [];
var trackingType = 'roundup';
//var logged = 0;

var tenButton = document.getElementById("ten");
var twentyButton = document.getElementById("twenty");

if (tenButton) {
    tenButton.addEventListener('click', function(switchTen) {
        trackingType = 'ten';
    })
}

if (twentyButton) {
    twentyButton.addEventListener('click', function(switchTen) {
        trackingType = 'twenty';
    })
}

app.post('/plaid_token_exchange', async (req, res) => {
    const { publicToken } = req.body;

    const { access_token } = await client.exchangePublicToken(publicToken).catch(handleError);

    const {accounts, item} = await client.getAccounts(access_token).catch(handleError);

    const { transactions } = await client.getTransactions(access_token, startDate, endDate, {
        count: 250,
        offset: 0,
    }).catch(handleError);

    //console.log(transactions[1].amount);
    var cur_ID = 0;
    for (var i = 0; i < transactions.length; i++) {
        if (transactions[i].amount != null && transactions[i].amount > 0) {
            if (trackingType == 'roundup') {
                var change = transactions[i].amount - Math.floor(transactions[i].amount);
                // console.log(change.toFixed(2));
                if (change.toFixed(2) != 0) {
                    changeArray.push(change.toFixed(2));
                    var transID = transactions[i].transaction_id;
                    changeArrayIDS.push(cur_ID++);
                }
            } else if (trackingType == 'ten') {
                var change = transactions[i].amount * 0.1;
                if (change.toFixed(2) != 0) {
                    changeArray.push(change.toFixed(2));
                    var transID = transactions[i].transaction_id;
                    changeArrayIDS.push(cur_ID++);
                }
            } else {
                var change = transactions[i].amount * 0.2;
                if (change.toFixed(2) != 0) {
                    changeArray.push(change.toFixed(2));
                    var transID = transactions[i].transaction_id;
                    changeArrayIDS.push(cur_ID++);
                }
            }
        }
    }

    MongoClient.connect(mongourl, async function (err, db) {
      if (err) throw err;
      var dbo = db.db("money");
      for (var i = 0; i < changeArray.length; i++) {
        var myobj = { trans_id: changeArrayIDS[i], amount: changeArray[i], paid: "no" };

        var logged = await 0;

        let webo = await dbo.collection("transactions").findOne( { trans_id: changeArrayIDS[i] }, function(err, result) {
            if (err) throw err;
            if (result != null) {
                //console.log("cheems");
                logged = 1;
            }
            //return 5;
        });
        //console.log("burger");

        if (logged == 0) {
            let add = await dbo.collection("transactions").insertOne(myobj, function(err, res) {
                if (err) throw err;
                db.close();
            });
        }


      }
      // console.log(changeArray.length);
      // console.log(changeArrayIDS.length);

      // for (var i = 0; i < changeArrayIDS.length; i++) {
      //   dbo.collection("transactions").findOne({trans_id: changeArrayIDS[i]}, function(err, result) {
      //       console.log(result);
      //   });
      // }

    });
    // console.log(client);
    // console.log({
    //     accounts,
    //     item
    // });
});

// Retrieve ACH or EFT Auth data for an Item's accounts
// https://plaid.com/docs/#auth
// app.get('/auth', function(request, response, next) {
//   client.getAuth(ACCESS_TOKEN, function(error, authResponse) {
//     if (error != null) {
//       //prettyPrintResponse(error);
//       return response.json({
//         error: error,
//       });
//     }
//     //prettyPrintResponse(authResponse);
//     console.log(authResponse);
//     response.json({error: null, auth: authResponse});
//   });
// });

app.listen(8080, () => console.log('Server started, Listening at localhost:8080'));
