/* eslint-disable @typescript-eslint/no-explicit-any */
import "./SearchResultsList.css";
import { SearchResult } from "./SearchResult";
import { FC } from "react";

type Result = {
  results: string[];
  resultSlugs: string[];
};
export const SearchResultsList: FC<Result> = (result: Result) => {
  return (
    <div className="results-list">
      {result.results.map((resultNames: string, id: number) => {
        return <SearchResult name={resultNames} slug={resultNames} key={id} />;
      })}
    </div>
  );
};
