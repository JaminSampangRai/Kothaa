// const express = require('express');
// const multer = require('multer');
// const router = express.Router();

// //set up storage engine
// const storage = multer.diskStorage({
//     destination: function(req, file, cb) {
//         cb(null,"./images/rooms");
        
//     },
//     filename: function (req, file, cb) {
//         cb(null,file.fieldname + "-"+ Date.now() + ".jpg");
//     }
// });

// //Initialize upload object
// const upload = multer({
//     storage: storage,
//     limits: {
//         fileSize: 5000000
//     },
//     fileFilter: function(req, file,cb) {
//         if(!file.originalname.match(/\.(jpg|jpeg|png)$/)){
//             return cb(new Error("Only images files are allowed"),false);
//         }
//         cb(null,true);
//     }
// }).array("images",5);

// //Route to hadle image upload 
// router.post("/upload-room-images", function(req,res) {
//     if(error) {
//         return res.status(400).send(error.message);

//     } 
//     // store the names of the uploaded images in an aray
//     const uploadedImages = req.files.map(file => file.filename);
//     //uploaded image save

//     return res.status(200).send("Images uploaded successfully");
// });
// // });

// module.exports = router;

const express = require("express");
const router = express.Router();
const multer = require("multer");
const upload = multer();
const roomFormController = require("../controller/roomController");
const validateRoomForm = require("../middleware/validationroomform");
const middlewareUpload = require("../middleware/upload");
const imageuploads = require("../middleware/imageupload");

// create a new room
router.post("/createroom",middlewareUpload.array("images",5),roomFormController.createRoomForm);


// upload.none()

//Get all room forms
router.get("/getroom", roomFormController.getAllRoomForms);

//get a single room by id 
router.get("/room/:id",roomFormController.getRoomFormById);

//update a room by id
router.put("/updateroom/:id", roomFormController.updateRoomFormById);

//delete a room by id
router.delete("/deleteroom/:id",roomFormController.deleteRoomFormById);

module.exports = router;

