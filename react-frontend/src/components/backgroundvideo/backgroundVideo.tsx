import videobg from "../../background_video.mp4";

function BackgroundVideo() {
  return (
    <div
      style={{
        objectFit: "cover",
        width: "60vw",
        height: "10vh",
        position: "fixed",
        top: 0,
        left: 0,
        zIndex: -1,
      }}
    >
      <video
        src={videobg}
        autoPlay
        loop
        muted
        style={{
          height: 830,
        }}
      ></video>
    </div>
  );
}

export default BackgroundVideo;
