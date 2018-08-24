// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require_tree 


window.addEventListener('load', function(){
 	var userEmail = $('#current_user_email').html();
 	if (userEmail){
 		var socket = io.connect('http://localhost:8000');
 		socket.on('connect', function(){
			console.log('handshake completed, connected to chat server');
 			socket.emit('join_chat_room', {
				'chatroom_name': 'android_room',
				'user_email': userEmail
			});
 			socket.on('new_user_joined', function(data){
				new Noty({
				    text: data.user_email + ' joined!',
				    theme: 'relax',
				    type: 'success',
				    layout: 'bottomLeft',
				    timeout: 1000
				}).show();
			});
 			$('#send-message').unbind('click');
			$('#send-message').click(function(){
				let msg = $('#chat-message-input').val();
 				if (msg != ''){
 					socket.emit('send_message', {
						'message': msg,
						'user_email': userEmail,
						'chatroom_name': 'android_room'
					});
					$('#chat-message-input').val('');
 				}
 			});
		var scrollT = 0;
			socket.on('receive_message', function(data){
				console.log(data);
 				var messageType = 'self-message';
				if (data.user_email != userEmail){
					messageType = 'other-message';
				}
 				var newMessage = $('<li>', {
					'class': messageType
				});
 				var messageText = $('<span>', {
					'html': data.message + '<br>' + data.user_email
				});
 				newMessage.append(messageText);
				$('#chat-messages-list').append(newMessage);
				
				scrollT += 100
				$('#chat-messages-list').animate({
				  scrollTop: scrollT
				}, 100);
 			});
 		});
	}
   var xyz =document.getElementById("minimize");
   var abc =document.getElementById("maximize");

   xyz.addEventListener('click',function(){

   var x = document.getElementById("chat-messages-list");
   var y = document.getElementById("chat-message-input-container");

   x.style.display = "none";
   y.style.display = "none";

   var z = document.getElementById("user-chat-box");

   z.style.height = "28px";

   var h = document.getElementById("user-chat-box-header");

   h.style.height = "100%";
   });

   abc.addEventListener('click' , function(){
   var x = document.getElementById("chat-messages-list");
   var y = document.getElementById("chat-message-input-container");
   var z = document.getElementById("user-chat-box");
   var h = document.getElementById("user-chat-box-header");

   z.style.height = "350px";
   h.style.height = "8%";

   x.style.display = "block";
   y.style.display = "flex";


   });
  
// $( "#user-search" ).autocomplete({
//             source: '/users/search',
//             minLength: 2,
//             select: function( event, ui ) {
                
//                // console.log(user_ids[]);
//                console.log(ui.item);
//                window.location = '/users/profile/' + ui.item.id;
//             }
//           });

});


   

