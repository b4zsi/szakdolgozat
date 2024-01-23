import React, { Fragment } from "react";
import ResponsiveAppBar from "./navbar/navbar";
import { Outlet } from "react-router-dom";
import Footer from "./footerComponent/footer";
// import Footer from "./footerComponent/footer";

export default function rootLayout() {
  return (
    <Fragment>
      <ResponsiveAppBar />
      <main>
        <Outlet />
      </main>
      <Footer />
    </Fragment>
  );
}
