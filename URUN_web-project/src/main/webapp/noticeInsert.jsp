<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeí</title>
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/notice.css">
<script src="./js/jquery-3.7.1.min.js"></script>
<script src="./js/main.js"></script>
</head>
<body>
    <div id="board_write">
        <h4>공지사항 작성</h4>
            <div id="write_area">
                <form enctype="multipart/form-data" action="write_ok.php?board_id=<?echo $board_id;?>" method="post">
                    <div id="in_title">
                        <textarea name="title" id="utitle" rows="1" cols="55" placeholder="ì ëª©" maxlength="100" required></textarea>
                    </div>
 
                    <div class="wi_line"></div>
                    <div id="in_content">
                        <textarea name="content" id="ucontent" placeholder="ë´ì©" required></textarea>
                    </div>
 
                      <input type="file" name="SelectFile" />
 
 
                    <div class="bt_se">
                        <button type="submit">작성</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>