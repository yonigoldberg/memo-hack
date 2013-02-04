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

    var postChanged = function(e){
        if(isAutosaved)
            toggleSavedIndicator();
        autoSaveMemory();

    };

    $("#mainEditorWindow").css("color","gray").focusin(startWrite).keypress(startWrite).keyup(postChanged);
    $("#memoryDate").change(postChanged);
    $("#memoryLocation").change(postChanged);
    $("#mainTitleLarge").change(postChanged);

}

function mainPage(){
    $("#registerButton").click(function(){window.location = "./auth/tumblr"});
}

var isAutosaved = true;

var autoSaveMemory = _.debounce( function(){
    toggleSavedIndicator();
    var memoryData = {
        title: $("#mainTitleLarge").html().replace(/^[\s]+/g,"").replace(/[\s]+$/g,""),
        body: $("#mainEditorWindow").html().replace(/^[\s]+/g,"").replace(/[\s]+$/g,""),
        date: $("#memoryDate").val(),
        location: $("#memoryLocation").val(),
    }
    $.post("memory", memoryData);
},5000);

var toggleSavedIndicator = function(){
    $(".savedMemo").toggle();
    $(".unsavedMemo").toggle();
    isAutosaved = !isAutosaved;
}