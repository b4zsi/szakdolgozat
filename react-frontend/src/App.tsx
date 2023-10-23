import { Route, Routes } from "react-router-dom";
import Series from "./components/Series/Series";
import HomePage from "./views/pages/HomePage";
import Footer from "./components/footerComponent/footer";
import ResponsiveAppBar from "./components/navbar/navbar";
import Driver_singular from "./components/Driver_singular/Driver_singular";
import Team_singular from "./components/Team_singular/Team_singular";
import { IsLoadingGlobalState } from "./components/LoadingContextProvider";
import { useState } from "react";

function App() {
  const [isPageLoading, setIsPageLoading] = useState(true);

  return (
    <>
      <IsLoadingGlobalState.Provider
        value={{ isPageLoading, setIsPageLoading }}
      >
        <ResponsiveAppBar />
        <Routes>
          <Route path="/" Component={HomePage} />
          <Route path="/series/:id" Component={Series} />
          <Route path="/drivers/:slug" Component={Driver_singular} />
          <Route path="/teams/:slug" Component={Team_singular} />
          <Route path="*" Component={HomePage} />
        </Routes>
        <Footer />
      </IsLoadingGlobalState.Provider>
    </>
  );
}

export default App;
