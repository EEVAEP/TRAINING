
function confirmDelete(pageid) {
	console.log(pageid);
    	$('#deletePageId').val(pageid);
    	$('#confirmModal').show(); 
    	$('#modalOverlay').show(); 
}


function deletePage() {
    	var pageid = $('#deletePageId').val(); 

    	$.ajax({
        	type: "POST",
        	url: "delete_page.cfm",
        	data: { pageid: pageid },
        	success: function(response) {
            		$('#confirmModal').hide();
            		$('#modalOverlay').hide(); 
            		alert(response); 
            		location.reload(); 
        	},
        	error: function() {
            		alert("Error while deleting the page.");
        }
    });
}

function closeModal() {
	$('#confirmModal').hide();
    	$('#modalOverlay').hide();
}
