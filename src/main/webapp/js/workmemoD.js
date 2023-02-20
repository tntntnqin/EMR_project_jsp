function workmemoCheck(obj) {
	
	if (!obj.commentD.value || obj.commentD.value.trim().length == 0) {
		alert('내용이 입력되지 않았습니다.');
		obj.value = '';
		obj.focus();
		return false;
	}
	return true;
}


$(() => {
	$('#form').submit(function (event){
		
		let commentD = $.trim($('#commentD').val()).length; 
		if (commentD == 0) {
			event.preventDefault();
			$('#commentD')[0].reset();
			$('#commentD').focus(); 
		}
	})
})


function commentDelete(idx) {
	$('.delete').click(function() {		
		location.href = 'handoverDdeleteOK.jsp?idx=' + idx;
	})
}


function commentUpdate(idx) {
	$('.update').click(function() {	
		if ($('#commentD').val() == null) {
			alert('수정할 내용을 입력하세요');
			$('#commentD')[0].reset();
			$('#commentD').focus();
		} else {
			location.href = 'handoverDupdateOK.jsp?idx=' + idx +'&commentD=' + commentD.value;
		}
	})
}
 