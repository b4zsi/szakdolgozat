import React from "react";
import "../styles/loadingAnimation.css";

function Loader() {
  return (
    <div className="loaderDiv">
      <div className="text">Loading...</div>
      <div className="loader" />
    </div>
  );
}

export default Loader;
