import { Scheduler } from "@aldabil/react-scheduler";
import { UserModel } from "../../model/UserModel";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import axios from "axios";
import { CalendarEventModel } from "../../model/CalendarEventModel";
import { ProcessedEvent } from "@aldabil/react-scheduler/types";
import moment from "moment";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";

let allDataType: {
  user: UserModel;
  calendar_events: CalendarEventModel[];
};
const calendarEventURL = "http://localhost:3000/api/v1/calendar_events";
const jwt_token = localStorage.getItem("jwt");

function Calendar() {
  function calendarTypeConversion(
    events: CalendarEventModel[]
  ): ProcessedEvent[] {
    const return_array = new Array<ProcessedEvent>();

    events.map((event) => {
      const pe: ProcessedEvent = {
        event_id: event.id,
        title: event.title,
        start: new Date(moment(event.startDate).utc().format("YYYY/M/D H:mm")),
        end: new Date(moment(event.endDate).utc().format("YYYY/M/D H:mm")),
      };
      return_array.push(pe);
    });
    return return_array;
  }
  const loaderData: typeof allDataType = useLoaderData() as typeof allDataType;
  const user: UserModel = loaderData!.user;
  const calendar_events: CalendarEventModel[] = loaderData!.calendar_events;

  return (
    <div style={{ height: "1800px", backgroundColor: "white", color: "black" }}>
      {user && (
        <Scheduler
          view="week"
          navigation={false}
          height={400}
          editable={user.admin}
          draggable={user.admin}
          deletable={user.admin}
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
          events={calendarTypeConversion(calendar_events)}
          onConfirm={async (event, action) => {
            if (action === "create") {
              await fetch(`${calendarEventURL}`, {
                method: "POST",
                headers: {
                  "Content-Type": "application/json",
                  Authorization: `${jwt_token}`,
                },
                body: JSON.stringify({
                  calendar_events: {
                    id: calendar_events.length + 1,
                    title: event.title,
                    startDate: event.start,
                    endDate: event.end,
                  },
                }),
              })
                .then((response) => {
                  response.json().then((data) => {
                    window.location.reload();
                    toastNotification(0, data.message);
                  });
                })
                .catch((error) => {
                  console.log(error);
                });
            } else if (action === "edit") {
              await fetch(`${calendarEventURL}/${event.event_id}`, {
                method: "PUT",
                headers: {
                  "Content-Type": "application/json",
                  Authorization: `${jwt_token}`,
                },
                body: JSON.stringify({
                  calendar_events: {
                    id: event.event_id,
                    title: event.title,
                    startDate: event.start,
                    endDate: event.end,
                  },
                }),
              })
                .then((response) => {
                  response.json().then((data) => {
                    toastNotification(0, data.message);
                  });
                })
                .catch((error) => {
                  console.log(error);
                });
            }
            return event;
          }}
          onDelete={async (deletedEventId) => {
            await fetch(`${calendarEventURL}/${deletedEventId}`, {
              method: "DELETE",
              headers: { "Content-Type": "application/json" },
              body: JSON.stringify({
                id: deletedEventId,
              }),
            })
              .then((response) => {
                response.json().then((data) => {
                  window.location.reload();
                  toastNotification(0, data.message);
                });
              })
              .catch((response: Response) => {
                response.json().then((data) => {
                  toastNotification(1, data);
                });
              });
          }}
          onEventDrop={async (droppedOn, updatedEvent, originalEvent) => {
            await fetch(`${calendarEventURL}/${originalEvent.event_id}`, {
              method: "PUT",
              headers: {
                "Content-Type": "application/json",
                Authorization: `${jwt_token}`,
              },
              body: JSON.stringify({
                calendar_events: {
                  id: updatedEvent.event_id,
                  title: updatedEvent.title,
                  startDate: updatedEvent.start,
                  endDate: updatedEvent.end,
                },
              }),
            })
              .then((response) => {
                response.json().then((data) => {
                  window.location.reload();
                  toastNotification(0, data.message);
                });
              })
              .catch((response: Response) => {
                response.json().then((data) => {
                  toastNotification(1, data);
                });
              });
          }}
        />
      )}
      <CustomSnackbar />
    </div>
  );
}

export const CalendarLoader: LoaderFunction<UserModel> = async () => {
  const allData: typeof allDataType = {
    user: {
      id: 0,
      email: "",
      admin: false,
      username: "",
      keresztnev: "",
      vezeteknev: "",
      fav_team: "",
      fav_driver: "",
      banned: false,
    },
    calendar_events: [],
  };
  const current_user_url = "http://localhost:3000/current_user";
  const calendarEventUrl = "http://localhost:3000/api/v1/calendar_events";
  const jwt_token = localStorage.getItem("jwt");

  await fetch(`${current_user_url}`, {
    method: "GET",
    headers: {
      Authorization: `${jwt_token}`,
    },
  }).then(async (response) => {
    if (response.ok) {
      allData.user = await response.json();
    }
  });
  await axios.get(calendarEventUrl).then((data) => {
    allData.calendar_events = data.data;
  });
  return allData;
};

export default Calendar;
