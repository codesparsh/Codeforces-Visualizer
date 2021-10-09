function generate()
{
    var quotes = [
    'If we have data, let’s look at data. If all we have are opinions, let’s go with mine.',
    'Data is the new oil.',
    'Big data isn’t about bits, it’s about talent.',
    'Data beats emotions.',
    'Above all else, show the data.',
    'Data that is loved tends to survive.',
    'You have to write your own story, your own graph and rhythm.',
    'The most beautiful curve is a rising Codeforces graph.',
    'The aim of science is to seek the simplest explanation of complex facts... Seek simplicity and distrust it.',
    'Randomization is too important to be left to chance.'
    ]

var x = Math.floor(Math.random()*10);
var content = quotes[x];

var ele = '<span>' + content.split('').join('</span><span>') + '</span>';

    $(ele).hide().appendTo('#typewriter').each(function (i) {
    $(this).delay(100 * i).css({
        display: 'inline',
        opacity: 0
    }).animate({
        opacity: 1
    }, 80);
});
}

generate();
