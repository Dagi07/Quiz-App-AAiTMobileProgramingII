var mongoose = require('mongoose');
const Schema = mongoose.Schema;


var categorySchema = mongoose.Schema({
    name: {type: String, required: true},
});

var model = mongoose.model('Category', categorySchema);
module.exports.Category = model;
module.exports.CategorySchema = categorySchema;