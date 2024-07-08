const mysql     = require('mysql2')
const db = require("../config/database").db

module.exports = 
{
    get_semua_user: function () {
        let sql = mysql.format(
                `SELECT * from user`
        )

    
        return new Promise ((resolve,reject)=>{
            db.query(sql,function(errorSql,hasil){
                if (errorSql){
                    reject(errorSql)
                } else {
                    resolve(hasil)
                }
            })
        })
        
    },


    tambah:function (req) {
        let data ={
            username        : req.body.form_username,
            password        : bcrypt.hashSync(req.body.form_password),
            nama_lengkap    : req.body.nama_lengkap,   
        }

        let sql = mysql.format(
            `insert into user set ?`,
            [data]
        )
    
        return new Promise ((resolve,reject)=>{
            db.query(sql,function(errorSql,hasil){
                if (errorSql){
                    reject(errorSql)
                } else {
                    resolve(hasil)
                }
            })
        })
        
    },

}