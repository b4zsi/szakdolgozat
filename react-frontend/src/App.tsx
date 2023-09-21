import "./App.css";
import axios from "axios";
import Examples from "./components/examples";
import Typeanimation from "./components/typeAnimation/typeanimation";
import ResponsiveAppBar from "./components/navbar/navbar";
import BackgroundVideo from "./components/backgroundvideo/backgroundVideo";
import { useEffect, useState } from "react";
import Button from "@mui/material/Button";
import styled from "@emotion/styled";

const API_URL = "http://localhost:3000/api/v1/examples";

const LoginButton = styled(Button)({
  margin: "20px",
  backgroundColor: "black",
  padding: "20px 40px",
  fontSize: "20px",
});

async function getAPIData() {
  const response = await axios.get(API_URL);
  return response.data;
}

function App() {
  const [examples, setExamples] = useState([]);

  useEffect(() => {
    let mounted = true;
    getAPIData().then((items) => {
      if (mounted) {
        setExamples(items);
      }
    });
    return () => {
      mounted = false;
    };
  }, []);
  return (
    <div className="App">
      <ResponsiveAppBar />
      <Typeanimation />
      <BackgroundVideo />
      <div>
        <LoginButton variant="contained">Bejelentkezés</LoginButton>
        <LoginButton variant="contained">Regisztráció</LoginButton>
      </div>
    </div>
  );
}

export default App;
