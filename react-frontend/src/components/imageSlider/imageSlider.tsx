import { useState, useEffect, Fragment } from "react";
import styles from "../../styles/SliderStyle.module.css";
import { ImageModel } from "../../model/ImageModel";

type image = {
  images: ImageModel[];
  team_name: string;
};

const Slider: React.FC<image> = (images: image) => {
  const [currentSlide, setCurrentSlide] = useState(0);
  const slideLength = images.images.length;

  const autoScroll = true;
  let slideInterval: NodeJS.Timeout;
  const intervalTime = 5000;

  const nextSlide = () => {
    setCurrentSlide(currentSlide === slideLength - 1 ? 0 : currentSlide + 1);
  };

  function auto() {
    slideInterval = setInterval(nextSlide, intervalTime);
  }

  useEffect(() => {
    setCurrentSlide(0);
  }, []);

  useEffect(() => {
    if (autoScroll) {
      auto();
    }
    return () => clearInterval(slideInterval);
  }, [currentSlide]);

  return (
    <Fragment>
      <div className={styles.slider}>
        {images.images.map((image: ImageModel, index: number) => {
          return (
            <div
              className={
                index === currentSlide
                  ? `${styles.slide} ${styles.current}`
                  : `${styles.slide}`
              }
              key={index}
            >
              {index === currentSlide && (
                <div>
                  <img
                    src={image.image_url}
                    alt="slide"
                    className={styles.image}
                  />
                  <div className={styles.content}>
                    <h2>{images.team_name}</h2>
                  </div>
                </div>
              )}
            </div>
          );
        })}
      </div>
    </Fragment>
  );
};

export default Slider;
