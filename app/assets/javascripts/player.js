$(function() {
  // プレイヤー
  var audio = new Audio("");
  var src = $(".song_preview_url").val();
  var state = 0; // 0 stop, 1 play
  if (src !== undefined) {
    audio.src = src;
    $("#player > i").click(function(ev){
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
    });
  }
});
