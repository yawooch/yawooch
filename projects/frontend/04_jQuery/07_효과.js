$(document).ready(()=>{
    // 1. show(), hide(), toggle()
    $('#btnHide').click(() => {
        $('button').prop('disabled', true);
        // $('#img1').hide(1000);
        // $('#img1').hide(1000,'linear');
        $('#img1').hide(1000,'linear', () => {
            $('button').prop('disabled', false);
        });
        // $('#img1').hide(1000,'linear', () => {
        //     alert('퇴. 사. 완.');
        // });
    });
    $('#btnShow').click(() => {
        $('#imgMyway').show(1000,'linear')
    });
    $('#btnToggle').click(() => {
        $('#img1').toggle(1000,'swing');
        $('#imgMyway').hide();
    });

    // 2. slideDown(), slideUp(), slideToggle()
    $('.menu').on('click',(event) => {
        let content = $(event.target).next();

        // if(content.css('display') === 'none'){
        //     content.slideDown(400);
        // }
        // else{
        //     content.slideUp(400);
        // }
        content.slideToggle(400);
    });

    $('#btnFadeIn').on('click', (event) => {
        // $('#img2').fadeIn();
        // $('#img2').fadeIn(1000);
        $('#img2').fadeIn(1000, 'swing');
    });
    $('#btnFadeOut').on('click', (event) => {
        // $('#img2').fadeOut();
        // $('#img2').fadeOut(1000);
        $('#img2').fadeOut(1000, 'swing');
    });
    $('#btnFadeToggle').on('click', (event) => {
        // $('#img2').fadeToggle();
        // $('#img2').fadeToggle(1000);
        $('#img2').fadeToggle(1000,'swing');
    });
    $('#img2').hover((event)=>{
        if(event.type === 'mouseenter'){
            $(event.target).fadeTo(500, .5,'linear');
        }
        else{
            $(event.target).fadeTo(500, 1,'swing');
        }
    });
});