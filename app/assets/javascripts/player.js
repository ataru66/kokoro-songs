$(function() {
  // プレイヤー
  var audio = new Audio("");
  var state = 0; // 0 stop, 1 play
  var playerBtn = $("#player > i");
  playerBtn.click(function(ev){
    playerBtn.removeClass("fa-pause");
    playerBtn.addClass("fa-play");
    var src = $(this).attr("value");
    if(src !== undefined) {
      audio.src = src;
      if(state == 0){
        audio.load();
        audio.play();
        $(this).removeClass("fa-play");
        $(this).addClass("fa-pause");
        state = 1;
      }else {
        audio.pause();
        $(this).removeClass("fa-pause");
        $(this).addClass("fa-play");
        state = 0;
      }
    }
  });
});
