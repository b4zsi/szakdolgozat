import { Route, Routes } from "react-router-dom";
import Series from "./components/Series/Series";
import HomePage from "./views/pages/HomePage";

function App() {
  return (
    <Routes>
      <Route path="/" Component={HomePage} />
      <Route path="/series/:id" Component={Series} />
    </Routes>
  );
}

export default App;
