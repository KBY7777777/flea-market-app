$(function() {
  function appendOption(category) {
    let html =  `
              <option value="${category.id}" data-category="${category.id}">${category.name}</option>
              `;
    return html;
  }

  function appendChildrenBox(insertHTML) {
    let childSelectHtml =  ` 
                          <select class="item_input__body__category__children--select" id="children_category" name="">
                            <option value="" data-category="" >選択してください</option>
                          ${insertHTML}</select>
                          `;
    $('.children_box').append(childSelectHtml);
  }

  $("#parent_category").on("change", function() {
    let parentCategory = $("#parent_category").val();
    if (parentCategory != "") {
      $.ajax( {
        type: 'GET',
        url: '/items/:id/get_category_children',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children) {
        $(".children_box").empty();
        let insertHTML = '';
        children.forEach(function(child) {
        insertHTML += appendOption(child);
      });
        appendChildrenBox(insertHTML);
      })
      .fail(function() {
        alert('error：子カテゴリーの取得に失敗');
      })
    }else{
      $("#children_box").empty();
    }
  });

  function appendGrandchildrenBox(insertHTML) {
    let grandchildSelectHtml =  `
                              <select class="item_input__body__category__grandchildren--select" id="grandchildren_category" name="item[category_id]">
                                <option value="" data-category="" >選択してください</option>
                                ${insertHTML}</select>
                              `;
    $('.grandchildren_box').append(grandchildSelectHtml);
  }

  $(".children_box").on('change',function() {
    //選択された子カテゴリーidを取得
    let childId = $('#children_category option:selected').data('category');
    //子カテゴリーが初期値でない場合
    if (childId != ""){
      $.ajax({
        url: '/items/:id/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        datatype: 'json'
      })
      .done(function(grandchildren) {
        if (grandchildren.length != 0) {
          $("#grandchildren_box").empty();
          let insertHTML = '';
          grandchildren.forEach(function(grandchild) {
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function() {
        alert('error:孫カテゴリーの取得に失敗');
      })
    }else{
      $("#grandchildren_box").empty(); 
    }
  });

  //販売手数料・販売利益自動計算 
  $(".Item_Exhibition_Price").on('keyup', function(){ 
    let amount = $( this ).val();
    // 販売価格の入力欄に入力された値を変数「amount」に代入
    let tax = Math.ceil(amount * 0.1);
    // 販売手数料10%、Math.ceilメソッドで1円単位に切り上げ
    // 計算結果を変数「tax」に代入
    let profit = Math.floor(amount * 0.9);
    // 利益は残りの金額。Math.floorメソッドで、1円単位で切り捨てておけば「販売価格 = 販売手数料 + 販売利益」が成り立ちます。
    // 計算結果は変数「profit」に代入。
    $('#sales_commission_price').html(tax);
    // htmlメソッドを使って販売手数料の欄を丸ごと書き換えます。
    if($('#sales_commission_price').present!=0){
      // sales_commission_priceの値が０でないとき
          sales_commission_price.prepend("¥");
     //前に¥を代入
        }
    $('#sales_gain_price').html(profit);
    if($('#sales_gain_price').present!=0){
      // sales_commission_priceの値が０でないとき
          sales_gain_price.prepend("¥");
     //前に¥を代入
        }
  });

 //販売手数料・販売利益自動計算 edit対応のためロード時に再計算させる
 $(document).ready(function(){
  let amount = $( ".Item_Exhibition_Price" ).val();
  let tax = Math.ceil(amount * 0.1);
  let profit = Math.floor(amount * 0.9);
  $('#sales_commission_price').html(tax);
  if($('#sales_commission_price').present!=0){
         sales_commission_price.prepend("¥");
       }
  $('#sales_gain_price').html(profit);
   if($('#sales_gain_price').present!=0){
         sales_gain_price.prepend("¥");
   }
});

//文字数カウント機能
$(function(){
  $('#js-count').keyup(function(){
    var count = $(this).val().replace(/\s+/g,'').length;
    $('.show-count').text(count);
  });
});

//edit対応
$(document).ready(function(){
  var editcount = $('.Item-Form-Expect').text().replace(/\s+/g,'').length;
  $('.show-count').text(editcount);
  $('#js-count').keyup(function(){
    var count =  $(this).val().replace(/\s+/g,'').length;
    console.log(count)
    $('.show-count').text(count);
  });
});



});