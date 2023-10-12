import React from "react";
import "../../App.css";
import Typeanimation from "../../components/typeAnimation/typeanimation";
import ResponsiveAppBar from "../../components/navbar/navbar";
import BackgroundVideo from "../../components/backgroundvideo/backgroundVideo";
import Button from "@mui/material/Button";
import styled from "@emotion/styled";

const CustomButton = styled(Button)({
  margin: "20px",
  backgroundColor: "black",
  padding: "20px 40px",
  fontSize: "20px",
  borderRadius: "10px",
});

const HomePage = () => {
  return (
    <>
      <div className="App">
        <ResponsiveAppBar />
        <Typeanimation />
        <BackgroundVideo />
        <div>
          <CustomButton variant="contained">Galéria</CustomButton>
          <CustomButton variant="contained">Fórum</CustomButton>
        </div>
      </div>
      ;
    </>
  );
};

export default HomePage;
