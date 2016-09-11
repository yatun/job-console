$(function() {

  if (currentPage == 'console') {
    // 控制台页面

    // 暂停
    $("#pause").click(function(event) {
      var name = $(this).attr("data-name");
      var group = $(this).attr("data-group");
      trigger(name, group, 1);
    });

    // 恢复
    $("#resume").click(function(event) {
      var name = $(this).attr("data-name");
      var group = $(this).attr("data-group");
      trigger(name, group, 2);
    });

    // 删除
    $("#remove").click(function(event) {
      var name = $(this).attr("data-name");
      var group = $(this).attr("data-group");
      trigger(name, group, 3);
    });

  } else if (currentPage == 'add') {
    // 新增页面

    $("#timeForm [name='startTime'").datetimepicker({
      timeFormat: "HH:mm",
      dateFormat: "yy-mm-dd"
    });
    $("#timeForm [name='endTime'").datetimepicker({
      timeFormat: "HH:mm",
      dateFormat: "yy-mm-dd"
    });
  }
});

function trigger(name, group, flag) {

  // flag： 1=暂停，2=恢复，3=删除
  console.log(name, group, flag);
  $.ajax({
    type: "post",
    url: _ctx + "/trigger",
    dataType: 'json',
    data: {
      "name": name,
      "group": group,
      "flag": flag
    },
    success: function(data) {
      if (data) {
        alert("操作成功!");
      } else {
        alert("操作失败!");
      }
      window.location.href = _ctx + "/index";
    },
    error: function(data, status, e) { // 服务器响应失败时的处理函数
      alert("操作失败!");
      window.location.href = _ctx + "/index";
    }
  });
}
