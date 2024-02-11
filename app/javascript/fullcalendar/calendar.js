//インストールしたファイルたちを呼び出します。
import { Calendar} from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';

//<div id='calendar'></div>のidからオブジェクトを定義してカレンダーを作っていきます。
document.addEventListener('turbolinks:load', function() {
    var calendarEl = document.getElementById('calendar');

    // //カレンダーの中身を設定
    if (calendarEl) {
        var calendar = new Calendar(calendarEl, {
            plugins: [ dayGridPlugin, interactionPlugin, timeGridPlugin ],
            initialView: 'dayGridMonth',

            //細かな表示設定
            locale: 'ja',
            timeZone: 'Asia/Tokyo',
            firstDay: 1,
            headerToolbar: {
              start: 'prev,next',
              center: 'title',
              end: 'today,dayGridMonth,timeGridDay'
            },
            expandRows: true,
            stickyHeaderDates: true,
            buttonText: {
              today: '今日'
            },
            allDayText: '終日',
            height: "auto",
            navLinks: true,
            events: '/schedules.json',

        });
        //カレンダー表示
        calendar.render();
    }
});