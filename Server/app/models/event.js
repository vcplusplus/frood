var mongoose = require('mongoose')
var Schema = mongoose.Schema

var EventSchema = new Schema({
	name: String,
	photo: String,
  description: String,
	location: String,
	host: String,
  start: String,
	end: String,
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

// Duplicate the ID field.
EventSchema.virtual('id').get(function(){
    return this._id.toHexString();
});

// Ensure virtual fields are serialised.
EventSchema.set('toJSON', {
    virtuals: true
});

module.exports = mongoose.model('Event', EventSchema)
