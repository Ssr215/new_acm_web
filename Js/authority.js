Date.prototype.Format = function(fmt)     
{ //author: meizz  
  var o = {     
    "M+" : this.getMonth()+1,                 //月份  
    "d+" : this.getDate(),                    //日  
    "h+" : this.getHours(),                   //小时  
    "m+" : this.getMinutes(),                 //分  
    "s+" : this.getSeconds(),                 //秒  
    "q+" : Math.floor((this.getMonth()+3)/3), //季度  
    "S"  : this.getMilliseconds()             //毫秒  
  };     
  if(/(y+)/.test(fmt))     
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));     
  for(var k in o)     
    if(new RegExp("("+ k +")").test(fmt))     
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));     
  return fmt;     
}; 

function change_end_time(){
	var x = document.getElementById("c_duration");
	var y = document.getElementById("c_end_time");
	var z = document.getElementById("c_begin_time");
	var re = /^[0-9]*[1-9][0-9]*$/;
	if( !re.test(x.value) ){
		alert("pleae input positive number!");
		x.value = 120;
	}
	var a = new Date(z.value).getTime();
	a = a + x.value * 60 * 1000;
	var b = new Date(a).Format("yyyy-MM-ddThh:mm:ss");
	//alert(b);
	y.value = b;
}

// $(function(){
// 	$('.add_row').click(function(e){
// 		var str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
// 		var x = document.getElementById('c_number');
// 		x.value = x.value + 1;
// 		x = x.value;
// 		var $html = $("<tr><td>"+str.substr(x-1,1)+"</td><td><input type=\'text\' name=\'pro_"+x+"\'></td><td><input type=\'text\' name=\'pro_"+x+"_name\'></td><td><a id=\'de_row\' onclick=\'sc()\'></a></td>");
// 		$('.mytable table ').append($html);
// 	});
// })
// function sc(){
// 	$('.mytable table tr').eq($(this).index()).remove();
// }