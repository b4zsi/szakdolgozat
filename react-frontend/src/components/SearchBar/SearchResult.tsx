import { Link } from "react-router-dom";
import "./SearchResult.css";
import { useEffect, useState } from "react";
import { getDriverNames } from "../../api_links";

type nameAndSlug = {
  name: string;
  slug: string;
};

export const SearchResult = ({ name, slug }: nameAndSlug) => {
  const [driverSlugs, setDriverSlugs] = useState<nameAndSlug[]>([]);
  let isDriver = false;

  useEffect(() => {
    if (name.includes("-")) {
      return;
    }
    fetch(getDriverNames, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    }).then(async (response) => {
      return response.json().then((data) => {
        setDriverSlugs(data);
      });
    });
  }, []);
  console.log(driverSlugs);

  driverSlugs.map((driver: nameAndSlug) => {
    if (driver.slug === slug) {
      isDriver = true;
    }
  });

  if (isDriver) {
    return <Link to={`/drivers/${slug}`}>{name}</Link>;
  } else {
    return <Link to={`/teams/${slug}`}>{name}</Link>;
  }
};
