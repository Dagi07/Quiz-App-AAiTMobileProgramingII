var express = require('express');
var router = express.Router();
const ObjectID = require('mongodb').ObjectID;
const Quiz = require('../models/quiz');
const {ensureAuthenticated } = require("../config/auth");


router.post('/', async (req, res, next) => {
  const document = req.body;
  console.log("document is ");
  console.log(document);
  
  try {
    let newQuiz = new Quiz({
      question: req.body.question,
      choices: req.body.choices,
      answer: req.body.answer,
      category: req.body.category,
    });
  
    await newQuiz.save();
    res.status(202).json(newQuiz);
  } catch(e) {
    next(e);
  }
  
});

router.get('/', async (req, res, next) => {
  console.log("heree aa name");
  console.log(req.params);

  const requiredCategoryName = req.query.categoryname;


  Quiz.find({
    'category.name': new RegExp(requiredCategoryName, "i"),
  })
        .then(data => {
          res.json(data)
        });

});



router.patch('/:id',async (req, res, next) => {
  var updateObject = req.body; // {last_name : "smith", age: 44}
  const id = ObjectID(req.params.id);
  await Quiz.findByIdAndUpdate(req.params.id, req.body);

  res.send(updateObject);
});

router.delete('/:id',async (req, res, next) => {
  const deletedQuiz = await Quiz.deleteOne({_id: req.params.id}).exec();
  // res.send(deletedQuiz);
  res.json(deletedQuiz);
});

module.exports = router;
