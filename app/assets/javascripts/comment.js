window.addEventListener('DOMContentLoaded', function(){
  function buildHTML(comment){
    var html =` 
      <div class="comments-text-box" data-comment-id="${comment.id}">
        <div class="nickname">
          ${ comment.user_name}
          <div class="day">
            ${ comment.created_at}
          </div>
        </div>
        <div class="text">
          ${comment.text }
        </div>
      </div>`
    return html;
  }


    $('#new_comment').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action')
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data){
        console.log(this)
        var html = buildHTML(data);
        $('.comments-text').append(html);
        $('.movie__Comment-text').val('');
        $('.movie__Comment-btn').prop('disabled', false);
        $('.content-right').animate({scrollTop: $(' .content-right')[0].scrollHeight}, 'fast');
      })
      .fail(function(){
        alert('error');
      })
    })



        var reloadMessages = function() {

          //カスタムデータ属性を利用し、ブラウザに表示されている最新メッセージのidを取得
          last_comment_id = $('.comments-text-box:last').data("comment-id");
          movie_id = $(".main-movie-show").data("movie-id"); 
          $.ajax({
            //ルーティングで設定した通り/groups/id番号/api/messagesとなるよう文字列を書く
            url:  `/movies/${movie_id}/api/comments`,
            //ルーティングで設定した通りhttpメソッドをgetに指定
            type: 'get',
            dataType: 'json',
            //dataオプションでリクエストに値を含める
            data: {id: last_comment_id}
          })

          .done(function(comments) {
            if (comments.length !== 0) {
            //追加するHTMLの入れ物を作る
            var insertHTML = '';
            //配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
            $.each(comments, function(i, comment) {
              insertHTML += buildHTML(comment)
            });
            //メッセージが入ったHTMLに、入れ物ごと追加
            $('.comments-text').append(insertHTML);
            $('.content-right').animate({ scrollTop: $('.content-right')[0].scrollHeight});
            $("#new_comment")[0].reset();
            $(".movie__Comment-btn").prop("disabled", false);
          }
        })
          .fail(function() {
            console.log('error');
          });
   
      };
        setInterval(reloadMessages, 2000);
      });


