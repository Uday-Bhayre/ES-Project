const Readings = require("../Models/Readings");

exports.getReadings=async(req,res)=>{
    
    const{name,typeofarea,day,time}=req.body;
    const arr=["9-10","13-14","17-18","21-22"];
    const arr1=["10-11","11-12","12-13"];
    const arr2=["14-15","15-16","16-17"];
    const arr3=["18-19","19-20","20-21"];
    
    if(arr.includes(time)){
        try {
            const finalReadings=await Readings.findOne({name:name,
            typeofarea:typeofarea,day:day,time:time});
            const avg=finalReadings.avg;
            const max=finalReadings.max;
    
            if(!finalReadings){
                return res.status(404).json({
                    message:"Data not found"
                })
            }
    
            return res.status(200).json({
                message:"Data fetched successfully",
                avg:`${avg}`,
                max:`${max}`
            })
        } catch (error) {
            console.log(error.message);
            return res.status(500).json({
                success:false,
                message:error.message
            })
        }
    }

    else if(arr1.includes(time)){
        try {
            const reading1=await Readings.findOne({name:name,
                typeofarea:typeofarea,day:day,time:"9-10"});
            const reading2=await Readings.findOne({name:name,
                typeofarea:typeofarea,day:day,time:"13-14"});
            const avg1=reading1.avg;
            const max1=reading1.max;

            const avg2=reading2.avg;
            const max2=reading2.max;
    
            if(!reading1 && !reading2){
                return res.status(404).json({
                    message:"Data not found"
                })
            }

            const times=time.split("-");
            const x=Number(times[0]);
            const p=9;

            const a1=((x-p)*avg2)/4;
            const a2=((4-x+p)*avg1)/4;

            const m1=((x-p)*max2)/4;
            const m2=((4-x+p)*max1)/4;

            const avg=(a1+a2).toFixed(2);
            const max=(m1+m2).toFixed(2);

            return res.status(200).json({
                message:"Data fetched successfully",
                avg:`${avg}`,
                max:`${max}`
            })
        } catch (error) {
            console.log(error.message);
            return res.status(500).json({
                success:false,
                message:error.message
            })
        }
    }

    else if(arr2.includes(time)){
        try {
            const reading1=await Readings.findOne({name:name,
                typeofarea:typeofarea,day:day,time:"13-14"});
            const reading2=await Readings.findOne({name:name,
                typeofarea:typeofarea,day:day,time:"17-18"});
            const avg1=reading1.avg;
            const max1=reading1.max;

            const avg2=reading2.avg;
            const max2=reading2.max;
    
            if(!reading1 && !reading2){
                return res.status(404).json({
                    message:"Data not found"
                })
            }

            const times=time.split("-");
            const x=Number(times[0]);
            const p=13;

            const a1=((x-p)*avg2)/4;
            const a2=((4-x+p)*avg1)/4;

            const m1=((x-p)*max2)/4;
            const m2=((4-x+p)*max1)/4;

            const avg=(a1+a2).toFixed(2);
            const max=(m1+m2).toFixed(2);

            return res.status(200).json({
                message:"Data fetched successfully",
                avg:`${avg}`,
                max:`${max}`
            })
        } catch (error) {
            console.log(error.message);
            return res.status(500).json({
                success:false,
                message:error.message
            })
        }
    }

    else if(arr3.includes(time)){
        try {
            const reading1=await Readings.findOne({name:name,
                typeofarea:typeofarea,day:day,time:"17-18"});
            const reading2=await Readings.findOne({name:name,
                typeofarea:typeofarea,day:day,time:"21-22"});
            const avg1=reading1.avg;
            const max1=reading1.max;

            const avg2=reading2.avg;
            const max2=reading2.max;
    
            if(!reading1 && !reading2){
                return res.status(404).json({
                    message:"Data not found"
                })
            }

            const times=time.split("-");
            const x=Number(times[0]);
            const p=17;

            const a1=((x-p)*avg2)/4;
            const a2=((4-x+p)*avg1)/4;

            const m1=((x-p)*max2)/4;
            const m2=((4-x+p)*max1)/4;

            const avg=(a1+a2).toFixed(2);
            const max=(m1+m2).toFixed(2);

            return res.status(200).json({
                message:"Data fetched successfully",
                avg:`${avg}`,
                max:`${max}`
            })
        } catch (error) {
            console.log(error.message);
            return res.status(500).json({
                success:false,
                message:error.message
            })
        }
    }

}