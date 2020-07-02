$(document).on('turbolinks:load', function() {
  $('.top_phote').hide().fadeIn(2000);
});

// 日付フォームの設定 //
function generateDay(obj) {

  // プルダウンのidの末尾を取得する
  var obj_ids = obj.id.split("_")
  var obj_ids_last = obj_ids[obj_ids.length-1]

  // 年および月のプルダウンならば処理を続行する
  if(obj_ids_last == '2i'){
    // プルダウンのidから末尾を除外する
    var id = obj_ids[0]
    for(i=1; i<obj_ids.length-1; i++){
      id = id + "_" + obj_ids[i]
    }

    // 選択中の年・月・日
    var m = document.getElementById(id + '_2i').options[document.getElementById(id + '_2i').selectedIndex].text;
    var d = document.getElementById(id + '_3i').options[document.getElementById(id + '_3i').selectedIndex].text;

    // 閏年判定

      var last = new Array(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)[m - 1];

    // 要素取得と初期化
    target = document.getElementById(id + '_3i');
    target.length = 0;

    // 日の要素生成
    for (var i = 0; i < last; i++) {
      target.options[target.length++] = new Option(i + 1, i + 1);
    }

    // 日を元に戻す
    if(d <= last){
      target.value = d
    }
  }
}

// トップに戻るボタンの設定 //
$(document).on('turbolinks:load', function() {
  $('#back a').on('click',function(){
    $('body, html').animate({
      scrollTop:0
    }, 500);
      return false;
  });
});

$(document).on('turbolinks:load', function() {
  $('#back a').mouseover(function(){
      $('#back a').addClass('back-btn');
  });

  $('#back a').mouseout(function(){
      $('#back a').removeClass('back-btn');
  });
});

$(document).on('turbolinks:load', function() {
  $('.skill_text').hover(
  function(){
    $('.detail_text').animate({'marginRight':'0'},1000);
  },
  function () {
    $('.detail_text').animate({'marginRight':'-50%'},1000);
  });
});

$(document).on('turbolinks:load', function() {
  $('.school_text').hover(
  function(){
    $('.detail_school_text').animate({'marginRight':'0'},1000);
  },
  function () {
    $('.detail_school_text').animate({'marginRight':'-50%'},1000);
  });
});