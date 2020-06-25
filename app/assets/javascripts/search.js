$(function() {
  function buildHTMLsearchArtists(artist) {
    var html =`<div class="contents">
                  <form action="/albums" accept-charset="UTF-8" method="get">
                    <input type="hidden" name="utf8" value="✓">
                    <input type="hidden" name="artist_id" value= ${artist.id} id="artist_id">
                    <button type="submit" class="select-btn">
                      ${artist.name}
                    </button>
                  </form>
                </div>`
    return html
  }

  function buildHTMLsearchSongs(song, artist) {
    var html =`<div class="contents">
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
    var searchResult = $(".search__box__result");
    searchResult.empty();
    try {
      if (inputForm !== "") {
        var url = $(this).attr("action");
        // if ($("#artist_id:first").length !== 0) {
        //   var artistID = $("#artist_id:first").attr("value");
        // }
        $.ajax({
          type: "GET",
          url: url,
          data: { search: inputForm },
          dataType: "json",
        })
        .done(function(data) {
          {if (url == "/artists/search") {
            if (data.length !== 0) {
              data.forEach(function(artist) {
                searchResult.append(buildHTMLsearchArtists(artist));
              });
            }
          }
          else if (url == "/musics/search/songs") {
            if (data.songs.length !== 0) {
              var artist = data.artist
              data.songs.forEach(function(songs) {
                searchResult.append(buildHTMLsearchSongs(songs, artist));
              });
            }
          }
          else if (url == "/musics/search/only/songs") {
            if (data.songs.length !== 0) {
              var songs = data.songs
              var artists = data.artists
              for (var i = 0; i < songs.length; i++) {
                searchResult.append(buildHTMLsearchOnlySongs(songs[i], artists[i]));
              }
            }
          }
        }
        })
        .fail(function(data) {
          console.log(data);
          alert('通信に失敗しました');
        });
      }
    }
    catch {}
  });
});
