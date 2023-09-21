import videobg from "../../background_video.mp4";

function BackgroundVideo() {
  return (
    <div
      style={{
        position: "fixed",
        width: "100%",
        right: 150,
        bottom: 0,
        zIndex: -1,
      }}
    >
      <video src={videobg} autoPlay loop muted></video>
    </div>
  );
}

export default BackgroundVideo;
