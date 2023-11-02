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

const root = ReactDOM.createRoot(
  document.getElementById("root") as HTMLElement
);
const router = createBrowserRouter(
  createRoutesFromElements(
    <Route path="/" Component={rootLayout}>
      <Route index Component={HomePage} />
      <Route Component={Login} path="/login" />
      <Route Component={SignUp} path="/signup" />

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
