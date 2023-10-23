import { FC } from "react";
import { DriverModel } from "../../model/DriverModel";
import DriverSingular from "../Drivers/Drivers";
import ImageList from "@material-ui/core/ImageList";

const SingleLineGridList: FC<String> = ({ drivers }: any) => {
  return (
    <div
      style={{
        display: "flex",
        flexWrap: "wrap",
        justifyContent: "space-around",
        overflow: "hidden",
      }}
    >
      <ImageList
        style={{ flexWrap: "nowrap", transform: "translateZ(0)" }}
        cols={2.5}
      >
        hello
      </ImageList>
    </div>
  );
};
export default SingleLineGridList;
