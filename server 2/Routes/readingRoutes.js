const express=require("express");
const router=express.Router();

router.use(express.json());

const{getReadings}=require('../Controllers/getReading');
const{addReadings}=require('../Controllers/addReading');
const{addDiseases}=require('../Controllers/addDiseases');
const{getDiseases,getAllDiseases}=require('../Controllers/getDiseases');


router.post("/getReadings",getReadings);
router.post("/addReadings",addReadings);
router.post("/addDiseases",addDiseases);
router.post("/getDiseases",getDiseases);
router.get("/getAllDiseases",getAllDiseases);

module.exports=router;