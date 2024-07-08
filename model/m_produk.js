const mysql     = require('mysql2')
const db = require("../config/database").db
const moment = require ("moment")
moment.locale("id")

module.exports = 
{
    get_semua_produk: function () {
        let sql = mysql.format(
                `SELECT * from master_produk`
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


    get_semua_kategori: function() {
        let sql = mysql.format(
            `SELECT * FROM master_kategori`
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
        let data = {
            kode            : req.body.form_kode,
            nama            : req.body.form_nama,
            deskripsi       : req.body.form_deskripsi,
            id_kategori     : req.body.form_kategori,
            dibuat_oleh     : req.session.user.id,
            dibuat_kapan    : moment().format("YYYY-MM-DD HH:mm:ss")
        }

        let sql = mysql.format(
            `insert into master_produk set ?`,
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

    //Fitur Delete
    hapus:function (req) {
       
        let sql = mysql.format(
            `DELETE FROM master_produk where id = ? `,
            req.params.id
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

    get_produk: function (req) {
        let sql = mysql.format(
                `SELECT * FROM master_produk WHERE id = ?`,
                req.params.id
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


    // Fitur Edit

    edit:function (req) {
        let data = {
            kode            : req.body.form_kode,
            nama            : req.body.form_nama,
            deskripsi       : req.body.form_deskripsi,
            id_kategori     : req.body.form_kategori,
            dibuat_oleh     : req.session.user.id,
            dibuat_kapan    : moment().format("YYYY-MM-DD HH:mm:ss")
        }

        let sql = mysql.format(
            `UPDATE master_produk SET kode = ? , nama = ? , deskripsi = ?, id_kategori = ?, dibuat_oleh = ?, dibuat_kapan = ? WHERE id = ?`,
            [data.kode, data.nama, data.deskripsi, data.id_kategori, data.dibuat_oleh, data.dibuat_kapan, req.body.form_id]
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