import videobg from "../../background_video.mp4";

function BackgroundVideo() {
  return (
    <div
      style={{
        objectFit: "cover",
        width: "80vw",
        height: "100vh",
        position: "fixed",
        top: 0,
        left: 0,
        zIndex: -1,
      }}
    >
      <video src={videobg} autoPlay loop muted></video>
    </div>
  );
}

export default BackgroundVideo;
