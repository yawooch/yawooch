
        $(function () {

            //greensock basic setting
            gsap.registerPlugin(ScrollTrigger);

            var delay = 0;
            var dur = 1.5;
            var tp = "100%";

            // green_sock
            function green_sock() {

                // transform set because.. css not..
                gsap.set(".ani_lr", { x: -100, opacity: 0 })

                /* gsap.set(".ani_opa", { opacity: 0 }) */

                gsap.utils.toArray(".ani_lr").forEach(function (entry) {
                    delay = $(entry).attr('data-delay');
                    /* if ($(entry).attr('data-dur')) {
                        dur = $(entry).attr('data-dur');
                    } */
                    /* if ($(entry).attr('data-tp')) {
                        tp = $(entry).attr('data-tp');
                    } */
                    var tl = gsap.timeline({
                        scrollTrigger: {
                            trigger: entry,
                            start: "top " + tp
                        }
                    });
                    tl.to(entry, { delay: delay, duration: dur, opacity: 1, x: 0 });
                });



                //height 0~100
                /* var height1 = gsap.utils.toArray(".ani_height1"); */
/* 
                height1.forEach(function (entry) {
                    var tl = gsap.timeline({
                        scrollTrigger: {
                            trigger: entry,
                            start: "top " + tp
                        }
                    });
                    tl.to(entry, {
                        duration: 1.5,
                        height: 0
                    });
                }); */
            }
            // green_sock
            green_sock();
        });
