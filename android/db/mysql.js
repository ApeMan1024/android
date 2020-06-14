let mysql=require("mysql")
let {MYSQL_CONF}=require("../config/db");

const conn=mysql.createConnection(MYSQL_CONF)

conn.connect((err)=>{
    if(err)console.log(err)
})

//封装的一个进行增删改查的函数
function exec(sql,arr=null){
    return new Promise((resolve,reject)=>{
        conn.query(sql,arr,(err,result)=>{
            if(err){
                return reject(err)
            }
            resolve(result)
        })
    })
}

module.exports={
    exec
}