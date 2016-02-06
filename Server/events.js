var express = require('express');
var router = express.Router();

// ------------
// /events api
// ------------

// Get the events Schema
var Event = require('./app/models/event');

// on routes that end in /events
// ----------------------------------------------------
router.route('/')

  // create a event (accessed at POST http://localhost:8080/events)
  .post(function(req, res) {

    var event = new Event();
    event.name = req.body.name;
    event.description = req.body.description;
    event.location = req.body.location;
    event.host = req.body.host;
    event.start = new Date(req.body.start);
    event.end = new Date(req.body.end);
    event.tags = req.body.tags;

    event.save(function(err) {
      if (err)
        res.send(err);

      res.json("Successfully added event");
    });
  })

  // get all the events (accessed at GET http://localhost:8080/api/events)
  .get(function(req, res) {
    Event.find(function(err, events) {
      if (err)
        res.send(err);

      res.json(events);
    });
  });

router.route('/:event_id')
  // get the event with that id
  .get(function(req, res) {
    Event.findById(req.params.event_id, function(err, event) {
      if (err)
        res.send(err);
      res.json(event);
    });
  })

  // update the event with this id
  .put(function(req, res) {
    Event.findById(req.params.event_id, function(err, event) {
      if (err)
        res.send(err);

      if(req.body.name) {
        event.name = req.body.name;
      }
      if(req.body.description) {
        event.description = req.body.description;
      }
      if(req.body.location) {
        event.location = req.body.location;
      }
      if(req.body.host) {
        event.host = req.body.host;
      }
      if(req.body.start) {
        event.start = new Date(req.body.start);
      }
      if(req.body.end) {
        event.end = new Date(req.body.end);
      }
      if(req.body.tags) {
        event.tags = req.body.tags;
      }

      event.save(function(err) {
        if (err)
          res.send(err);
        res.json(event);
      });
    });
  })

  // delete the event with this id
  .delete(function(req, res) {
    Event.remove({
      _id: req.params.event_id
    }, function(err, event) {
      if (err)
        res.send(err);

      res.json({ message: 'Successfully deleted' });
    });
  });

// Report
router.route('/:event_id/report')
  .put(function(req, res) {
    Event.findById(req.params.event_id, function(err, event) {
      if (err)
        res.send(err);

      event.reports += 1;
      event.save(function(err) {
        if (err)
          res.send(err);
        res.json(event);
      });
    });
  });

// Heart
router.route('/:event_id/heart')
  .put(function(req, res) {
    Event.findById(req.params.event_id, function(err, event) {
      if (err)
        res.send(err);

      event.hearts += 1;
      event.save(function(err) {
        if (err)
          res.send(err);
        res.json(event);
      });
    });
  })
  .delete(function(req,res) {
    Event.findById(req.params.event_id, function(err, event) {
      if (err)
        res.send(err);

      if(event.hearts >= 1) {
        event.hearts -= 1;
      }

      event.save(function(err) {
        if (err)
          res.send(err);
        res.json(event);
      });
    });
  });


module.exports = router;
