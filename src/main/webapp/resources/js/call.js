$(document).ready(function(){
    // var btnCallGen = document.getElementsByClassName('btn-call-gen');

    // for (var i = 0; i < btnCallGen.length; i++) {
    //     btnCallGen.style.backgroundColor="black";
    // }
});
	
function selectGen() {
	$('input[name=callType]').val('일반');

    // hover, border change

    window.location = "";

}

function selectEmg() {
	$('input[name=callType]').val('긴급');

    // hover, border change


}
