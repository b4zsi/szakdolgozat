import videobg from "../../background_video.mp4";

function BackgroundVideo() {
  return (
    <div
      style={{
        objectFit: "cover",
        position: "fixed",
        top: 0,
        left: 0,
        zIndex: -1,
      }}
    >
      <video src={videobg} autoPlay loop muted width={"100%"}></video>
    </div>
  );
}

export default BackgroundVideo;
