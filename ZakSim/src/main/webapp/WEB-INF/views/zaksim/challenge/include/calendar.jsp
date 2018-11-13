<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<!-- 		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
		
		<!--  <script src="jquery.calendar.js"></script>
		<link rel="stylesheet" href="jquery.calendar.css" />  -->
		
		<!-- <style>
		* {font-family: 'Open Sans';}
		body { background-color: #fafafa; }
		pre {font-family: Courier New;}
		</style> -->
		
		<script type="text/javascript">
		
		(function ($) {
			
			$.fn.calendar = function (opts) {
				var options = $.extend({
					color: '#308B22',
					months: ['Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember'],
					days: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
					onSelect: function (event) {}
				}, $.fn.calendar.defaults, opts);
				
				return this.each(function () {
					var currentYear, currentMonth, currentDay, currentCalendar;
					
					initCalendar($(this), options);
				});
			};
			
			function initCalendar(wrapper, options) {
				var color = options.color; 
				
				wrapper.addClass('calendar').empty();
				
				var header = $('<header>').appendTo(wrapper);
				header.addClass('calendar-header');
				header.css({
					background: color,
					color: createContrast(color)
				});
				
				var buttonLeft = $('<span>').appendTo(header);
				buttonLeft.addClass('button').addClass('left');
				buttonLeft.html(' &lang; ');
				buttonLeft.bind('click', function () { currentCalendar = $(this).parents('.calendar'); selectMonth(false, options); });
				buttonLeft.bind('mouseover', function () { $(this).css('background', createAccent(color, -20)); });
				buttonLeft.bind('mouseout', function () { $(this).css('background', color); });
				
				var headerLabel = $('<span>').appendTo(header);
				headerLabel.addClass('header-label')
				headerLabel.html(' Month Year ');
				headerLabel.bind('click', function () { 
					currentCalendar = $(this).parents('.calendar');
					selectMonth(null, options, new Date().getMonth(), new Date().getFullYear());
					
					currentDay = new Date().getDate();
					triggerSelectEvent(options.onSelect);
				});
				
				var buttonRight = $('<span>').appendTo(header);
				buttonRight.addClass('button').addClass('right');
				buttonRight.html(' &rang; ');
				buttonRight.bind('click', function () { currentCalendar = $(this).parents('.calendar'); selectMonth(true, options); });
				buttonRight.bind('mouseover', function () { $(this).css('background', createAccent(color, -20)); });
				buttonRight.bind('mouseout', function () { $(this).css('background', color); });
				
				var dayNames = $('<table>').appendTo(wrapper);
				dayNames.append('<thead><th>' + options.days.join('</th><th>') + '</th></thead>');
				dayNames.css({
					width: '100%'
				});
				
				var calendarFrame = $('<div>').appendTo(wrapper);
				calendarFrame.addClass('calendar-frame');
				
				headerLabel.click();
			}
			
			function selectMonth(next, options, month, year) {
				var tmp = currentCalendar.find('.header-label').text().trim().split(' '), tmpYear = parseInt(tmp[1], 10);
				
				currentMonth = month || ((next) ? ((tmp[0] === options.months[options.months.length - 1]) ? 0 : options.months.indexOf(tmp[0]) + 1) : ((tmp[0] === options.months[0]) ? 11 : options.months.indexOf(tmp[0]) - 1));
				currentYear = year || ((next && currentMonth === 0) ? tmpYear + 1 : (!next && currentMonth === 11) ? tmpYear - 1 : tmpYear);
				
				var calendar = createCalendar(currentMonth, currentYear, options), frame = calendar.frame();
				
				currentCalendar.find('.calendar-frame').empty().append(frame);
				currentCalendar.find('.header-label').text(calendar.label);
				
				frame.on('click', 'td', function () {
					$('td').removeClass('selected');
					$(this).addClass('selected');
					
					currentDay = $(this).text();
					triggerSelectEvent(options.onSelect);
				});
			}	
			
			function createCalendar(month, year, options) {
				var currentDay = 1, daysLeft = true,
				startDay = new Date(year, month, currentDay).getDay() - 1,
				lastDays = [31, (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], 
				calendar = [];
				
				var i = 0;
				while(daysLeft) {
					calendar[i] = [];
					
					for(var d = 0; d < 7; d++) {
						if(i == 0) {
							if(d == startDay) {
								calendar[i][d] = currentDay++;
								startDay++;
							}
						} else if(currentDay <= lastDays[month]) {
							calendar[i][d] = currentDay++;
						} else {
							calendar[i][d] = ''; 
							daysLeft = false;
						}
						
						if (currentDay > lastDays[month]) { 
							daysLeft = false; 
						} 
					}
					
					i++;
				}
				
				var frame = $('<table>').addClass('current');
				var frameBody = $('<tbody>').appendTo(frame);
				
				for(var j = 0; j < calendar.length; j++) {
					var frameRow = $('<tr>').appendTo(frameBody);
					
					$.each(calendar[j], function (index, item) {
						var frameItem = $('<td>').appendTo(frameRow);
						frameItem.text(item);
					});
				}
				
				$('td:empty', frame).addClass('disabled');
				if(currentMonth === new Date().getMonth()) { 
					$('td', frame).filter(function () { return $(this).text() === new Date().getDate().toString(); }).addClass('today'); 
				} 
			
				return { frame: function () { return frame.clone() }, label: options.months[month] + ' ' + year };
			}
			
			function triggerSelectEvent(event) {
				var date = new Date(currentYear, currentMonth, currentDay);
					
				var label = [];
				label[0] = (date.getDate() < 10) ? '0' + date.getDate() : date.getDate();
				label[1] = ((date.getMonth() + 1) < 10) ? '0' + (date.getMonth() + 1) : date.getMonth() + 1;
				label[2] = (date.getFullYear());

				if(event != undefined) {
					event({date: date, label: label.join('.')});
				}
			}
			
			function createContrast(color) {
				if(color.length < 5) {
					color += color.slice(1);
				}
				
				return (color.replace('#','0x')) > (0xffffff) ? '#222' : '#fff';
			}
			
			function createAccent(color, percent) {
				var num = parseInt(color.slice(1),16), amt = Math.round(2.55 * percent), R = (num >> 16) + amt, G = (num >> 8 & 0x00FF) + amt, B = (num & 0x0000FF) + amt;
				return '#' + (0x1000000 + (R < 255 ? R < 1 ? 0 : R : 255) * 0x10000 + (G < 255 ? G < 1 ? 0 : G : 255) * 0x100 + (B < 255 ? B < 1 ? 0 : B : 255)).toString(16).slice(1);
			}

		}(jQuery));
		
		
		</script>
		
<style type="text/css">
	.calendar { 
    box-shadow: 0px 3px 3px rgba(0, 0, 0, 0.25); 
    font: 13px/1.5 "Helvetica Neue", Helvatica, Arial, san-serif; 
    display: table; 
	width: 100%;
	height: 100%;
}

.calendar header { 
    cursor: default; 
    height: 40px; 
    position: relative; 
    font-weight: bold;  
    text-transform: uppercase; 
} 
.calendar header span { 
    display: inline-block; 
    line-height: 40px; 
}

.calendar header .button { 
    width: 40px; 
    text-align: center; 
    position: absolute; 
	cursor: pointer;
} 

.calendar header .left.button { 
    left:0; 
} 

.calendar header .right.button { 
    right:0; 
    top:0; 
} 

.calendar header .header-label { 
    letter-spacing: 1px; 
    width: 100%; 
    text-align: center; 
	cursor: pointer;
}

.calendar table { 
    background:#fff; 
    border-collapse: collapse; 
} 
.calendar table td { 
    color:#2b2b2b; 
    width:30px; 
    height:30px; 
    line-height:30px; 
    text-align:center; 
    border:1px solid #e6e6e6; 
    cursor:default; 
} 
.calendar thead th { 
    height:26px; 
    line-height: 26px; 
    text-transform:uppercase; 
    font-size:90%; 
    color:#9e9e9e; 
} 
.calendar thead th:not(:last-child) { 
    border-right:1px solid #fff; 
}

.calendar .calendar-frame table { 
    width: 100%;
} 

.calendar .calendar-frame tbody td.today { 
    background:#eee; 
    color:#555;  
} 

.calendar .calendar-frame tbody td:not(.disabled).selected { 
    background:#eee; 
    color:#555;  
} 

.calendar .calendar-frame tbody td:not(.disabled):hover { 
    color: #fff;
	background:	#555;
	cursor: pointer;
 }
 
 .calendar .calendar-frame .current tbody tr {
 	height: 53px;
 
 }
	
	</style>
	
		
			
			<div class="m-1" id="pnlEventCalendar" style="width:100%; height: 334.667px; border-right-width: 5px;	border-top-width: 5px;	border-bottom-width: 5px;    border-left-width: 5px;	border-style: solid;	border-color: firebrick;"></div>
			
			<!-- 제거 예정 테스트용 -->
			 <p>(테스트)캘린더 입력 값: <b><span id="lblEventCalendar">[date]</span></b></p>
			
			<script>
			$(function () {
				$('#pnlEventCalendar').calendar({
					color: '#ff0000',
					months: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
					days: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],onSelect: function (event) {
					$('#lblEventCalendar').text(event.label);
				}});
			});
			</script>
			
	