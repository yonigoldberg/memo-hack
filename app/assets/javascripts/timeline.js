//={
//     "timeline":
//     {
//         "headline":"The Main Timeline Headline Goes here",
//         "type":"default",
//         "text":"<p>Intro body text goes here, some HTML is ok</p>",
//         "asset": {
//             "media":"http://yourdomain_or_socialmedialink_goes_here.jpg",
//             "credit":"Credit Name Goes Here",
//             "caption":"Caption text goes here"
//         },
//         "date": [
//             {
//                 "startDate":"1999,12,10",
//                 "endDate":"2000,12,11",
//                 "headline":"Headline Goes Here",
//                 "text":"<p>Body text goes here, some HTML is OK</p>",
//                 "tag":"This is Optional",
//                 "classname":"optionaluniqueclassnamecanbeaddedhere",
//                 "asset": {
//                     "media":"http://twitter.com/ArjunaSoriano/status/164181156147900416",
//                     "thumbnail":"optional-32x32px.jpg",
//                     "credit":"Credit Name Goes Here",
//                     "caption":"Caption text goes here"
//                 }
//             },

//             {
//                 "startDate":"2012,12,10",
//                 "endDate":"2012,12,11",
//                 "headline":"Headline Goes Here",
//                 "text":"<p>Body text goes here, some HTML is OK</p>",
//                 "tag":"This is Optional",
//                 "classname":"optionaluniqueclassnamecanbeaddedhere",
//                 "asset": {
//                     "media":"http://twitter.com/ArjunaSoriano/status/164181156147900416",
//                     "thumbnail":"optional-32x32px.jpg",
//                     "credit":"Credit Name Goes Here",
//                     "caption":"Caption text goes here"
//                 }
//             },
//             {
//                 "startDate":"2015,12,10",
//                 "endDate":"2015,12,11",
//                 "headline":"Headline Goes Here",
//                 "text":"<p>Body text goes here, some HTML is OK</p>",
//                 "tag":"This is Optional",
//                 "classname":"optionaluniqueclassnamecanbeaddedhere",
//                 "asset": {
//                     "media":"http://twitter.com/ArjunaSoriano/status/164181156147900416",
//                     "thumbnail":"optional-32x32px.jpg",
//                     "credit":"Credit Name Goes Here",
//                     "caption":"Caption text goes here"
//                 }
//             }
//         ],
//         "era": [
//             {
//                 "startDate":"1990,12,10",
//                 "endDate":"1995,12,11",
//                 "headline":"Childhood",
//                 "text":"<p>My Childhood</p>",
//                 "tag":"This is Optional"
//             },

//             {
//                 "startDate":"2000,12,10",
//                 "endDate":"2010,12,11",
//                 "headline":"Adulthood",
//                 "text":"<p>My Adulthood</p>",
//                 "tag":"This is Optional"
//             }

//         ]
//     }
// }

var timeline_config = {
            width:              '100%',
            height:             '600',
            source:             document.URL + '.json',
            embed_id:           'bio-timeline',               //OPTIONAL USE A DIFFERENT DIV ID FOR EMBED
            start_at_end:       false,                          //OPTIONAL START AT LATEST DATE
            start_at_slide:     '1',                            //OPTIONAL START AT SPECIFIC SLIDE
            // start_zoom_adjust:  '3',                            //OPTIONAL TWEAK THE DEFAULT ZOOM LEVEL
            hash_bookmark:      true,                           //OPTIONAL LOCATION BAR HASHES
            font:               'Bevan-PotanoSans',             //OPTIONAL FONT
            debug:              true,                           //OPTIONAL DEBUG TO CONSOLE
            maptype:            'watercolor',                   //OPTIONAL MAP STYLE
            css:                '/assets/timeline.css',     //OPTIONAL PATH TO CSS
            js:                 '/assets/timeline-min.js'    //OPTIONAL PATH TO JS
        }

var initTimeline = function() {
	 
    // createStoryJS({
    //     type:       'timeline',
    //     width:      '800',
    //     height:     '600',
    //     source:     dataObject,
    //     embed_id:   'bio-timeline',
        
    // });
}