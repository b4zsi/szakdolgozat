import "./App.css";
import Typeanimation from "./components/typeAnimation/typeanimation";
import ResponsiveAppBar from "./components/navbar/navbar";
import BackgroundVideo from "./components/backgroundvideo/backgroundVideo";
import Button from "@mui/material/Button";
import styled from "@emotion/styled";
import { Router, Route, Routes } from "react-router-dom";
import Series_singular from "./components/Series_singular/Series_singular";
import Series from "./components/Series/Series";

const CustomButton = styled(Button)({
  margin: "20px",
  backgroundColor: "black",
  padding: "20px 40px",
  fontSize: "20px",
  borderRadius: "10px",
});

function App() {
  console.log("hehehehe");
  return (
    <Routes>
      <Route path="/series" Component={Series} />
      <Route path="/series/:id" Component={Series_singular} />
    </Routes>

    //{
    /* <div className="App">
        <ResponsiveAppBar />
        <Typeanimation />
        <BackgroundVideo />
        <div>
          <CustomButton variant="contained">Galéria</CustomButton>
          <CustomButton variant="contained">Fórum</CustomButton>
        </div>
      </div> */
    //}
  );
}

export default App;
