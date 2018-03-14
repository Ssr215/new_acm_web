function set_time(){
	var h = document.getElementById('t_h');
	var hs = h.innerText;
	var m = document.getElementById('t_m');
	var ms = m.innerText;
	var s = document.getElementById('t_s');
	var ss = s.innerText;
	// alert(hs);
	ss--;
	// alert(ss);
	if ( ss < 0 ) {
		ss = 59;
		ms--;
		if ( ms < 0 ) {
			ms = 59;
			hs--;
			if ( hs < 0 ) {
				alert("competition is over");
				window.location.reload();
				return;
			}
			if ( hs < 10 ) {
				h.innerText = '0'+hs;
			}else{
				h.innerText = hs;
			}
		}
		if ( ms < 10 ) {
			m.innerText = '0'+ms;
		}else{
			m.innerText = ms;
		}
	}
	if ( ss < 10 ) {
		s.innerText = '0'+ss;
	}else{
		s.innerText = ss;
	}
}
function set_time_befor(){
	var h = document.getElementById('t_h');
	var hs = h.innerText;
	var m = document.getElementById('t_m');
	var ms = m.innerText;
	var s = document.getElementById('t_s');
	var ss = s.innerText;
	// alert(hs);
	ss--;
	// alert(ss);
	if ( ss < 0 ) {
		ss = 59;
		ms--;
		if ( ms < 0 ) {
			ms = 59;
			hs--;
			if ( hs < 0 ) {
				alert("Game start");
				window.location.reload();
				return;
			}
			if ( hs < 10 ) {
				h.innerText = '0'+hs;
			}else{
				h.innerText = hs;
			}
		}
		if ( ms < 10 ) {
			m.innerText = '0'+ms;
		}else{
			m.innerText = ms;
		}
	}
	if ( ss < 10 ) {
		s.innerText = '0'+ss;
	}else{
		s.innerText = ss;
	}
}