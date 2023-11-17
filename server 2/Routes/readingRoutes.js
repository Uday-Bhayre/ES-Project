const express=require("express");
const router=express.Router();

router.use(express.json());

const{getReadings}=require('../Controllers/getReading');
const{addReadings}=require('../Controllers/addReading');


router.post("/getReadings",getReadings);
router.post("/addReadings",addReadings);

module.exports=router;