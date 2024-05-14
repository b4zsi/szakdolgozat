/* eslint-disable @typescript-eslint/no-explicit-any */
import "./SearchResultsList.css";
import { SearchResult } from "./SearchResult";
import { FC, useRef, useState } from "react";
import React from "react";

type Result = {
  results: string[];
  resultSlugs: string[];
};
const [isVisible, setIsVisible] = useState(true);
const resultsListRef = useRef<HTMLDivElement>(null);

React.useEffect(() => {
  function handleClickOutside(event: MouseEvent) {
    if (
      resultsListRef.current &&
      !resultsListRef.current.contains(event.target as Node)
    ) {
      setIsVisible(false);
    }
  }

  document.addEventListener("mousedown", handleClickOutside);
  return () => {
    document.removeEventListener("mousedown", handleClickOutside);
  };
}, [resultsListRef]);

export const SearchResultsList: FC<Result> = (result: Result) => {
  return (
    <div
      ref={resultsListRef}
      className={`results-list ${isVisible ? "visible" : "hidden"}`}
    >
      {result.results.map((resultNames: string, id: number) => {
        return <SearchResult name={resultNames} slug={resultNames} key={id} />;
      })}
    </div>
  );
};
