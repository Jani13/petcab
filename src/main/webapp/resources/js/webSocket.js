
// $(function () {

// function setConnected(connected) {
//     $("#connect").prop("disabled", connected);
//     $("#disconnect").prop("disabled", !connected);
//     if (connected) {
//         $("#conversation").show();
//     }
//     else {
//         $("#conversation").hide();
//     }
//     $("#greetings").html("");
// }

// function connect() {
// var socket = new SockJS("/work/accept");
// stompClient = Stomp.over(socket);
//     stompClient.connect({}, function (frame) {
//         setConnected(true);
//         console.log('Connected: ' + frame);
//         stompClient.subscribe('/work/call/book/{callNo}/done', function (greeting) {
//             showGreeting(JSON.parse(greeting.body).content);
//         });
//     });
// }

// function disconnect() {
//     if (stompClient !== null) {
//         stompClient.disconnect();
//     }
//     setConnected(false);
//     console.log("Disconnected");
// }

// function sendName() {
//     stompClient.send("/work/greeting", {}, JSON.stringify({'name': $("#name").val()}));
// }

// function showGreeting(message) {
//     $("#greetings").append("<tr><td>" + message + "</td></tr>");
// }
//     $("form").on('submit', function (e) {
//         e.preventDefault();
//     });
//     $( "#connect" ).click(function(event) { 
// 		event.preventDefault();
// 		connect(); 
// 	});
//     $( "#disconnect" ).click(function(event) { 
// 		event.preventDefault();
// 		disconnect(); });
//     $( "#send" ).click(function(event) { 
// 		event.preventDefault();
// 		sendName(); });
// });