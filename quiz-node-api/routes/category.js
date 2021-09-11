var express = require("express");
var router = express.Router();
const ObjectID = require("mongodb").ObjectID;
const {Category} = require("../models/category");
// const { ensureAuthenticated } = require("../config/auth");

router.post("/", async (req, res, next) => {
  try {
    const document = req.body;
    let newCategory = new Category({
      name: req.body.name,
    });

    await newCategory.save();
    res.status(201).json(newCategory);
  } catch (e) {
    next(e);
  }
});

router.get("/", async (req, res, next) => {
  try {
    Category.find({}).then((data) => {
      res.json(data);
    });
  } catch (e) {
    next(e);
  }
});

router.patch("/:id", async (req, res, next) => {
  try {
    var result = await Category.findByIdAndUpdate(req.params.id, req.body, {new: true});

    res.send(result);
  } catch (e) {
    next(e);
  }
});

/* DELETE a question with specified id. */
router.delete("/:id", async (req, res, next) => {
  try {
    const deletedCategory = await Category.deleteOne({ _id: req.params.id }).exec();
    res.json(deletedCategory);
  } catch (e) {
    next(e);
  }
});

module.exports = router;
