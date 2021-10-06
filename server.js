const express = require('express');
const app = express();
var nodemailer = require('nodemailer');
process.env['NODE_TLS_REJECT_UNAUTHORIZED'] = 0
var mysql = require('mysql');
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
app.set('view engine', 'pug');
app.use(express.static(__dirname + '/public'));


const server = app.listen(7000, () => {
  console.log(`Express running → PORT ${server.address().port}`);
});


app.get(['/','/homepage'], (req, res) => {
  res.render('homepage', {
      title:'Rabinical Seminary of America'      
  });
});
 app.get('/contactUs', (req, res) =>{
        res.render('contactUs',{
            title: 'Contact Us'
        });
 });
  app.get('/institutions', (req, res) =>{
      try{
          var allInstitutions = [];
          getInstitutions(allInstitutions, res);
      }
      catch(error)
      {
          console.log('database error');
      }      
  }); 
app.get('/joinmailinglist', (req, res) =>{
        res.render('joinmailinglist',{
            title: 'Join RSA Mailing List'
        });
 });
app.post('/form_action_contact_us', (req, res) => {
    //Send them a confirmation email
    sendAnEmail(req.body.name, req.body.number, req.body.message, req.body.email  );
    res.render('confirmationcontactus', {
        title: 'Confirmation',
        name: req.body.name
    });
});
app.post('/form_action_join_mailing_list', (req, res) => {
    joinMailingList(req, res);
    res.render('confirmationjoinmailinglist', {
        title: 'Confirmation',
        name: req.body.firstname + " " + req.body.lastname, 
        address: req.body.address,
        city:req.body.city,
        state:req.body.statecode,
        zip:req.body.zip,
        email:req.body.email,
        phone:req.body.phone     
    });
});
 

function sendAnEmail(name, number, message, email){
    
    var transport = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            user: 'rafisinger1996@gmail.com',
            pass: 'nospamf4'
        }
    });
    
    var mailOptions = {
        from: 'rafisinger1996@gmail.com', 
        to: 'rafisinger1996@gmail.com',
        subject: 'Message received from form submission', 
        html: '<h3>From: ' + name + '</h3>'+
        '<h3>Email Address: ' + email + '</h3>' +
        '<h3>Phone Number: ' + number + '</h3>' +
        '<h2>Message:</h2><p>' + message + '</p>',
    };
    
    transport.sendMail(mailOptions, function(error, info){
        if(error){
            console.log(error);
        }
    
        else {
            console.log('Email sent: ' + info.response);
        }
    });
 }


function getInstitutions(institutions, res){
    var conn = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "rsa2"
    });
    conn.connect(function(err){
        if(err) {
            console.log("Error connecting to database.");
            throw err;
        }
        else{
            console.log("connected to rsa2 database.");
        }
    var sql1 = 'select * from institution';
    conn.query(sql1, function(err, result, fields){
        if (err){
            console.log("error executing query");
            throw err;
        }
        for(var i = 0; i < result.length; i++){
            var institution = {
                'institution':result[i].institutionName,
                'type':result[i].institutionType,
                'city':result[i].city,
                'state':result[i].stateCode
            };
            institutions.push(institution);
        }
        res.render('institutions', {
            title: 'Institutions',
            list: institutions
        });
        });
    });    
}


function joinMailingList(req, res){
    var conn = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "rsa2"
    });
    conn.connect(function(err){
        if(err) {
            console.log("Error connecting to database.");
            throw err;
        }
        else{
            console.log("connected to rsa2 database.");
        }
    var sql1 = "insert into `mailinglist` values (null, ' " + req.body.firstname + "', '" + 
            req.body.lastname + "', '" + req.body.address + "', '" + req.body.city + "', '" + 
            req.body.statecode + "', '" + req.body.zip + "', '" + req.body.email + "', '" + 
            req.body.phone + "' )"; 
    conn.query(sql1, function(err, result, fields){
        if (err){
            console.log("error executing query");
            throw err;
        }
    });
  });
}
   
