/* eslint-disable @typescript-eslint/no-explicit-any */
import "./SearchResultsList.css";
import { SearchResult } from "./SearchResult";
import { FC } from "react";

type Result = {
  results: string[];
};

function slugify(name: string) {
  return name.toLowerCase().replaceAll(" ", "-");
}

export const SearchResultsList: FC<Result> = (result: Result) => {
  return (
    <div className="results-list">
      {result.results.map((resultNames: string, id: number) => {
        return (
          <SearchResult
            name={resultNames}
            slug={slugify(resultNames)}
            key={id}
          />
        );
      })}
    </div>
  );
};
