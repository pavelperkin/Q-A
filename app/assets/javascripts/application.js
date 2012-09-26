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
var global_answ_id;

 $(document).ready(function() {  

    
   $("#answ").click(function(){    
    text=document.getElementById('answer');
    q_id=document.getElementById('q_id'); 
    data = {}
    data["data"] =text.value 
    data['q_id']=($('span#q_id').text())
    $.ajax({
            type: "POST",
             url: "../answers/save",
            data: data,
            async:false,
            success: function(msg){              
              console.log(msg); 
            }
        });
        alert('Thank you for your answer!');
        location.reload();
   })   
   
   
   $("#like").click(function(){       
    q_id=document.getElementById('q_id'); 
    data = {}    
    data['q_id']=($('span#q_id').text())
    console.log(data['q_id'])
    $.ajax({
            type: "POST",
             url: "like",
            data: data,    
            async:false,  
            success: function(msg){   
              $('span#like_c').text(msg.data)
              console.log(msg);
            }
        });
        $("#like").css('display', 'none');
       
   })   
   
   $("span.com").click(function(){    
     $("div.comment").css('display', 'block');
     $("div.comment").css('height', '40%');
     $("div.comment").css('opacity', '1');
     global_answ_id=this.id
     
     return global_answ_id
     
   })  

   
   $("#close").click(function(){ 
         $("div.comment").animate({
            height: "-20%",
            opacity: 0,            
          }, 1500, function(){$("div.comment").css('display', 'none');} );
     
   })  
   
   
   
   $('span.inc').click(function(){ 
    data = {}    
    data['a_id']=this.className.replace("inc", "")
        $.ajax({
            type: "POST",
             url: "../answers/rank_inc",
            data: data,    
            async:false,  
            success: function(msg){                 
              str='span.'+msg.id;      
              $(str).text(msg.data);  
             
            }
        });
       
   
   })
   
      $('span.dec').click(function(){
    data = {}    
    data['a_id']=this.className.replace("dec", "")
        $.ajax({
            type: "POST",
             url: "../answers/rank_dec",
            data: data,    
            async:false,  
            success: function(msg){                 
              str='span.'+msg.id;      
              $(str).text(msg.data);  
             
            }
        });      
    })

  $("#add_com").click(function(){    
    text=document.getElementById('comt');
    q_id=document.getElementById('q_id');
    data = {}
    data["data"] =text.value ;
    data['a_id']=global_answ_id;
    data['q_id']=($('span#q_id').text());
    alert(q_id)
    $.ajax({
            type: "POST",
             url: "../comments/save",
            data: data,
            async:false,
            success: function(msg){              
              console.log(msg); 
            }
        });
        alert('Thank you for your comment!');
        location.reload();
   })   
   
   
   
   
 });