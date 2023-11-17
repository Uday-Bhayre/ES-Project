const Readings = require("../Models/Readings");

exports.addReadings=async(req,res)=>{
    try {
        const{name,typeofarea,day,time,avg,max}=req.body;
        if(!name||!typeofarea||!day||!time||!avg||!max){
            return res.status(400).json({
                success:false,
                message:"All fields are not sent"
            })
        }

        const newReading=await Readings.create({
            name:name,
            typeofarea:typeofarea,
            time:time,
            day:day,
            avg:avg,
            max:max
        });

        return res.status(200).json({
            success:true,
            message:"Reading added successfully",
            reading:newReading
        })
    } catch (error) {
        console.log(error.message);
        return res.status(500).json({
            success:false,
            message:error.message
        })
    }
}