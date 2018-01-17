/*
* @Author: joesn
* @Date:   2017-12-19 14:52:16
* @Last Modified by:   joesn
* @Last Modified time: 2018-01-07 20:46:45
*/
	$(function(){
		initMenu();
	});

	var initMenu = function(){
		$(".j-menu li").bind('click', function(event) {
			if($(this).hasClass('active'))
				return;
			/* Act on the event */
			if(typeof($(".active").attr("child-menu"))!="undefined"){
				var h = $(this).height();
				$(".active").animate({height: h+"px"},
					500, function() {
				});
			}
			$(".j-menu li").removeClass("active");
			$(this).addClass('active');
			if(typeof($(this).attr("child-menu"))!="undefined"){
				var childMenu = $(this).attr("child-menu");
				childMenu=parseInt(childMenu)+1;
				var h = $(this).height();
				$(this).animate({height: h*childMenu+"px"},
					500, function() {
					/* stuff to do after animation is complete */

				});
			}
		});

		$(".j-menu li ol").bind('click', function(event) {
			/* Act on the event */
			if($(this).hasClass('child-active'))
				return;
			$(".j-menu ol").removeClass("child-active");
			$(this).addClass('child-active');
		});
	}

