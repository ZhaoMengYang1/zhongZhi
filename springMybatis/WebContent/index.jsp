<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="webupload/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">

var data = [{
    name: 'IT互联网',
    child: [{
            name: '编辑语言',
            child: [{
                name: 'java'
            }, {
                name: 'c#/.net'
            }, {
                name: 'python'
            }, {
                name: '前端开发'
            }]
        },
        {
            name: '移动开发',
            child: [{
                name: 'android开发'
            }, {
                name: 'IOS开发'
            }]
        },
        {
            name: '游戏开发',
            child: [{
                name: 'phaser游戏开发'
            }, {
                name: 'webGL游戏开发',
                child: [{
                    name: '3D游戏'
                }, {
                    name: '2D游戏'
                }]
            }]
        }
    ]
},
{
    name: '设计创作',
    child: [{
            name: '平面设计',
            child: [{
                name: '电商美工'
            }, {
                name: '综合平面设计'
            }, {
                name: '摄影后期'
            }]
        },
        {
            name: 'UI设计',
            child: [{
                name: '交互设计'
            }, {
                name: 'webUI设计'
            }, {
                name: '游戏UI设计'
            }]
        },
        {
            name: '软件设计'
        }
    ]
},
{
    name: '升学考研',
    child: [{
        name: '考研'
    }, {
        name: '大学'
    }, {
        name: '高中'
    }, {
        name: '初中'
    }]
},
{
    name: '职企考证',
    child: [{
        name: '公务员',
        child: [{
            name: '教师考试'
        }, {
            name: '建筑工程'
        }]
    }]
}
];




/*
 * 点击隐藏属性
 */
$(document).ready(function(){
	 $("p").click(function(){
		 $(this).hide();
		 
	 });
});


/*
 * DOM监听，loaded时隐藏属性
 */
document.addEventListener('DOMContentLoaded', function(){
    removeAD();
    $("#con-ar").bind('DOMSubtreeModified', function(e) {
        // 无内容
    });
});

// 主模块，执行DOM 过滤操作
function removeAD(){
    var dom = $(".FYB_RD");
    console.log(dom);
    dom.hide();
}



/*
 * 使用ajax异步请求获取可下载文件信息
 */
$(document).ready(function(){
  $("#b01").click(function(){
  htmlobj=$.ajax({
	  url:"jquery/test1",
	  type : "POST",
	  async:false,
	  dataType:"json",
	  success : function(result){
		  console.log(result);
		 // alert(result);
		 var content = result;
		 console.log(result[0].folderNum);
		  
		  $(function() {
			//递归
			function createTree(content) {
			    var str = '<ul>';
			    for (var i = 0; i < content.length; i++) {
			        str += '<li><span>-</span>' + content[i].folderNum;
			        if (content[i].folderTime) {
			            str += '<ul><li><span>-</span>'+content[i].folderTime;
			            
			        }
			        str += '</li></ul>';
			    };
			    str += '</ul>';
			    return str;
			};
			$(".lists").html(createTree(content));

			//单击事件
			$(".lists ul li").click(function(event) {
			    event.stopPropagation(); //阻止事件冒泡
			    //判断有没有子级
			    if ($(this).find("ul").is(":visible")) {
			        //隐藏   +
			        $(this).find("ul").hide();
			        $(this).find("span").text("+");
			    } else {
			        //显示  -
			        $(this).find("ul").show();
			        $(this).find("span").text("-");
			    }
			})
			})
	  }
	  });
  
  console.log(data);
  
  
  });
});









</script>
</head>
<body>
<p>点击消失</p>
<div id="myDiv"><h2>通过 AJAX 改变文本</h2></div>
<button id="b01" type="button">改变内容</button>
<br/><br/>
<div class="lists"></div>
<br/><br/>
<div class="FYB_RD">
	<ul>
		<li>Coffee</li>
		<li>Milk</li>
		<li>Coffee</li>
		<li>Milk</li>
		<li>Coffee</li>
		<li>Milk</li>
	</ul>
</div>
<div class = "test">
	<ul>
		<li>
			<span>-</span>
			IT互联网
			<ul>
				<li>
					<span>-</span>
					编辑语言
					<ul>
						<li>
							<span>-</span>
							java
						</li>
						<li>
							<span>-</span>
							c#/.net
						</li>
						<li>
							<span>-</span>
							Python
						</li>
						<li>
							<span>-</span>
							前端开发
						</li>
					</ul>
				</li>
				<li>
					<span>-</span>
					移动开发
					<ul>
						<li>
							
						</li>
					</ul>
				</li>
			</ul>
		</li>
	</ul>
</div>
<p>隐藏属性</p>
<a href="treeContent/treeContent.jsp">testTreeContent</a>
</body>
</html>