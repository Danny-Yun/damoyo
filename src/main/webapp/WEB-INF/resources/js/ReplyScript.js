/**
 * 
 */

var bno = 2311;
$.getJSON("/replies/all/" + bno, function(data){
	console.log(data.length);
})