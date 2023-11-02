import React from "react";
import "../../App.css";
import Typeanimation from "../../components/typeAnimation/typeanimation";
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

//const signInForm = document.querySelector("#sign_in_form");

const HomePage = () => {
  return (
    <>
      <div className="App">
        <Typeanimation />

        <div style={{ width: "90%" }}>
          <BackgroundVideo />
        </div>

        <div>
          <CustomButton variant="contained">Galéria</CustomButton>
          <CustomButton variant="contained">Naptár</CustomButton>
        </div>
      </div>
    </>
  );
};

export default HomePage;
