import { useState, useEffect, Fragment } from "react";
import "../../styles/sliderStyle.css";
import { ImageModel } from "../../model/ImageModel";

type image = {
  images: ImageModel[];
  team_name: string;
};

const Slider: React.FC<image> = (images: image) => {
  const [currentSlide, setCurrentSlide] = useState(0);
  const slideLength = images.images.length;

  const autoScroll = true;
  let slideInterval: any;
  let intervalTime = 5000;

  const nextSlide = () => {
    setCurrentSlide(currentSlide === slideLength - 1 ? 0 : currentSlide + 1);
    console.log("next");
  };

  const prevSlide = () => {
    setCurrentSlide(currentSlide === 0 ? slideLength - 1 : currentSlide - 1);
    console.log("prev");
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
      <div className="slider">
        {images.images.map((image: ImageModel, index: any) => {
          return (
            <div
              className={index === currentSlide ? "slide current" : "slide"}
              key={index}
            >
              {index === currentSlide && (
                <div>
                  <img
                    src={`data:image/jpeg;base64, ${image.image_url}`}
                    alt="slide"
                    className="image"
                  />
                  <div className="content">
                    <h2>{images.team_name}</h2>
                  </div>
                </div>
              )}
            </div>
          );
        })}
        Információkért görgess lejjebb
      </div>
    </Fragment>
  );
};

export default Slider;
