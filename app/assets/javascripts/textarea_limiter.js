<script type="text/javascript">

<!-- From http://railsforum.com/viewtopic.php?id=42051 -->
$(document).ready(function() {
	var code = document.code_search.search;
	var remaining = document.code_search.remLen1;
	
	function textCounting(field,cntfield,maxlimit) {
	  if (field.value.length > maxlimit) // if too long...trim it!
	    field.value = field.value.substring(0, maxlimit);
	    // Set the value
	    // otherwise, update 'characters left' counter
	  else
	    cntfield.value = maxlimit - field.value.length;
	}
		
	$('#test').keydown(function() { textCounting(code, remaining, 5) });        
	$('#test').keyup(  function() { textCounting(code, remaining, 5) });    
});

</script>
