// ==UserScript==
// @name            Template
// @namespace       http://www.example.com/
// @include         http://www.example.com/*
// @require         http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js
// ==/UserScript==

(function() {
    var qlink = $('ul.img_info > li.url > a');
    var quoteUrl = qlink.attr('href');
    var imageUrl = "http://" + qlink.text();
    qlink.text(quoteUrl);
    var ilink = $("<p>ImageUrl: <a href='" + imageUrl + "'>" + imageUrl + "</a></p>");
    ilink.insertAfter(qlink);
    // qlink.after(ilink); this is equivalent to "ilink.insertAfter(qlink)"
})();


(function() {
    var hide_users = [
        "ムス",
        "ぱんつ",
    ]
        .map(function(user) { return new RegExp("^" + user) });

    (function() {
        $("div.log1").each(function() {
           var div = $(this);
           var user = div.find("span.logUser");

           $.each(hide_users, function(i, keyword) {
               if ( keyword.test(user.text()) ) {
                   div.find("span.logContent").css("display", "none");
               }
           });
        });

        setTimeout(arguments.callee, 3000);
    })();
})();
