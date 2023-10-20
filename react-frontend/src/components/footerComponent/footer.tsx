import React from "react";

function Footer() {
  return (
    <div
      style={{
        backgroundColor: "black",
        position: "absolute",
        width: "100%",
        height: "10%",
        bottom: 0,
        color: "white",
        fontSize: 25,
      }}
    >
      <footer>
        <p style={{ textAlign: "center", margin: "auto" }}>
          2023 Minden jog fenntartva.
        </p>
      </footer>
    </div>
  );
}

export default Footer;
