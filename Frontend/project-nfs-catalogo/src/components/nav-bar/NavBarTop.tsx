import { Navbar, Container, Nav, NavDropdown } from "react-bootstrap";
import { Link, useNavigate } from "react-router-dom";
import { useAuth } from "../../context/auth/useAuth";
import { AuthenticationContext } from "../../context/auth/AuthenticationContext";
import { useAuthLogoutService } from "../../services/auth/useAuthLogoutService";
import { useState } from "react";
import { useCarConfiguration } from "../../context/config-car/useCarConfiguration";
import { CarConfigurationContext } from "../../context/config-car/CarConfigurationContext";
import useWindowSize from "../../hooks/useWindowSize";
import useCurrentPath from "../../hooks/useCurrentPath";
import { isApiResponseError, isLogoutResponse } from "../../utilities/funcionExport";
import { initialCarConfiguration } from "../../types/TypeCars";
import { LogoutSuccesful } from "../modals-components/LogoutSuccesfulModal";


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
  const { setCarConfigurationCreated } = useCarConfiguration(
    CarConfigurationContext
  );

  const { width } = useWindowSize();
  const currentPath = useCurrentPath();

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
        setCarConfigurationCreated({ ...initialCarConfiguration });
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
    if (!isLogined) {
      navigate("/home");
    }
  };

  const handleModalHide = () => {
    setShowSuccesfulModal(false);
  };

  return (
    <>
      <Navbar collapseOnSelect expand="lg" bg="dark" variant="dark">
        {width >= 992 ? (
          <div className="d-flex h-100 justify-content-center align-items-center">
            <img
            className="mx-2"
              src="/icon.png"
              alt="Race Car"
              onClick={onClickTitle}
            />
            <p
            className="fs-3 mx-2 text-nowrap"
              style={{ color: "white"}}
              onClick={onClickTitle}
            >
              {t("title")}
            </p>
          </div>
        ) : null}
        <Container>
          {width < 992 ? (
            <Navbar.Brand onClick={onClickTitle}>
              <img src="/icon.png" alt="Race Car" width="50vh" /> {t("title")}
            </Navbar.Brand>
          ) : null}
          <Navbar.Toggle aria-controls="responsive-navbar-nav" />
          <Navbar.Collapse id="responsive-navbar-nav">
            <Nav className="me-auto">
              <Nav.Link
                as={Link}
                to="/home"
                disabled={isLogined}
                active={currentPath === "/home"}
              >
                {t("home")}
              </Nav.Link>
              <Nav.Link
                as={Link}
                to="/about"
                disabled={isLogined}
                active={currentPath === "/about"}
              >
                {t("about")}
              </Nav.Link>
              <Nav.Link
                as={Link}
                to="/contact"
                disabled={isLogined}
                active={currentPath === "/contact"}
              >
                {t("contact")}
              </Nav.Link>
            </Nav>
            <Nav>
              {isAuthenticated ? (
                <Nav.Link onClick={async () => await onHandleClickLogout()}>
                  {t("logout")}
                </Nav.Link>
              ) : (
                <Nav.Link
                  as={Link}
                  to="/login"
                  disabled={isLogined}
                  active={currentPath === "/login"}
                >
                  {t("login")}
                </Nav.Link>
              )}
              <NavDropdown
                title={t("language") + "(" + t("currentLanguage") + ")"}
                id="collapsible-nav-dropdown"
                disabled={isLogined}
              >
                <NavDropdown.Item
                  className="fw-medium"
                  onClick={() => changeLanguage("en")}
                >
                  English (en)
                </NavDropdown.Item>
                <NavDropdown.Item
                  className="fw-medium"
                  onClick={() => changeLanguage("es")}
                >
                  Español (es)
                </NavDropdown.Item>
              </NavDropdown>
            </Nav>
          </Navbar.Collapse>
        </Container>
        <LogoutSuccesful
          show={showSuccesfulModal}
          onHide={handleModalHide}
          t={t}
        />
      </Navbar>
    </>
  );
};

export default NavBarTop;
