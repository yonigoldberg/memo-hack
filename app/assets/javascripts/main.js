

function placeCaretAtEnd(el) {
    el.focus();
    if (typeof window.getSelection != "undefined" && typeof document.createRange != "undefined") {
        var range = document.createRange();
        range.selectNodeContents(el);
        range.collapse(false);
        var sel = window.getSelection();
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
    var reset = true;
    var startWrite = function(){
        $(this).unbind("focusin").unbind("keypress").html("").css("color","black");
    };
    $("#mainEditorWindow").css("color","gray").focusin(startWrite).keypress(startWrite);
    


}

function mainPage(){
    
}
