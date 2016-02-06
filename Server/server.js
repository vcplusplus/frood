// BASE SETUP
// =============================================================================

// call the packages we need
var express    = require('express');
var bodyParser = require('body-parser');
var app        = express();
var morgan     = require('morgan');

// configure app
app.use(morgan('dev')); // log requests to the console

// configure body parser
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var port = process.env.PORT || 8080; // set our port

// ROUTES FOR OUR API
// =============================================================================
var router = new express.Router();

// middleware to use for all requests
router.use(function(req, res, next) {
	// do logging
	//console.log('Something is happening.');
	next();
});

router.get("/", function(req, res) {
	res.json({ message: 'The API is at /api' });
});

// Connect to the database
var mongoose   = require('mongoose');
mongoose.connect('mongodb://localhost:27017'); // connect to our database

// Create /api router
var api = require("./api");

// Create /api/event router
var events = require('./events');

// Create /api/upload
var upload = require('./upload');

// REGISTER OUR ROUTES -------------------------------
app.use('/', router);
app.use('/api', api);
app.use('/api/events', events);
app.use('/api/upload', upload);

// START THE SERVER
// =============================================================================
app.listen(port);
console.log('Magic happens on port ' + port);
