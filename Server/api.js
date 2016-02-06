// Require everything that's necessary
var express    = require('express')

// create our router
var router = express.Router()

// test route to make sure everything is working (accessed at GET http://localhost:8080/api)
router.get('/', function(req, res) {
	res.json({ message: 'hooray! welcome to our api!' })
})

module.exports = router
