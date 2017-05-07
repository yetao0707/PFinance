var stepDownHandle
$(document).ready(function() {
  browserRedirect();
  var imgAnimateList = ['fadeIn', 'flip', "zoomIn", "rollIn", 'fadeIn', 'fadeIn', 'fadeIn', 'fadeIn']
  $('#fullpage').fullpage({
    sectionsColor: ['#1bbc9b', '#1bbc9b', '#4BBFC3', '#4BBFC3', '#7BAABE', '#7BAABE', '#7BAABE', '#7BAABE', '#7BAABE'],
    anchors: ['firstPage', 'secondPage', 'thirdPage', 'fouthpage', 'fifthPage', 'sixPage', 'sevenPage', 'eightPage', 'lastPage'],
    menu: '#menu',
    navigation: true,
    autoScrolling: true, // 无效
    scrollBar: true,
    scrollingSpeed: 1000,
    afterLoad: function(anchorLink, index) {
      clearTimeout(stepDownHandle) // 同一时间应该只有一个计时器准备向下一个页面跳转
      var container = $('.section').eq(index - 1)
      if (container.hasClass('last-love')) { // 如果是最后一个展示爱心的页面，则自动展示
        setTimeout(function() { // 如果是进入到最后一页，则1000MS后打开爱心
          $('.container').addClass('open')
        }, 500)
      } else { // 不为最后一页
        var intervalTime;
        if (index == 1) {
          intervalTime = 8000;
        } else if (index < 4 || index == 5) {
          intervalTime = 13000;
        } else {
          intervalTime = 18000;
        }

        // = (index === 1) ? 10000 : (index<7) ? 15000 :18000// 如果为第一页间隔时间为3S，否则为10S
        stepDownHandle = setTimeout(function() {
          $.fn.fullpage.moveSectionDown()
        }, intervalTime)
      }

      setTimeout(function() { // 图片展示动画
        var animateClass = imgAnimateList[index - 1] || "fadeIn" // 默认淡入效果
        container.find('img').removeClass('diy-hide')
        container.find('img').addClass("animated " + animateClass)
      }, 0)

    },
    onLeave: function(currentIndex, nextIndex) {
      var container = $('.section').eq(currentIndex - 1)
      if (container.hasClass('last-love')) { // 离开最后一页，恢复关闭状态
        $('.container').removeClass('open')
      }
    }
  });
  $('.last-love').removeClass('diy-hide') // 开始先隐藏，以避免直接展示
  eventInit() // 绑定事件
});

function eventInit() {
  $('.close').click(function() {
    $('.container').removeClass('open');
  });
}

function browserRedirect() {
  var sUserAgent = navigator.userAgent.toLowerCase();
  var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
  var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
  var bIsMidp = sUserAgent.match(/midp/i) == "midp";
  var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
  var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
  var bIsAndroid = sUserAgent.match(/android/i) == "android";
  var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
  var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
  if (!(bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM)) {
    window.location.href = "index.html";
  }
}