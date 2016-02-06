var express = require('express');
var router = express.Router();
var multer  =   require('multer');
var fs = require('fs');

var directory = "uploads/";

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, './uploads/')
  },
  filename: function (req, file, cb) {
      cb(null, Date.now() + '.' + file.originalname);
  }
});

var upload = multer({ storage: storage } );

router.post('/photos/upload', upload.single("photo"), function (req, res, next) {
    //console.log(req.body); // form fields
    //console.log(req.file); // form files
    var toReturn = {
      id: req.file.filename
    }
    res.json(toReturn).end();
});

router.use('/photos/', express.static('uploads'));


module.exports = router;
