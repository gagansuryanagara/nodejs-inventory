const m_produk = require("../model/m_produk")
const { form_tambah } = require("./c_user")

module.exports = 
{
    index: async function(req,res){
        let dataview = {
            req: req,
            konten: "master-produk/index",
            uri_segment: req.path.split("/"),
            produk: await m_produk.get_semua_produk(),
        }
        res.render("template/struktur", dataview)
    },


    form_tambah: async function (req,res) {
        let dataview = {
            konten: "master-produk/form-tambah",
            uri_segment: req.path.split("/"),
            info_error : null,
            kategori: await m_produk.get_semua_kategori(),
        }
        res.render("template/struktur", dataview)
    },

    proses_simpan:async function (req,res) {
        try{
            let insert = await m_produk.tambah(req)
            let isi_notif = `berhasil menambah produk baru` 
            if(insert.affectedRows > 0){
                res.redirect(`/master-produk?note=sukses&pesan=${isi_notif}`)
            }
        } catch (error) {
            let dataview = {
                konten  : "master-produk/form-tambah",
                req : req,
                uri_segment: req.path.split("/"),
                info_error  : error,
            }
            res.render("template/struktur",dataview)
        }
    },

    //Proses Delete
    proses_hapus:async function (req,res) {
        try{
            let hapus = await m_produk.hapus(req)
            let isi_notif = `berhasil menghapus produk` 
            if(hapus.affectedRows > 0){
                res.redirect(`/master-produk?note=sukses&pesan=${isi_notif}`)
            }
        } catch (error) {
            let dataview = {
                konten  : "master-produk",
                req : req,
                uri_segment: req.path.split("/"),
                info_error  : error,
            }
            res.render("template/struktur",dataview)
        }
    },

    //Proses Edit
    form_edit: async function (req,res) {
        let dataview = {
            konten: "master-produk/form-edit",
            uri_segment: req.path.split("/"),
            info_error : null,
            kategori: await m_produk.get_semua_kategori(),
            produk: await m_produk.get_produk(req),
        }
        res.render("template/struktur", dataview)
    },

    proses_edit:async function (req,res) {
        try{
            let update = await m_produk.edit(req)
            let isi_notif = `berhasil mengedit produk` 
            if(update.affectedRows > 0){
                res.redirect(`/master-produk?note=sukses&pesan=${isi_notif}`)
            }
        } catch (error) {
            let dataview = {
                konten  : "master-produk/form-edit",
                req : req,
                uri_segment: req.path.split("/"),
                info_error  : error,
            }
            res.render("template/struktur",dataview)
        }
    },



}