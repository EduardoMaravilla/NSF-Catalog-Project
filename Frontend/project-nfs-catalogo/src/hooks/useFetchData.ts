import { ApiResponseError } from "../types/TypesErrors";
import { FetchState } from "../types/TypeFetch";

export const useFetchData = <T>(url: string, options: RequestInit = {}) => {

  const getFetch = async () => {
    const defaultState:FetchState<T> = {
      data: null,
      errors: null,
    };
    try {
      const response = await fetch(url, options);     
      const newData: T | ApiResponseError| null = await response.json();
      defaultState.data = newData;
      defaultState.errors = null;
      return defaultState;
    } catch (error) {
      defaultState.data = null;
      defaultState.errors = error instanceof Error ? error : new Error("Unknown error");
      return defaultState;
    }
  };  
  return {getFetch };
};
