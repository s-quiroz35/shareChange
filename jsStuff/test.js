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
const { JSDOM } = jsdom;

global.document = new JSDOM('localhost:8080').window.document;


//const customer = await stripe.customers.create();

dotenv.config();

function handleError(errorMessage) {
    console.error(errorMessage);
}

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

var startDate = '2020-04-08';
var endDate = '2020-05-08';
let changeArray = [];

app.post('/plaid_token_exchange', async (req, res) => {
    const { publicToken } = req.body;

    const { access_token } = await client.exchangePublicToken(publicToken).catch(handleError);

    const {accounts, item} = await client.getAccounts(access_token).catch(handleError);

    const { transactions } = await client.getTransactions(access_token, startDate, endDate, {
        count: 250,
        offset: 0,
    }).catch(handleError);

    //console.log(transactions[1].amount);
    for (var i = 0; i < transactions.length; i++) {
        if (transactions[i].amount != null && transactions[i].amount > 0) {
            var change = transactions[i].amount - Math.floor(transactions[i].amount);
            // console.log(change.toFixed(2));
            if (change.toFixed(2) != 0) {
                changeArray.push(change.toFixed(2));
            }
        }
    }
    console.log(changeArray);
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
