import { FC } from "react";
import ImageList from "@material-ui/core/ImageList";

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const SingleLineGridList: FC<string> = ({ drivers }: any) => {
  console.log(drivers);
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
