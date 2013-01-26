

function placeCaretAtEnd(el) {
    el.focus();
    if (typeof window.getSelection != "undefined" && typeof document.createRange != "undefined") {
        var range = document.createRange();
        range.selectNodeContents(el);
        range.collapse(false);
        var sel = window.getSelection();
        sel.removeAllRanges();
        sel.addRange(range);
    } else if (typeof document.body.createTextRange != "undefined") {
        var textRange = document.body.createTextRange();
        textRange.moveToElementText(el);
        textRange.collapse(false);
        textRange.select();
    }
}

function writePage(){
    placeCaretAtEnd($('#mainEditorWindow').get(0));
}

function mainPage(){
    // $("#registerform").validator();
    //$("#register").hide();

    $("#registerButton").click(function(){window.location = "./auth/tumblr"})

    //$("#registerButton").click(function(){$("#register").slideDown(250,function(){window.location= "#registerButton"} )})
}
