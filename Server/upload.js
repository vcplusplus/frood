var express = require('express');
var router = express.Router();
var multer  =   require('multer');

var upload = multer({ dest: 'uploads/' });

router.post('/photo', upload.single("photo"), function (req, res, next) {
    //console.log(req.body); // form fields
    //console.log(req.file); // form files
    var toReturn = {
      id: req.file.filename
    }
    res.json(toReturn).end();
});


module.exports = router;
