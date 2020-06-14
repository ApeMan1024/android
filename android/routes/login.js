let express=require("express")
let url=require("url")
let router=express.Router();

let {
    login,
    regist,
    reset,
    getmoney,
    feedback,
    getOrderTeach,
    getTeacherList,
    parReserve,
    orderlist,
    teacher,
    getSelectTeach,
    getReward}=require("../controller/login")

//登录路由
router.post("/par_login",(req,res,next)=>{
    login(req.body.phone,req.body.paswd).then(data=>{
        if(data>0)res.send("success")
        else res.send("false")
    })
})

//注册路由
router.post("/par_rege",(req,res,next)=>{
    regist(req.body.phone,req.body.paswd).then(data=>{
        if(data)res.send("success")
        else res.send("false")
    })
})

//修改用户信息
router.post("/par_reset",(req,res,next)=>{
    reset(req.body.phone,req.body.paswd).then(data=>{
        if(data)res.send("success")
        else res.send("false")
    })
})

//获取钱包信息
router.get("/money",(req,res,next)=>{
    getmoney(req.query.phone).then(data=>{
        if(data){
            res.json(data[0])
        }
        else res.send("")
    })
})


//意见反馈
router.post("/feedback",(req,res,next)=>{
    
    feedback(req.body).then(data=>{
        if(data){
            
            res.send("success")
        }
        else res.send("")
    })
})


//获取已经预约的教师列表
router.get("/get_order_teach",(req,res,next)=>{
    getOrderTeach(req.query.phone).then(data=>{
        if(data){
            console.log(data.join(","))
            res.send(data.join(","))
        }
        else res.send("")
    })
})


//获取教师信息
router.get("/teacher_detail",(req,res,next)=>{
    
    getTeacherList(url.parse(req.url,true).query.det_name).then(data=>{
        if(data){
            let obj={}
            obj["sex"]=data[0]["teach_sex"]
            obj["teach_phone"]=data[0]["teache_phonenum"]
            obj["address"]=data[0]["teach_address"]
            obj["exper"]=data[0]["teach_exper"]
            res.json(obj)
        }
        else res.send("")
    })
})


//预约教师
router.post("/par_reserve",(req,res,next)=>{
    
    parReserve(req.body).then(data=>{
        if(data){
            res.send("success")
        }
        else res.send("")
    })
})


//获取订单信息
router.get("/order",(req,res,next)=>{
    
    orderlist(req.query.phone).then(data=>{
        if(data){
            console.log(data)
            res.json(data)
        }
        else res.send("")
    })
})

//获取教师姓名
router.get("/teacher",(req,res,next)=>{
    
    teacher(req.query.subject_name).then(data=>{
        if(data){
            res.send(data.join(","))
        }
        else res.send("")
    })
})

//根据年级和课程获取教师信息
router.get("/get_select_teach",(req,res,next)=>{
    let query=url.parse(req.url,true).query
    getSelectTeach(query.sub_select,query.grade_select).then(data=>{
        if(data.length>0){
            res.send(data.join(","))
        }
        else res.send("error")
    })
})

//获取奖学卷
router.get("/reward",(req,res,next)=>{
    getReward(req.query.phone).then(data=>{
        if(data){
            res.json(data)
        }
        else res.send("")
    })
})



module.exports=router;