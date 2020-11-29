$(function(){

  $(function(){

    //プレビューのhtmlを定義
    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}" data-index = ${count}>
                    <div class="upper-box">
                      <img data-index="${count}" src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="update-box">
                        <label class="edit_btn">編集</label>
                      </div>
                      <div class="delete-box" id="delete_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }

    const buildFileField = (num)=> {
      const html = `
                    <input value="" data-index="${num}" class="hidden-field count-field" name="item[item_images_attributes][${num}][url]" id="item_images_attributes_${num}_url" style="display:none" type="file">
                    `;
      return html;
    }

    // 投稿編集時
    //items/:i/editページへリンクした際のアクション
    if (window.location.href.match(/\/items\/\d+\/edit/)){
      //登録済み画像のプレビュー表示欄の要素を取得する
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
      //プレビューにidを追加
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      //削除ボタンにidを追加
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      var count = $('.preview-box').length;
      //プレビューが5あるときは、投稿ボックスを消しておく
      if (count == 5) {
        $('.label-content').hide();
      }
    }

    // ラベルのwidth操作
    function setLabel() {
      //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
    }

    // プレビューの追加
    $('.Product-Listing').on('change', '.hidden-field', function(e) {
      setLabel();
      //hidden-fieldのidの数値のみ取得
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      //labelボックスのidとforを更新
      $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_url`});
      //選択したfileのオブジェクトを取得
      var file = this.files[0];
      var reader = new FileReader();
      //readAsDataURLで指定したFileオブジェクトを読み込む
      reader.readAsDataURL(file);
      //読み込み時に発火するイベント
      reader.onload = function() {
        var image = this.result;
        //プレビューが元々なかった場合はhtmlを追加
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          //ラベルの直前のプレビュー群にプレビューを追加
          $('label.Product-Listing__Inside__FhotoForm').before(html);
          const lastFileField = $('input[type="file"]:last');
          const nextDataIndex = lastFileField.data('index') + 1;
          const newFileFieldHtml = buildFileField(nextDataIndex);          
          lastFileField.after(newFileFieldHtml);
        }

       
        //イメージを追加
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        // var count = $('.preview-box').length;
        var count = $('.count-field:last').data('index');
        //プレビューが10個あったらラベルを隠す 
        if (count == 100) { 
          $('.label-content').hide();
        }
        //ラベルのwidth操作
        setLabel();
        //ラベルのidとforの値を変更
        if(count < 100){
          //プレビューの数でラベルのオプションを更新する
          $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_url`});
        }
      }
    });

    // 画像の編集
    $(document).on('click', '.edit_btn', function(e) {
      var count = $(this).parents(".preview-box").data('index');
      const fileFieled = $(`#item_images_attributes_${count}_url`)
      fileFieled.trigger('click');
    });

    // 画像の削除
    $(document).on('click', '.delete-box', function() {
      
      var count = $('.count-field:last').data('index');
      setLabel(count);
      //item_images_attributes_${id}_image から${id}に入った数字のみを抽出
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      console.log(id)
      //取得したidに該当するプレビューを削除
      $(`#preview-box__${id}`).remove();
      //フォームの中身を削除 
      $(`#item_images_attributes_${id}_url`).remove();
      //チェックボックスのID.prop
      $(`#item_item_images_attributes_${id}__destroy`).prop('checked',true);
      //削除時のラベル操作
      var count = $('.count-field:last').data('index');
      //10個めが消されたらラベルを表示
      if (count == 100) {
        $('.label-content').show();
      }
      setLabel(count);

      if(count < 100){
        //削除された際に、空っぽになったfile_fieldをもう一度入力可能にする
        $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_url`});
      }
    });
  });
});
