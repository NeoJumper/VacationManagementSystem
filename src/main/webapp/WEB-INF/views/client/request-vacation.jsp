<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css" />
    <script type="importmap">
      {
        "imports": {
          "@fullcalendar/core": "https://cdn.skypack.dev/@fullcalendar/core@6.1.15",
          "@fullcalendar/daygrid": "https://cdn.skypack.dev/@fullcalendar/daygrid@6.1.15"
        }
      }
    </script>
    <script type="module">
      import { Calendar } from "@fullcalendar/core";
      import dayGridPlugin from "@fullcalendar/daygrid";

      document.addEventListener("DOMContentLoaded", function () {
        const calendarEl = document.getElementById("calendar");
        const startDateInput = document.getElementById("start-date");
        const endDateInput = document.getElementById("end-date");
        const startTimeInput = document.getElementById("start-time");
        const eventDetails = document.getElementById("event-details");

        // 오늘 날짜와 시간을 YYYY-MM-DD 형식으로 설정
        const today = new Date().toISOString().split("T")[0];
        const now = new Date().toLocaleTimeString([], {
          hour: "2-digit",
          minute: "2-digit",
        });

        // input 태그에 최소값 설정
        startDateInput.min = today;
        endDateInput.min = today;
        startTimeInput.min = now;

        const calendar = new Calendar(calendarEl, {
          plugins: [dayGridPlugin],
          headerToolbar: {
            left: "prev,next today",
            center: "title",
            right: "",
          },
          eventSources: [
            {
              events: [
                { title: "event", start: "2024-08-01" },
                { title: "연차", start: "2024-08-14", end: "2024-08-16T20:59:59"},
              ],
              color: "blue",
              textColor: "white",
            },
          ],
          selectable: true, // 드래그로 날짜 선택 가능
          select: function (info) {
            // 선택된 날짜 범위 처리
            const startDate = info.startStr;
            const endDate = info.endStr;

            // 선택된 날짜를 입력란에 채우기
            startDateInput.value = startDate;
            endDateInput.value = endDate;
          },
          eventClick: function (info) {
            // 클릭된 이벤트의 세부 정보 표시
            alert(info);
            console.log(info.event);
            const event = info.event;
            eventDetails.innerHTML = `
              <h4>이벤트 상세 정보</h4>
              <p><strong>제목:</strong> ${event.title}</p>
              <p><strong>시작:</strong> ${event.start.toISOString().split('T')[0]}</p>
            `;
          },
        });
        calendar.render();
      });
    </script>
    <style>
      /* 최외각 div */
      .container-vac {
        display: flex;
        gap: 20px;
        padding-left: 20px;
      }
      .req-vac {
        flex: 1;
        background-color: #f9f9fb;
        padding: 63px 20px;
      }
      .req-vac h4 {
        margin-bottom: 20px;
      }
      .req-vac label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
      }
      .req-vac select,
      .req-vac input[type="date"],
      .req-vac input[type="time"],
      .req-vac button {
        width: 100%;
        padding: 8px;
        margin-bottom: 20px;
        font-size: 16px;
        box-sizing: border-box;
      }
      .req-vac button {
        background-color: #007bff;
        color: white;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        padding: 13px;
      }
      .req-vac button:hover {
        background-color: #0056b3;
      }
      #event-details {
        margin-top: 20px;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #f0f0f0;
      }
    </style>
  </head>

  <body>
    <%@ include file="/resources/components/header.jsp" %> 
    <%@ include file="/resources/components/sidebar.jsp" %>

    <div id="mainArea">
      <div class="container-vac">
        <div id="calendar" style="width: 75%;"></div>
        <div class="req-vac">
          <form action="#" method="post">
            <h4>휴가 신청하기</h4>
            <label for="vacation-type">휴가 유형</label>
            <select id="vacation-type">
              <option value="annual">연차</option>
              <option value="half">반차</option>
              <option value="sick">병가</option>
            </select>

            <label for="start-date">시작 날짜</label>
            <input type="date" id="start-date" />

            <label for="end-date">마지막 날짜</label>
            <input type="date" id="end-date" />

            <label for="start-time">시작 시간</label>
            <input type="time" id="start-time" />

            <label for="approve1">승인권자 1</label>
            <select id="approve1"></select>

            <label for="approve2">승인권자 2</label>
            <select id="approve2"></select>

            <label for="approve3">승인권자 3</label>
            <select id="approve3"></select>

            <button id="submit-vacation" type="submit">신청하기</button>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
