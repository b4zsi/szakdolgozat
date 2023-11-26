import ReactDOM from "react-dom/client";
import "./index.css";
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
import UpdateProfile from "./components/User/UpdateProfile";
import Comments, { CommentLoader } from "./components/Comments/Comments";

const root = ReactDOM.createRoot(
  document.getElementById("root") as HTMLElement
);
const router = createBrowserRouter(
  createRoutesFromElements(
    <Route path="/" Component={rootLayout}>
      <Route index Component={HomePage} />
      <Route Component={Login} path="/login" />
      <Route Component={SignUp} path="/signup" />
      <Route Component={Calendar} path="/calendar" loader={CalendarLoader} />
      <Route Component={Forum} path="/forum" loader={ForumLoader} />
      <Route Component={Gallery} path="/gallery/" loader={GalleryLoader} />
      <Route Component={Profile} path="/profile" loader={ProfilLoader} />
      <Route Component={UpdateProfile} path="/profile-update" />
      <Route
        Component={Comments}
        path="forum/comment/:id"
        loader={CommentLoader}
      />

      <Route path="series/:id" Component={Series} loader={SeriesLoader} />
      <Route
        path="drivers/:slug"
        Component={Driver_singular}
        loader={DriverLoader}
      />
      <Route path="teams/:slug" Component={Team_singular} loader={TeamLoader} />

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
