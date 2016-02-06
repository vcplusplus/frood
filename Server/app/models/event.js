var mongoose = require('mongoose')
var Schema = mongoose.Schema

var EventSchema = new Schema({
	name: String,
  description: String,
	location: String,
	host: String,
  start: Date,
	end: Date,
	tags: [String],
	hearts: {
		type: Number,
		default: 0
	},
	reports: {
		type: Number,
		default: 0
	}
})

module.exports = mongoose.model('Event', EventSchema)
