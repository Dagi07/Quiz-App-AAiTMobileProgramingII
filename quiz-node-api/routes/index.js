var express = require('express');
var router = express.Router();

/* GET welcome page */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});


/* GET home page. */
router.get('/home', ensureAuthenticated,function(req, res, next) {
  res.send("Home page");
});

module.exports = router;
