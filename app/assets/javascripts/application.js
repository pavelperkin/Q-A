// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
var global_answ_id;  //global variable for answer_id
 $(document).ready(function() {  //function will be call when document will be ready
 global_q_id=document.getElementById('q_id').className;//global variable for quest_id
    
   $("#answ").click(function(){    // add new answer function
    text=document.getElementById('answer');    // get text of the answer from textarea
    data = {} // clean data
    data["data"] =text.value //push answer to data 
    data['q_id']=global_q_id //push  the quest_id to data
	$.ajax({ //ajax request
            type: "POST",  //request type
             url: "../answers/save",  //destination
            data: data, //data
            async:false, 
            success: function(msg){ //callback function              
              console.log(msg); // print response to console
            }
        });
        alert('Thank you for your answer!'); //print the message for user
        location.reload(); //update the page
   })   
   
   
   $("#like").click(function(){   // +1 for quest rank    
    data = {}  // clean data  
    data['q_id']=global_q_id 
    $.ajax({
            type: "POST",
             url: "like",
            data: data,    
            async:false,  
            success: function(msg){   //callback
              $('span#like_c').text(msg.data) //show new rank of quest
              console.log(msg);
            }
        });
        $("#like").css('display', 'none');//hide "+1" button
       
   })   
   
   $("span.com").click(function(){  //show commetn form
	 cssObj = {'display':'block', 'height':'40%', 'opacity':'1'}   
     $("div.comment").css(cssObj);
     return global_answ_id=this.id     //get answer_id
   })  
   
   $("#close").click(function(){ //close comment form without saving comment
         $("div.comment").animate({ //animation
            height: "-20%",
            opacity: 0,            
          }, 1500, function(){$("div.comment").css('display', 'none');} );
     
   })  
   
   
   
   $('span.inc').click(function(){ //increment answer rank
    data = {}    
    data['a_id']=this.className.replace("inc", "")//get answer_id
        $.ajax({
            type: "POST",
             url: "../answers/rank_inc",
            data: data,    
            async:false,  
            success: function(msg){                 
              str='span.'+msg.id;      
              $(str).text(msg.data);//update rank
             
            }
        });
       
   
   })
   
      $('span.dec').click(function(){ //decrement answer rank
    data = {}    
    data['a_id']=this.className.replace("dec", "")
        $.ajax({
            type: "POST",
             url: "../answers/rank_dec",
            data: data,    
            async:false,  
            success: function(msg){                 
              str='span.'+msg.id;      
              $(str).text(msg.data);  //update rank
             
            }
        });      
    })

  $("#add_com").click(function(){    //add comment
    text=document.getElementById('comt');
    data = {}
    data["data"] =text.value ;//get comment text
    data['a_id']=global_answ_id;//get answer_id
    data['q_id']=global_q_id;//get quest_id
    $.ajax({
            type: "POST",
             url: "../comments/save",
            data: data,
            async:false,
            success: function(msg){              
              console.log(msg); 
            }
        });
        alert('Thank you for your comment!');//message for user
        location.reload();//update page
   })      
 });