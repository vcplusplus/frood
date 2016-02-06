var express = require('express')
var router = express.Router()

// ------------
// /events api
// ------------

// Get the events Schema
var Event = require('./app/models/event')

// on routes that end in /events
// ----------------------------------------------------
router.route('/')

  // ----------------
  // Create Event
  // ----------------
  .post(function(req, res) {

    if(req.body.name && req.body.description && req.body.location && req.body.host && req.body.start && req.body.end && req.body.tags) {

      // Create the new event
      var event = new Event()

      event.name = req.body.name
      event.description = req.body.description
      event.location = req.body.location
      event.host = req.body.host
      event.start = new Date(req.body.start)
      event.end = new Date(req.body.end)
      event.tags = req.body.tags

      event.save(function(err, event) { // Save the event
        if (err)
          res.send(err)

        res.json({
          id: event.id,
          message: "Created!"
         })
      })
    } else {
      res.json({ message: "Error! You did not include all the required info." })
    }
  })

  // --------------------------
  // Get array of all events
  // --------------------------
  .get(function(req, res) {
    Event.find(function(err, events) {
      if (err)
        res.send(err)
      res.json(events)
    })
  })


// -------------------------------------
// /events/56b561b3f0d3303239000001
// -------------------------------------
router.route('/:event_id')

  // -------------------------------------
  // Get event by id
  // -------------------------------------
  .get(function(req, res) {
    Event.findById(req.params.event_id, function(err, event) {
      if (err)
        res.send(err)
      res.json(event)
    })
  })

  // -------------------------------------
  // Update event by id
  // -------------------------------------
  .put(function(req, res) {
    Event.findById(req.params.event_id, function(err, event) {
      if (err)
        res.send(err)

      if(req.body.name) {
        event.name = req.body.name
      }
      if(req.body.description) {
        event.description = req.body.description
      }
      if(req.body.location) {
        event.location = req.body.location
      }
      if(req.body.host) {
        event.host = req.body.host
      }
      if(req.body.start) {
        event.start = new Date(req.body.start)
      }
      if(req.body.end) {
        event.end = new Date(req.body.end)
      }
      if(req.body.tags) {
        event.tags = req.body.tags
      }

      event.save(function(err) {
        if (err)
          res.send(err)
        res.json({ message: "Updated!" })
      })
    })
  })

  // -------------------------------------
  // Delete event by id
  // -------------------------------------
  .delete(function(req, res) {
    Event.remove({
      _id: req.params.event_id
    }, function(err, event) {
      if (err)
        res.send(err);

      res.json({ message: 'Deleted!' })
    })
  })

// -------------------------------------
// Report event by id
// -------------------------------------
router.route('/:event_id/report')
  .put(function(req, res) {
    Event.findById(req.params.event_id, function(err, event) {
      if (err)
        res.send(err)
      event.reports += 1
      event.save(function(err) {
        if (err)
          res.send(err)
        res.json({ reports: event.reports })
      })
    })
  })

// ---------------------------------------
// /events/56b561b3f0d3303239000001/heart
// ---------------------------------------
router.route('/:event_id/heart')

  // -------------------------------------
  // Heart an event by id
  // -------------------------------------
  .put(function(req, res) {
    Event.findById(req.params.event_id, function(err, event) {
      if (err)
        res.send(err)
      event.hearts += 1
      event.save(function(err) {
        if (err)
          res.send(err)
        res.json({ hearts: event.hearts })
      })
    })
  })

  // -------------------------------------
  // Delete an event by id
  // -------------------------------------
  .delete(function(req,res) {
    Event.findById(req.params.event_id, function(err, event) {
      if (err)
        res.send(err)
      if(event.hearts >= 1) {
        event.hearts -= 1
      }
      event.save(function(err) {
        if (err)
          res.send(err)
        res.json({ hearts: event.hearts })
      })
    })
  })

module.exports = router
