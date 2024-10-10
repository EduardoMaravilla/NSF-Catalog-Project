import { Navbar, Container, Nav, NavDropdown } from "react-bootstrap";
import { Link, useNavigate } from "react-router-dom";
import { useAuth } from "../context/auth/useAuth";
import { AuthenticationContext } from "../context/auth/AuthenticationContext";

import { LogoutSuccesful } from "./modals-components/LogoutSuccesfulModal";
import { useState } from "react";
import {
  isApiResponseError,
  isLogoutResponse,
} from "../utilities/funcionExport";
import { useAuthLogoutService } from "../services/auth/useAuthLogoutService";
import { useCarConfiguration } from "../context/config-car/useCarConfiguration";
import { CarConfigurationContext } from "../context/config-car/CarConfigurationContext";
import { initialCarConfiguration } from "../types/TypeCars";

type NavBarTopProps = {
  t: (key: string) => string;
  changeLanguage: (lng: string) => void;
};

const NavBarTop: React.FC<NavBarTopProps> = ({ t, changeLanguage }) => {
  const {
    isAuthenticated,
    isLogined,
    jwtToken,
    setIsAuthenticated,
    setIsLogined,
    setJwtToken,
  } = useAuth(AuthenticationContext);
  const { chargeTokenInOptions, getFetch } = useAuthLogoutService();
  const [showSuccesfulModal, setShowSuccesfulModal] = useState(false);
  const navigate = useNavigate();
  const {setCarConfigurationCreated} = useCarConfiguration(CarConfigurationContext);

  const onHandleClickLogout = async () => {
    
    setIsLogined(true);
    chargeTokenInOptions(jwtToken);
    const state = await getFetch();
    if (isApiResponseError(state.data)) {
      setIsLogined(false);
    } else if (isLogoutResponse(state.data)) {
      setShowSuccesfulModal(true);
      setTimeout(() => {
        setShowSuccesfulModal(false);
        setCarConfigurationCreated({...initialCarConfiguration});
        localStorage.removeItem("token-jwt-nfs-catalog-unbound");
        localStorage.removeItem("car-configuration-created");
        localStorage.removeItem("user-profile-response");
        setIsAuthenticated(false);
        setJwtToken("");
        setIsLogined(false);
      }, 3000);
    } else {
      setIsLogined(false);
    }
  };

  const onClickTitle = () => {
    navigate("/home");
  };

  const handleModalHide = () => {
    setShowSuccesfulModal(false);
  };

  return (
    <>
      <Navbar collapseOnSelect expand="lg" bg="dark" variant="dark">
        <div className="web-only-ico">
          <img
            src="/icon.png"
            alt="Race Car"
            style={{ marginLeft: "1vh" }}
            onClick={onClickTitle}
          />
          <h2
            style={{ color: "white", marginLeft: "1vh" }}
            onClick={onClickTitle}
          >
            {t("title")}
          </h2>
        </div>
        <Container>
          <Navbar.Brand as={Link} to="/" className="mobile-only-ico">
            <img src="/icon.png" alt="Race Car" width="50vh" /> {t("title")}
          </Navbar.Brand>
          <Navbar.Toggle aria-controls="responsive-navbar-nav" />
          <Navbar.Collapse id="responsive-navbar-nav">
            <Nav className="me-auto">
              <Nav.Link as={Link} to="/home" disabled={isLogined}>
                {t("home")}
              </Nav.Link>
              <Nav.Link as={Link} to="/about" disabled={isLogined}>
                {t("about")}
              </Nav.Link>
              <Nav.Link as={Link} to="/contact" disabled={isLogined}>
                {t("contact")}
              </Nav.Link>
            </Nav>
            <Nav>
              {isAuthenticated ? (
                <Nav.Link onClick={async () => await onHandleClickLogout()}>
                  {t("logout")}
                </Nav.Link>
              ) : (
                <Nav.Link as={Link} to="/login" disabled={isLogined}>
                  {t("login")}
                </Nav.Link>
              )}
              <NavDropdown
                title={t("language") + "(" + t("currentLanguage") + ")"}
                id="collapsible-nav-dropdown"
                disabled={isLogined}
              >
                <NavDropdown.Item onClick={() => changeLanguage("en")}>
                  English
                </NavDropdown.Item>
                <NavDropdown.Item onClick={() => changeLanguage("es")}>
                  Español
                </NavDropdown.Item>
              </NavDropdown>
            </Nav>
          </Navbar.Collapse>
        </Container>
      </Navbar>
      <LogoutSuccesful
        show={showSuccesfulModal}
        onHide={handleModalHide}
        t={t}
      />
    </>
  );
};

export default NavBarTop;
