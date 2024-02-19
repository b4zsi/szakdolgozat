import ReactDOM from "react-dom/client";
import reportWebVitals from "./reportWebVitals";
import {
  Route,
  RouterProvider,
  createBrowserRouter,
  createRoutesFromElements,
} from "react-router-dom";
import rootLayout from "./components/rootLayout";
import HomePage from "./views/pages/HomePage";
import Series, { SeriesLoader } from "./components/Series/Series";
import Driver_singular, {
  DriverLoader,
} from "./components/Driver_singular/Driver_singular";
import Team_singular, {
  TeamLoader,
} from "./components/Team_singular/Team_singular";
import NotFound from "./components/NotFound/NotFound";
import { useState } from "react";
import { IsLoadingGlobalState } from "./components/LoadingContextProvider";
import Login from "./components/User/Login";
import SignUp from "./components/User/Signup";
import Calendar, { CalendarLoader } from "./components/Calendar/Calendar";
import Forum, { ForumLoader } from "./components/Forum/Forum";
import Gallery, { GalleryLoader } from "./components/Gallery/Gallery";
import Profile, { ProfilLoader } from "./components/User/Profile";
import Comments, { CommentLoader } from "./components/Comments/Comments";
import Users, { UsersLoader } from "./components/User/Users";
import Car_singular, {
  CarLoader,
} from "./components/Car_singular.tsx/Car_singular";
import { AllTrackLoader } from "./components/Track/AllTrack";
import AllTrack from "./components/Track/AllTrack";
import Track, { TrackLoader } from "./components/Track/Track";
import Rules from "./components/Rules/Rules";
import FormulaEsport from "./components/Rules/FormulaEsport/FormulaEsport";
import Formula1 from "./components/Rules/Formula1/Formula1";
import Formula2 from "./components/Rules/Formula2/Formula2";
import Formula3 from "./components/Rules/Formula3/Formula3";

const root = ReactDOM.createRoot(
  document.getElementById("root") as HTMLElement
);
const router = createBrowserRouter(
  createRoutesFromElements(
    <Route path="/" Component={rootLayout}>
      <Route index Component={HomePage} />
      <Route Component={Series} path="/series/:id" loader={SeriesLoader} />
      <Route Component={Login} path="/login" />
      <Route Component={SignUp} path="/signup" />
      <Route Component={Calendar} path="/calendar" loader={CalendarLoader} />
      <Route Component={Forum} path="/forum" loader={ForumLoader} />
      <Route Component={Team_singular} path="teams/:slug" loader={TeamLoader} />
      <Route Component={Gallery} path="/gallery/" loader={GalleryLoader} />
      <Route Component={Profile} path="/profile" loader={ProfilLoader} />
      <Route Component={Users} path="fiokok" loader={UsersLoader} />
      <Route Component={Car_singular} path="cars/:id" loader={CarLoader} />
      <Route Component={AllTrack} path="/tracks" loader={AllTrackLoader} />
      <Route Component={Track} path="tracks/:id" loader={TrackLoader} />
      <Route Component={Rules} path="/rules" />
      <Route Component={FormulaEsport} path="/rules/formula-esport" />
      <Route Component={Formula1} path="/rules/formula-1" />
      <Route Component={Formula2} path="/rules/formula-2" />
      <Route Component={Formula3} path="/rules/formula-3" />
      <Route
        Component={Comments}
        path="forum/comment/:id"
        loader={CommentLoader}
      />

      <Route
        path="drivers/:slug"
        Component={Driver_singular}
        loader={DriverLoader}
      />

      <Route path="*" Component={NotFound} />
    </Route>
  )
);

export const App = () => {
  const [isPageLoading, setIsPageLoading] = useState(true);
  return (
    <IsLoadingGlobalState.Provider value={{ isPageLoading, setIsPageLoading }}>
      <RouterProvider router={router} />
    </IsLoadingGlobalState.Provider>
  );
};

root.render(<App />);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
