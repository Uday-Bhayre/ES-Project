const Diseases=require('../Models/Diseases');

exports.addDiseases=async(req,res)=>{
    try {
        const {title,description,level,range}=req.body;
        const addedDiseases=await Diseases.create({
            title:title,
            description:description,
            level:level,
            range:range
        });

        return res.status(200).json({
            success:true,
            message:"Diseases added successfully"
        })
    } catch (error) {
        console.log(error.message);
        return res.status(500).json({
            success:false,
            message:error.message
        })
    }
}