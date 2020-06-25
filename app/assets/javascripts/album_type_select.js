$(function() {
  //album-type 'album' だけを表示
  function showActiveAlbums() {
    $('.artist-albums').children().hide();
    $('#active-albums').show();
  }
  showActiveAlbums();

  //クリックされた要素にactiveを与え、既存のactiveを削除します
  $('.type-btn').on('click', function(e) {
    var albumType = $(this).data('type');
    if ($(this).attr('id') == undefined) {
      $('#active-album-type').removeAttr('id');
      $(this).attr('id', 'active-album-type');
      $('#active-albums').removeAttr('id');
      $(`.${albumType}s`).attr('id', 'active-albums');
      showActiveAlbums();
    }
  });
});