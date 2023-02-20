function workmemoCheck(obj) {
	
	if (!obj.commentP.value || obj.commentP.value.trim().length == 0) {
		alert('내용이 입력되지 않았습니다.');
		obj.value = '';
		obj.focus();
		return false;
	}
	return true;
}


$(() => {
	$('#form').submit(function (event){
		
		let commentP = $.trim($('#commentP').val()).length; 
		if (commentP == 0) {
			event.preventDefault();
			$('#commentP')[0].reset();
			$('#commentP').focus(); 
		}
	})
})


function commentDelete(idx) {
	$('.delete').click(function() {		
		location.href = 'workmemoPdeleteOK.jsp?idx=' + idx;
	})
}


function commentUpdate(idx) {
	$('.update').click(function() {	
		if ($('#commentP').val() == null) {
			alert('수정할 내용을 입력하세요');
			$('#commentP')[0].reset();
			$('#commentP').focus();
		} else {
			location.href = 'workmemoPupdateOK.jsp?idx=' + idx +'&commentP=' + commentP.value;
		}
	})
}
 