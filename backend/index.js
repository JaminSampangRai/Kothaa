const express = require('express');
const app = express();
const path = require('path');
const config = require('./config/app.config')
const mongoose = require('mongoose');
mongoose.set('strictQuery', false);


app.use(express.json());
app.use(express.urlencoded({ extended: true })); // for form data

mongoose.connect("mongodb://localhost:27017/room")
  .then(() => console.log("MongoDB connected..."))
  .catch(err => console.log(err));

//user signup login route
const routes = require('./routes/signupRoute')
app.use('/user',routes);


//room form route
const roomController = require("./routes/roomRoutes")
app.use('/roomapi',roomController);


// const imageupp = require("./routes/imageRoute")
// app.use("/upload",imageupp);





app.listen(3001, () => {
    console.log(`App is listening on port 3001`);
});


