var mongoose = require('mongoose');
const Schema = mongoose.Schema;


var userSchema = mongoose.Schema({
    username: String,
    password: String,
    email: String,
});

module.exports = mongoose.model('User', userSchema);
