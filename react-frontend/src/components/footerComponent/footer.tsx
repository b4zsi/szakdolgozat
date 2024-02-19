function Footer() {
  return (
    <div
      style={{
        backgroundColor: "black",
        position: "absolute",
        width: "100%",
        height: "6em",
        left: 0,
        color: "white",
        fontSize: 25,
      }}
    >
      <footer style={{ textAlign: "center" }}>
        <div style={{ margin: "auto" }}>Facebook</div>
        <div style={{ margin: "auto" }}>Instagram</div>
        <div style={{ margin: "auto" }}>Twitter</div>
        <div style={{ margin: "auto" }}>2023 | Minden jog fenntartva.</div>
      </footer>
    </div>
  );
}

export default Footer;
