let {exec}=require("../db/mysql")
//登录路由
const login=async (phonenum,paswd)=>{
    let sql=`select * from parent where phonenum='${phonenum}' and paswd='${paswd}'`

    let result=await exec(sql);
    
    return result.length
}
//注册路由
const regist=async(phonenum,paswd)=>{
    let sql=`insert into parent(phonenum,paswd) value('${phonenum}','${paswd}')`
    
    let result=await exec(sql);

    return result!=0
}
//获取钱包信息
const getmoney=async (phonenum)=>{
    let sql=`select * from par_money where phonenum='${phonenum}'`
    let result=await exec(sql);
    let arr=result.map(item=>{
        return {...item}
    })
    return arr.length!=0?arr:false
}
//意见反馈
const feedback=async (evaluate)=>{
    let date1=new Date()
    let date=`${(date1.getFullYear()+"").padStart(4,"0")}
    -${(date1.getMonth()+1+"").padStart(2,"0")}
    -${(date1.getDate()+"").padStart(2,"0")}
       ${(date1.getHours()+"").padStart(2,"0")}:${(date1.getMinutes()+"").padStart(2,"0")}:${(date1.getSeconds()+"").padStart(2,"0")}`
    let sql=`insert into evaluate(par_phone,tea_phone,content,date,subject) 
    value('${evaluate["par_phone"]}','${evaluate["tea_phone"]}','${evaluate["content"]}','${date}','${evaluate["subject"]}')`
    let result=await exec(sql);
    return result!=0
}

//获取已经预约的教师列表
const getOrderTeach=async (paret_phone)=>{
    let sql=`select * from reserve where paret_phone=${paret_phone}`
    let result=await exec(sql);
    return result.map(item=>{
        return item.subject+" "+item.teach_name
    })
}
//获取教师信息
const getTeacherList=async(teache_name)=>{
    let sql=`select * from teacher where teache_name='${teache_name}'`

    let result=await exec(sql)

    return result.map(item=>{
        return {...item}
    })
}

//预约教师
const parReserve=async(reserve)=>{
    let sql="insert into reserve(paret_phone,teach_phone,teach_name,subject,data) value(?,?,?,?,?)"
    let result=await exec(sql,[
        reserve["par_phone"],
        reserve["teach_phone"],
        reserve["det_name"],
        reserve["subject_name"],
        reserve["data"],
    ])
    return result!=0
}

//获取订单信息
const orderlist=async(phone)=>{
    let sql=`select * from par_order where par_phone='${phone}'`

    let result=await exec(sql)


    return result.map(item=>{
        let obj={}
        obj["bookname"]=item["bookname"]
        obj["booknum"]=item["count"]
        obj["bookprice"]=item["price"]
        obj["ztai"]=item["state"]==="true"?"已收货":"正在发货"
        return obj
    })

}

//获取教师姓名
const teacher=async(teach_sub)=>{
    let sql=`select teache_name from teacher where teach_sub='${teach_sub}'`


    let result=await exec(sql)

    return result.map(item=>{
        return item["teache_name"]
    })
    
}
//根据年级和课程获取教师信息
const getSelectTeach=async (teach_sub,grade)=>{
    let sql=`select teache_name from teacher where teach_sub='${teach_sub}' and grade='${grade}'`

    let result=await exec(sql)

    return result.map(item=>{
        return item["teache_name"]
    })

}

//获取奖学卷
const getReward=async(phonenum)=>{
    let sql=`select acount as jine,data as endtime from par_reward where phonenum='${phonenum}'`

    let result=await exec(sql)

    return result.map(item=>{
        return {...item}
    })
}

//修改用户信息
const reset=async(phonenum,paswd)=>{
    let sql=`update parent set paswd='${paswd}' where phonenum='${phonenum}'`

    let result =await exec(sql)

    return result.affectedRows>0
}
module.exports={
    login,
    regist,
    getmoney,
    feedback,
    getOrderTeach,
    getTeacherList,
    parReserve,
    orderlist,
    teacher,
    getSelectTeach,
    getReward,
    reset
}