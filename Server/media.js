var express = require('express')
var router = express.Router()
var multer  =   require('multer')
var fs = require('fs')
var crypto = require('crypto')
var mv = require('mv')
var mime = require('mime')

var tmpDir = "./uploads/tmp/" // Directory to upload files to
var dir = "./uploads/" // Final resting place of files

// A checksum helper function
function checksum (str, algorithm, encoding) {
    return crypto
        .createHash(algorithm || 'md5')
        .update(str, 'utf8')
        .digest(encoding || 'hex')
}

// The diskStorage to use with multer
var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, tmpDir)
  },
  filename: function (req, file, cb) {
      cb(null, Date.now() + '.' + file.originalname)
  }
})

var upload = multer({
  storage: storage
 })

router.post('/photos/upload', upload.single("photo"), function (req, res, next) {
    //console.log(req.body); // form fields
    //console.log(req.file); // form files

    // Read in the uploaded file from the temp directory.
    fs.readFile(tmpDir + req.file.filename, function (err, data) {
        // Hash the file
        var hash = checksum(data) // e53815e8c095e270c6560be1bb76a65d

        // File extension
        var extension = mime.extension(req.file.mimetype)
        if(extension == "jpeg") {
          extension = "jpg"
        }

        // The new filename from the hash and mimetype
        var filename = hash + "." + extension

        // Move the file from the temp directory to the uploads directory with
        // hashed filenaeme
        mv(tmpDir + req.file.filename, dir + filename, function(err) {
          if(err)
            res.send(err)

          // Return the json object with the path to the file
          res.json({ path: "/static/" + filename }).end()
        })
    })
})

module.exports = router
