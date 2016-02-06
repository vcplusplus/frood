// BASE SETUP
// =============================================================================

// call the packages we need
var express = require('express')
var bodyParser = require('body-parser')
var app = express()
var morgan = require('morgan')

// configure app
app.use(morgan('dev')) // log requests to the console

// configure body parser
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())

var port = process.env.PORT || 80 // set our port

// ROUTES FOR OUR API
// =============================================================================
var router = new express.Router()

router.get("/", function(req, res) {
	res.json({ message: 'The API is at /api' })
})

// /static serves the /uploads folder
app.use('/static', express.static('uploads'))

// Connect to the database
var mongoose = require('mongoose')
mongoose.connect('mongodb://localhost:27017') // connect to our database

// CREATE ROUTES ---------------------------------
var api = require("./api") // Create /api router
var events = require('./events') // Create /api/event router
var media = require('./media') // Create /api/media

// REGISTER OUR ROUTES -------------------------------
app.use('/', router)
app.use('/api', api)
app.use('/api/events', events)
app.use('/api/media', media)

// START THE SERVER
// =============================================================================
app.listen(port)
console.log('Magic happens on port ' + port)
