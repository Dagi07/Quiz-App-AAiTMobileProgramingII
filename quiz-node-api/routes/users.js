var express = require('express');
var router = express.Router();
const User = require('../models/users');
const bcrypt = require('bcrypt');
const passport = require('passport');

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('a');
});


router.get('/all', function(req, res, next) {
  User.find({})
        .then(data => {
          res.json(data);
        });
  
});

router.post('/register', (req, res, next) => {
    const {username, password, email} = req.body;

    let errors = [];

    User.find({email:email})
        .then(user => {
          if(user.length > 0) {
            res.send("user already exists");
          } else {
            const newUser = User({
              username,
              password,
              email,
            });
            bcrypt.genSalt(12, (err, salt) => 
              bcrypt.hash(newUser.password, salt, (err, hash) => {
                if (err) throw err;

                newUser.password = hash;
                newUser.save()
                    .then(user => {
                      res.status(200).redirect('/');
                    })
                    .catch(err => console.log(err));
              }));



          }
        });

});


router.get("/incorrectlogin", (req,res) => {
  res.send("incorrect login");
});

router.get("/login", (req, res, next) => {
  res.send("login page");
});

router.post("/login", passport.authenticate('local', {
  successRedirect: "/",
  failureRedirect: "/users/incorrectlogin"
}));

router.get("/logout", function(req, res){    
  req.logout();    
  res.redirect("/users/login");
});


module.exports = router;
