const Diseases=require('../Models/Diseases');

exports.getDiseases=async(req,res)=>{
    const {noiseLevel}=req.body;
    console.log(noiseLevel);

    if(noiseLevel<50){
        try {
            const diseases=await Diseases.find({level:"Very Low Level"});
            console.log(diseases);
            if(diseases){
                return res.status(200).json({
                    success:true,
                    message:"Diseases fetched successfully",
                    diseases
                })
            }
            
        } catch (error) {
            console.log(error.message);
            return res.status(500).json({
            success:false,
            message:error.message
            })
        }
    }

    else if(noiseLevel<=55 && noiseLevel>=50){
        try {
            const diseases=await Diseases.find({level:"Low Level"});
            console.log(diseases);
            if(diseases){
                return res.status(200).json({
                    success:true,
                    message:"Diseases fetched successfully",
                    diseases
                })
            }
            
        } catch (error) {
            console.log(error.message);
            return res.status(500).json({
            success:false,
            message:error.message
            })
        }
    }

    else if(noiseLevel>55 && noiseLevel<70){
        try {
            const diseases=await Diseases.find({level:"Moderate Level"});
            console.log(diseases);
            if(diseases){
                return res.status(200).json({
                    success:true,
                    message:"Diseases fetched successfully",
                    diseases
                })
            }
            
        } catch (error) {
            console.log(error.message);
            return res.status(500).json({
            success:false,
            message:error.message
            })
        }
    }

    else if(noiseLevel>=70 && noiseLevel<=90){
        try {
            const diseases=await Diseases.find({level:"High Level"});
            console.log(diseases);
            if(diseases){
                return res.status(200).json({
                    success:true,
                    message:"Diseases fetched successfully",
                    diseases
                })
            }
            
        } catch (error) {
            console.log(error.message);
            return res.status(500).json({
            success:false,
            message:error.message
            })
        }
    }

    else if(noiseLevel>90){
        try {
            const diseases=await Diseases.find({level:"Very High Level"});
            console.log(diseases);
            if(diseases){
                return res.status(200).json({
                    success:true,
                    message:"Diseases fetched successfully",
                    diseases
                })
            }
            
        } catch (error) {
            console.log(error.message);
            return res.status(500).json({
            success:false,
            message:error.message
            })
        }
    }

    return res.status(404).json({
        success:false,
        message:"Diseases can't be found"
    })


}

exports.getAllDiseases=async(req,res)=>{

    try {
        const diseases=await Diseases.find();
        console.log(diseases);
        if(diseases){
            return res.status(200).json({
                success:true,
                message:"Diseases fetched successfully",
                diseases
            })
        }

        return res.status(404).json({
            success:false,
            message:"Diseases can't be found"
        })

        
    } catch (error) {
        console.log(error.message);
        return res.status(500).json({
        success:false,
        message:error.message
        })
    }   


}