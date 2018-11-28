<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>文件上传及预览</title>
</head>
<body>

<%-- 这个是进度条的标签 --%>
<progress id="pro" value="0" max="100"></progress>
<%-- 进度条信息 --%>
<span id="span"></span>
<br>
<input type="file" id="files">
<img src="" alt="meiyou" id="img">
<script>
    var file = document.querySelector("#files");

    file.onchange = function () {

        var file1 = this.files[0];
        var fileReader = new FileReader();
        fileReader.readAsDataURL(file1);

        fileReader.onload = function (ev) {
            document.querySelector("#img").src = this.result;
            console.log(ev.lengthComputable);
        };

        // 使用onprogress 事件来动态改变进度条
        fileReader.onprogress = function (ev) {
            var pro = document.querySelector("#pro");
            var span = document.querySelector("#span");
            pro.value = ev.loaded;
            span.innerHTML = Math.round(ev.loaded / ev.total * 100) + "%";

        }
    }

</script>
</body>
</html>
