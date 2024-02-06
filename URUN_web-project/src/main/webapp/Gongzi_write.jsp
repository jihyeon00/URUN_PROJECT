<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
 
</head>
<body>
  <?$board_id=$_GET['board_id'];?>
    <div id="board_write">
        <h4>게시글 작성</h4>
            <div id="write_area">
                <form enctype="multipart/form-data" action="write_ok.php?board_id=<?echo $board_id;?>" method="post">
                    <div id="in_title">
                        <textarea name="title" id="utitle" rows="1" cols="55" placeholder="제목" maxlength="100" required></textarea>
                    </div>
 
                    <div class="wi_line"></div>
                    <div id="in_content">
                        <textarea name="content" id="ucontent" placeholder="내용" required></textarea>
                    </div>
 
                      <input type="file" name="SelectFile" />
 
 
                    <div class="bt_se">
                        <button type="submit">글 작성</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>