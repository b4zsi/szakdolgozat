import React, { useContext } from "react";
import CopyrightIcon from "@mui/icons-material/Copyright";
import { IsLoadingGlobalState } from "../LoadingContextProvider";

function Footer() {
  const { isPageLoading, setIsPageLoading } = useContext(IsLoadingGlobalState);
  return isPageLoading ? (
    <div
      style={{
        background:
          " linear-gradient(to left, rgba(0,0,0,1), rgba(55,55,55, 1))",
        position: "absolute",
        width: "100%",
        height: "10%",
        left: 0,
        color: "white",
        fontSize: 25,
      }}
    >
      <footer>
        <div>
          2023 Minden jog fenntartva.
          <CopyrightIcon style={{ margin: 5 }} />
        </div>
      </footer>
    </div>
  ) : (
    <></>
  );
}

export default Footer;
