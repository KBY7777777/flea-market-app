//クレカ登録機能のJS

document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("token_submit") != null) {    //「token_submit」なるidがnullの場合、下記コードを実行しない
      Payjp.setPublicKey("pk_test_eac04d31dde551708c540f02");    //ここに公開鍵を書く
      let btn = document.getElementById("token_submit");    //idが「token_submit」である場合に取得される
      btn.addEventListener("click", e => {    //「ボタンが押される」イベントで発火して動かすしかけ
        e.preventDefault();    //ボタンを一旦無効化する
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        };    //入力されたデータを取得する
        Payjp.createToken(card, (status, response) => {
          if (status === 200) {    //成功した場合
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name");    //データを自サーバにpostしないように削除
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            );    //取得したtokenを送信できる状態にする
            $("#charge-form")[0].submit()
            
            alert("登録が完了しました");    //確認用alert（成功）
          } else {
            alert("カード情報が正しくありません。");    //確認用alert（エラー）
          }
        });
      });
    }
  },
  false
);


