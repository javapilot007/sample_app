<script type="text/javascript">

<!-- Adapted from Script by hscripts.com (http://www.hscripts.com/scripts/JavaScript/character-count.php) -->
// text - text entry box
// remain - remaining characters field
// max - maximum # of characters
function limiter(text,remain,max) {
  var tex = text.value;
  var len = tex.length;
  if (len > max){
    tex = tex.substring(0,max);
    text.value =tex;
    return false;
  }
  remain.value = max-len;
}

</script>
