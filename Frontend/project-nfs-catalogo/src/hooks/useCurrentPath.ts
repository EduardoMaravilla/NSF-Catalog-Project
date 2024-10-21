import { useLocation } from "react-router-dom";

const useCurrentPath = () => {
  const location = useLocation();
  return location.pathname; // Retorna la ruta actual
};

export default useCurrentPath;