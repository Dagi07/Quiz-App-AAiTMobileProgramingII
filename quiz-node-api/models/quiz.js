var mongoose = require('mongoose');
const { CategorySchema } = require('./category');
const Schema = mongoose.Schema;


var quizSchema = mongoose.Schema({
    question: {
        type: String,
        required: true,
    },
    choices: {
        type: [String],
        required: true,
    },
    answer: {
        type: Number,
        required: true,
    },
    category: {
        type: CategorySchema,
        required: true, 
    },
});

module.exports = mongoose.model('Quiz', quizSchema);
