const mongoose=require('mongoose');

const diseaseSchema=new mongoose.Schema({
    title:{
        type:String,
        required:true,
        trim:true
    },
    description:{
        type:String,
        required:true,
        trim:true
    },
    level:{
        type:String,
        required:true
    },
    range:{
        type:String,
        required:true
    }

});

module.exports=mongoose.model("Diseases",diseaseSchema);