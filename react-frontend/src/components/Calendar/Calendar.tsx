import React from "react";
import { Scheduler } from "@aldabil/react-scheduler";

function Calendar() {
  return (
    <div style={{ height: "1800px", backgroundColor: "white", color: "black" }}>
      <Scheduler
        view="week"
        navigation={false}
        height={400}
        disableViewNavigator={true}
        hourFormat="24"
        month={{
          weekDays: [0, 1, 2, 3, 4, 5, 6],
          weekStartOn: 0,
          startHour: 0,
          endHour: 23,
        }}
        day={{
          startHour: 0,
          endHour: 24,
          step: 60,
          navigation: true,
        }}
        events={[
          {
            event_id: 1,
            title: "Verseny 1",
            start: new Date("2023/11/6 09:30"),
            end: new Date("2023/11/6 10:30"),
            color: "black",
          },
        ]}
        // events={[
        //   {
        //     event_id: 1,
        //     title: "Event 1",
        //     start: new Date("2021/5/2 09:30"),
        //     end: new Date("2021/5/2 10:30"),
        //   },
        //   {
        //     event_id: 2,
        //     title: "Event 2",
        //     start: new Date("2021/5/4 10:00"),
        //     end: new Date("2021/5/4 11:00"),
        //   },
        // ]}
      />
    </div>
  );
}

export default Calendar;
