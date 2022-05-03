<?php
  $stream_id = 0;
  if(isset($_GET['stream_id'])) $stream_id=trim($_GET['stream_id']); 
  if(isset($_POST['text_box'])) $stream_id=trim($_POST['text_box']);
  
  // Do some string validation
  if (strlen($stream_id)==11) {
          $myFile = "stream.id";
          $fh = fopen($myFile, 'w') or die("can't open file");
          fwrite($fh, $stream_id);
          fclose($fh);
          $SUCCESS=true;
          if (isset($_GET['stream_id'])) exit("SUCCESS, url updated: $stream_id\n");
  }
?>
<html>
    <body>
        <h1><?php if ($SUCCESS) echo "Successfully updated: $stream_id";?>
        <form name="form" method="post">
            <input type="text" name="text_box" size="15"/>
            <input type="submit" id="search-submit" value="submit" />
        </form>
        </h1>
    </body>
</html>
