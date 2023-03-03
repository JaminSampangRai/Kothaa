const mongoose = require('mongoose');


const schema = mongoose.Schema;

const userSchema = new schema({
    name: {
        type: String,
        required: true,
        min: 2,
        max: 50,
    },
    email: {
        type: String,
        required: true,
        unique: true,
    },
    password: {
        type: String,
        required: true,
        min: 8,
        max: 50,
    },
},
{
    timestamps: true,
}
);

module.exports = mongoose.model("UserModel",userSchema);