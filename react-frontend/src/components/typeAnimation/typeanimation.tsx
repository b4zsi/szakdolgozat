import React from "react";
import { TypeAnimation } from "react-type-animation";

function Typeanimation() {
  return (
    <div>
      <TypeAnimation
        sequence={["Az autosportról. Mindent.", 1000]}
        wrapper="span"
        speed={40}
        style={{
          fontSize: "5em",
          display: "inline-block",
          marginTop: 200,
          fontFamily: "Monaco",
          color: "white",
        }}
        repeat={Infinity}
      />
    </div>
  );
}

export default Typeanimation;
