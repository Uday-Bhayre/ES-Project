const mongoose=require('mongoose');

const ReadingSchema= new mongoose.Schema({
    name:{
        type:String,
        required:true,
    },
    typeofarea:{
        type:String,
        required:true,
    },
    day:{
        type:String,
        enum:["Week","Weekend"]
    },
    time:{
        type:String,
    },
    avg:{
        type:Number
    },
    max:{
        type:Number
    }

});

module.exports=mongoose.model("Readings",ReadingSchema);