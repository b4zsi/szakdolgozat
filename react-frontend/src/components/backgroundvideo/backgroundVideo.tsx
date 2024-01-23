import videobg from "../../background_video.mp4";

function BackgroundVideo() {
  return (
    <div
      style={{
        objectFit: "cover",
        height: "100%",
        position: "fixed",
        top: 0,
        left: 0,
        zIndex: -1,
      }}
    >
      <video src={videobg} autoPlay loop muted width={"1470em"}></video>
    </div>
  );
}

export default BackgroundVideo;
