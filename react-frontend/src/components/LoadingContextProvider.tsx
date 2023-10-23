import React from "react";

export const IsLoadingGlobalState = React.createContext(
  {} as {
    isPageLoading: boolean;
    setIsPageLoading: React.Dispatch<React.SetStateAction<boolean>>;
  }
);
