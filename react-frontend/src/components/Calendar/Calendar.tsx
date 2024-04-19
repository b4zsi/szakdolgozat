import { Scheduler } from "@aldabil/react-scheduler";
import { UserModel } from "../../model/UserModel";
import { LoaderFunction, useLoaderData } from "react-router-dom";
import axios from "axios";
import { CalendarEventModel } from "../../model/CalendarEventModel";
import { ProcessedEvent } from "@aldabil/react-scheduler/types";
import moment from "moment";
import CustomSnackbar, { toastNotification } from "../Snackbar/snackbar";
import { registerLocale } from "react-datepicker";

import "react-datepicker/dist/react-datepicker.css";
import hu from "date-fns/locale/hu";
import { getCalendarEvents, getCurrentUser } from "../../api_links";
import { userInterface } from "../../interface/userInterface";

registerLocale("hu", hu);

let allDataType: {
  user: UserModel;
  calendar_events: CalendarEventModel[];
};
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
    <div style={{ backgroundColor: "white", color: "black" }}>
      {user && (
        <Scheduler
          view="month"
          navigation={true}
          height={600}
          editable={user.admin}
          draggable={user.admin}
          deletable={user.admin}
          locale={hu}
          disableViewNavigator={false}
          hourFormat="24"
          month={{
            weekDays: [0, 1, 2, 3, 4, 5, 6],
            weekStartOn: 0,
            startHour: 0,
            endHour: 24,
          }}
          day={{
            startHour: 0,
            endHour: 24,
            step: 60,
            navigation: true,
          }}
          week={{
            weekDays: [0, 1, 2, 3, 4, 5, 6],
            weekStartOn: 0,
            startHour: 0,
            endHour: 24,
            step: 60,
            navigation: true,
          }}
          translations={{
            navigation: {
              month: "Hónap",
              week: "Hét",
              day: "Nap",
              today: "Ma",
            },
            form: {
              addTitle: "Esemény hozzáadása",
              editTitle: "Esemény szerkesztése",
              confirm: "Kiválaszt",
              delete: "Törlés",
              cancel: "Mégse",
            },
            event: {
              title: "Esemény neve",
              start: "Start dátum",
              end: "Vég dátum",
              allDay: "Egész nap",
            },
            validation: {
              required: "Kötelező",
              invalidEmail: "Helytelen email cím",
              onlyNumbers: "Csak számok megengedettek",
              min: "Minimum {{min}} karakter",
              max: "Maximum {{max}} karakter",
            },
            moreEvents: "További események",
            loading: "Töltés...",
          }}
          events={calendarTypeConversion(calendar_events)}
          onConfirm={async (event, action) => {
            if (action === "create") {
              await fetch(getCalendarEvents, {
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
                .then(async (response) => {
                  await response.json().then((data) => {
                    console.log(data);
                    toastNotification(0, data.message);
                  });
                })
                .catch((error) => {
                  console.log(error);
                });
            } else if (action === "edit") {
              await fetch(getCalendarEvents + event.event_id, {
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
            await fetch(getCalendarEvents + deletedEventId, {
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
            await fetch(getCalendarEvents + originalEvent.event_id, {
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
                  toastNotification(1, data.message);
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
    user: userInterface,
    calendar_events: [],
  };
  const jwt_token = localStorage.getItem("jwt");

  await axios<UserModel>(getCurrentUser, {
    method: "GET",
    headers: {
      Authorization: `${jwt_token}`,
    },
  })
    .then(async (response) => {
      console.log(response);
      if (response.status === 200) {
        allData.user = response.data;
      } else {
        window.location.href = "/notfound";
      }
    })
    .catch((error) => {
      console.log(error);
    });
  await axios.get(getCalendarEvents).then((data) => {
    allData.calendar_events = data.data;
  });
  return allData;
};

export default Calendar;
