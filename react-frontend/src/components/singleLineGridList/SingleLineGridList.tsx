import { FC } from "react";
import { DriverModel } from "../../model/DriverModel";
import DriverSingular from "../Driver_singular/Driver_singular";
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
        {drivers.map((item: DriverModel) => (
          <DriverSingular driver={item} key={item.name} />
        ))}
      </ImageList>
    </div>
  );
};
export default SingleLineGridList;
