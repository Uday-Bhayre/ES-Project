const express=require('express');
const index=express();

const readingRoutes=require('./Routes/readingRoutes');

const{dbConnect}=require('./Configuration/database').dbConnect();
require('dotenv').config();

const PORT = process.env.PORT || 5000;

index.use("/api/v1",readingRoutes);
index.use(express.json());

index.get("/",(req,res)=>{
    return res.json({
        success:true,
        message:"server is running...."
    })
})

index.listen(PORT,()=>{
    console.log(`App is running at ${PORT} port`);
})
