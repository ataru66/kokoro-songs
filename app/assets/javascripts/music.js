$(function() {
  function buildHTMLsearchArtists(artist) {
    var html =` <div class="contents">
                  <form action="/musics/select/artist" accept-charset="UTF-8" method="get">
                    <input name="utf8" type="hidden" value="✓">
                    <input value= ${artist.artist_id} type="hidden" name="artist_id" id="artist_id">
                    <button class="select-btn" type="submit">
                      ${artist.artist_name}
                    </button>
                  </form>
                </div>`
    return html
  }

  function buildHTMLsearchSongs(song, artist) {
    var html =` <div class="contents">
                  <form action="/posts/new" accept-charset="UTF-8" method="get">
                    <input name="utf8" type="hidden" value="✓">
                    <input value=${song.song_id} type="hidden" name="song_id" id="song_id">
                    <input value=${artist.artist_id} type="hidden" name="artist_id" id="artist_id">
                    <button class="select-btn" type="submit">
                      ${song.song_name}
                    </button>
                  </form>
                </div>`
    return html
  }

  function buildHTMLsearchOnlySongs(song, artist) {
    var html = `<div class="contents_with_artists">
                  <form action="/posts/new" accept-charset="UTF-8" method="get">
                    <input name="utf8" type="hidden" value="✓">
                    <input value=${song.song_id} type="hidden" name="song_id" id="song_id">
                    <input value=${artist.artist_id} type="hidden" name="artist_id" id="artist_id">
                    <div class="contents_with_artists__left">
                      <button class="select-btn" type="submit">
                        <p>
                          ${song.song_name}
                        </p>
                      </button>
                    </div>
                    <div class="contents_with_artists__right">
                      <button class="select-btn" type="submit">
                        <p>
                          ${artist.artist_name}
                        </p>
                      </button>
                    </div>
                  </form>
                </div>`
    return html
  }

  // 非同期検索
  $("#search-form").on("keyup", function(){
    var inputForm = $("#search").val();
    var url = $(this).attr("action");
    var searchResult = $(".search__box__result");
    if ($("#artist_id:first").length !== 0) {
      var artistID = $("#artist_id:first").attr("value");
    }
    $.ajax({
      type: "GET",
      url: url,
      data: { search: inputForm, artist_id: artistID},
      dataType: "json",
    })
    .done(function(data) {
      if (url == "/musics/search/artists") {
        searchResult.empty();
        if (data.length !== 0) {
          data.forEach(function(data) {
            searchResult.append(buildHTMLsearchArtists(data));
          });
        }
      }
      else if (url == "/musics/search/songs") {
        searchResult.empty();
        if (data.songs.length !== 0) {
          var artist = data.artist
          data.songs.forEach(function(songs) {
            searchResult.append(buildHTMLsearchSongs(songs, artist));
          });
        }
      }
      else if (url == "/musics/search/only/songs") {
        searchResult.empty();
        if (data.songs.length !== 0) {
          var songs = data.songs
          var artists = data.artists
          for (var i = 0; i < songs.length; i++) {
            searchResult.append(buildHTMLsearchOnlySongs(songs[i], artists[i]));
          }
        }
      }
    })
    .fail(function(data) {
      console.log(data);
      alert('通信に失敗しました');
    });
  });
});
