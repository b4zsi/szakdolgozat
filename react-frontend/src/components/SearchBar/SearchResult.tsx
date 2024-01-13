import { Link } from "react-router-dom";
import "./SearchResult.css";

type nameAndSlug = {
  name: string;
  slug: string;
};

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const SearchResult = ({ name }: nameAndSlug, { slug }: nameAndSlug) => {
  return <Link to={slug}>{name}</Link>;
};
