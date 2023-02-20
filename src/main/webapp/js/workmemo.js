function workmemoCheck(obj) {
	
	if (!obj.commentA.value || obj.commentA.value.trim().length == 0) {
		alert('내용이 입력되지 않았습니다.');
		obj.value = '';
		obj.focus();
		return false;
	}
	return true;
}


$(() => {
	$('#form').submit(function (event){
		
		let commentA = $.trim($('#commentA').val()).length; 
		if (commentA == 0) {
			event.preventDefault();
			$('#commentA')[0].reset();
			$('#commentA').focus(); 
		}
	})
})


function commentDelete(idx) {
	$('.delete').click(function() {		
		location.href = 'workmemoAdeleteOK.jsp?idx=' + idx;
	})
}


function commentUpdate(idx) {
	$('.update').click(function() {	
		if ($('#commentA').val() == null){
			alert('수정할 내용을 입력하세요');
			$('#commentA')[0].reset();
			$('#commentA').focus();
		} else {
			location.href = 'workmemoAupdateOK.jsp?idx=' + idx +'&commentA=' + commentA.value;
		}
	})
}
 