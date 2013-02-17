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

function displayPartial(options){
    // set defaults
    if (!options.tag) return;
    if (!options.maxlength) options.maxlength = 250;
    $(options.tag).each(function(){

        if ($(this).text().length > options.maxlength){
            var original_content, $that;
            original_content = $(this).html();
            $(this).html($(this).html().substring(0,options.maxlength) + "... <br/>") 
            $that = $(this);
            $(this).append("See full post...").click(function(){$that.html(original_content)});
        }
    });
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

    if (newPost)
        $("#mainEditorWindow").css("color","gray").focusin(startWrite).keypress(startWrite);
    $("#mainEditorWindow").keyup(postChanged);
    $("#memoryDate").change(postChanged);
    $("#memoryLocation").change(postChanged);
    $("#mainTitleLarge").change(postChanged);

    initGoogleMapsLocation();
}



function initGoogleMapsLocation(){
    //google maps api location autocomplete
    var input = document.getElementById("memoryLocation");
    var autocomplete = new google.maps.places.Autocomplete(input);
    var infowindow = new google.maps.InfoWindow();

     google.maps.event.addListener(autocomplete, 'place_changed', function() {
      infowindow.close();
      // marker.setVisible(false);
      input.className = '';
      var place = autocomplete.getPlace();
      if (!place.geometry) {
        // Inform the user that the place was not found and return.
        input.className = 'notfound';
        return;
      }
   var address = '';
      if (place.address_components) {
        address = [
          (place.address_components[0] && place.address_components[0].short_name || ''),
          (place.address_components[1] && place.address_components[1].short_name || ''),
          (place.address_components[2] && place.address_components[2].short_name || '')
        ].join(' ');
      }

      infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
    });
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
        occured: $("#memoryDate").val(),
        location: $("#memoryLocation").val(),
        qid: qid,
    }
    $.post("/memory", memoryData);
},5000);

var toggleSavedIndicator = function(){
    $(".savedMemo").toggle();
    $(".unsavedMemo").toggle();
    isAutosaved = !isAutosaved;
}

function validateEmail(email) { 
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
} 


var setEmailTokenizer = function(selector){
    $(selector).tagit({
        placeholderText:"Enter emails",
        beforeTagAdded: function(evennt,ui){

            if(!validateEmail(ui.tagLabel))
                ui.tag.addClass("not_valid");

        }

    })
}

var validateEmailTokenizerAndAdd = function(){
    if($("#invite .not_valid").length !=0){
        $("#validatorResponse").text("There are invalid emails");
        return;
    }

    if ($("#invite .tagit-choice").length==0){
        $("#validatorResponse").text("Enter some emails");
        return;
    }

    var emails = $("#invite").tagit("assignedTags");
    for (var e in emails){
        $("#share_list").append('<div class="askQuestion">\
          <div class="askQuestionInternal">\
            <div class="formBar sharePerson">&nbsp;&nbsp;&nbsp;'+ emails[e] +'</div>\
            <div class="formBar sharePerson">Wating For replay</div>\
            <button class="midPageButton revoke" type="submit">Remove</button>\
            <button class="midPageButton revoke" type="submit">Remind</button>\
          </div></div>')
        
    }

    $("#validatorResponse").text("");
    $("#invite").tagit("removeAll");
    
}