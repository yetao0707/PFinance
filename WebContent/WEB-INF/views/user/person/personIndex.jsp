<%@page contentType="text/html; charset=utf-8" %>
<%@ include file="../../taglib.jsp"%>
<%@page session="false" %>
<%@ page isELIgnored="false" %>
<style type="text/css">
    .vertical-tab {
        width: 130px;
        height: 100%;
        float: left;
        overflow: hidden;
    }

    .vertical-tab > li {
        text-align: center;
    }

    .vertical-tab > li.active > a, .vertical-tab > li.active > a:focus, .vertical-tab > li.active > a:hover {
        border: solid #ccc;
        border-width: 1px 0px 1px 1px;
        background-color: #ffffff;
        border-right: 1px solid #ffffff;
        z-index: 2;
    }

    .vertical-tab > li > a {
        border-radius: 4px 0px 0px 4px;
    }

    .vertical-tab-content {
        float: left;
        width: 85%;
        height: 100%;
        padding: 5px;
        margin-left: -1px;
        margin-bottom: 2px;
        border-radius: 4px 4px 4px 4px;
        border: solid 1px #ccc;
        color: #666;
    }

    .send {
        position: relative;
        width: 90%;
        background: #FFFFFF;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px; /* 圆角 */
        border: 1px solid #ccc;
    }

    .tag {
        width: 300px;
        min-height: 30px;
        border: 1px solid #ccc;
        position: relative;
        padding: 10px;
        background-color: #ccc;
        border-radius: 4px;
        margin-left: 30px;
        -moz-box-shadow: 1px 1px 2px hsla(0, 0%, 0%, 0.3);
        -webkit-box-shadow: 1px 1px 2px hsla(0, 0%, 0%, 0.3);
        box-shadow: 1px 1px 2px hsla(0, 0%, 0%, 0.3);
    }

    .tag:before, .tag:after {
        position: absolute;
        content: "\00a0";
        width: 0px;
        height: 0px;
        border-width: 8px 18px 8px 0;
        border-style: solid;
        border-color: transparent #CCC transparent transparent;
        top: 5px;
        left: -18px;

    }

    .tag:after {
        bottom: -33px;
        border-color: #FFF transparent transparent;
    }


</style>

<script type="text/javascript">
    $(function () {
        $('#vtab li').click(function () {
            tops = $(this).offset().top - $('#vtab').offset().top + $('#vtab').scrollTop() - $('#vtab').height() / 4;
            console.log(tops);
            $('#vtab').animate({
                scrollTop: tops
            }, 'slow');
        });
    });
</script>
<script>
    $(function(){
        $('a[data-toggle="tab"]').on('click', function (e) {
            // 获取已激活的标签页的名称
            var activeTab = $(e.target).attr("href");
            if (activeTab=="#personInfo"){
                $("#personInfo").load("personalInfo");
            } else if(activeTab=="#personCharacter"){
                $("#personCharacter").load("personalResult");
            } else if(activeTab=="#personProduct"){
                $("#personProduct").load("personalProduct");
            }
        });
        $("#personInfo").load("personalInfo");
//        $("#personCharacter").load("personalResult");
//        $("#personProduct").load("personalProduct");

    });
</script>

<div class="container" style="background-color: #9ff5ef;height:2500px;">
    <ul class="nav nav-tab vertical-tab" role="tablist" id="vtab">
        <li role="presentation" class="active">
            <a href="#personInfo" aria-controls="personInfo" role="tab"
               data-toggle="tab" style="line-height: 58px;font-size: 20px;width: 150px;">个人信息</a>
        </li>
        <li role="presentation">
            <a href="#personCharacter" aria-controls="personCharacter" role="tab"
               data-toggle="tab" style="line-height: 58px;font-size: 20px;width: 150px;">我的特性</a>
        </li>
        <li role="presentation">
            <a href="#personProduct" aria-controls="personProduct" role="tab"
               data-toggle="tab" style="line-height: 58px;font-size: 20px;width: 150px;">我的理财</a>
        </li>

    </ul>

    <!-- Tab panes -->
    <div class="tab-content vertical-tab-content" style="border:none;" >>
        <div role="tabpanel" class="tab-pane active" id="personInfo">

        </div>
        <div role="tabpanel" class="tab-pane" id="personCharacter">


        </div>

        <div role="tabpanel" class="tab-pane" id="personProduct">


        </div>
    </div>

</div>

