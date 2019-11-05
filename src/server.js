const express = require('express');
const mysql = require('mysql');
const bodyparser = require('body-parser');
const path = require('path');

const app = express();
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');
app.use(bodyparser.urlencoded({
    extended: true
  }));

let mysqlConnect = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'Admin',
    database:'gestcom'
});

mysqlConnect.connect((err)=>{
if(!err){
    console.log('database connection success');
} else {
    console.log('database connection faile \n Error : ' + JSON.stringify(err, undefined, 2));
}

});

app.listen(3000, function () {
  console.log('Example app listening on port 3000 !');
});

app.get('/', function (req, res) {
    mysqlConnect.query('SELECT * FROM client', (err, rows, fields)=>{
        if(!err){
            res.render('client', {
                title: 'Liste Of Clients',
                clients: rows
            });
        } else{
            console.log(err);
        }
    });
});

app.post('/', function(req, res){
    const data = req.body;
    console.log(req.body)
    mysqlConnect.query('INSERT INTO client set ?', data, (err, client) => {
        console.log(client);
        res.redirect('/');
      });
});

app.get('/client/:id', function (req, res) {
    mysqlConnect.query('SELECT * FROM client WHERE id_client = ?',[req.params.id], (err, rows, fields)=>{
        if(!err){
            res.send(rows);
            console.log(rows);
        } else{
            console.log(err);
        }
    });
});

app.get('/client/commande/:id', function (req, res) {
    mysqlConnect.query('SELECT * FROM commande WHERE id_client = ?',[req.params.id], (err, rows, fields)=>{
        if(!err){
            res.render('commande',{
                title: 'Details Of Commande',
                commandes: rows
            });
            console.log(rows);
        } else{
            console.log(err);
        }
    });
});

app.get('/client/commande/details-commande/:id', function (req, res) {
    mysqlConnect.query('SELECT * FROM commande_produit WHERE id_commande = ?',[req.params.id], (err, rows, fields)=>{
        if(!err){
            res.send(rows);
            console.log(rows);
        } else{
            console.log(err);
        }
    });
});

app.get('/client/commande/details-commande/produit/:id', function (req, res) {
    mysqlConnect.query('SELECT * FROM produit WHERE id_produit = ?',[req.params.id], (err, rows, fields)=>{
        if(!err){
            res.send(rows);
            console.log(rows);
        } else{
            console.log(err);
        }
    });
});

app.get('/ville', function (req, res) {
    mysqlConnect.query('SELECT * FROM ville', (err, rows, fields)=>{
        if(!err){
            res.render('client', {
                villes: rows
            });
            console.log(rows);
        } else{
            console.log(err);
        }
    });
});