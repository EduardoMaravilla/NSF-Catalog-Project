import React from "react";
import { Container, Nav, Navbar } from "react-bootstrap";
import { FaAddressCard, FaUser } from "react-icons/fa";
import { IoIosPeople } from "react-icons/io";
import { MdCreateNewFolder } from "react-icons/md";
import { Link } from "react-router-dom";
import { useAuth } from "../context/auth/useAuth";
import { AuthenticationContext } from "../context/auth/AuthenticationContext";

type NavBarMobileProps = {
  t: (key: string) => string;
};

const NavBarMobile: React.FC<NavBarMobileProps> = ({ t }) => {
  const { isLogined } = useAuth(AuthenticationContext);

  return (
    <Navbar collapseOnSelect expand="lg" className="bg-primary-subtle">
      <Container>
        <Navbar.Toggle aria-controls="responsive-navbar-nav" />
        <h4>{t("menu")}</h4>
        <Navbar.Collapse id="responsive-navbar-nav">
          <Nav className="me-auto">
            <Nav.Link
              as={Link}
              to="/create-build"
              className="nav-item-mobile"
              disabled={isLogined}
            >
              <MdCreateNewFolder size={30} />
              <h5>{t("createBuild")}</h5>
            </Nav.Link>
            <Nav.Link
              as={Link}
              to="/community-builds"
              className="nav-item-mobile"
              disabled={isLogined}
            >
              <IoIosPeople size={30} />
              <h5>{t("communityBuilds")}</h5>
            </Nav.Link>
            <Nav.Link
              as={Link}
              to="/personal-builds"
              className="nav-item-mobile"
              disabled={isLogined}
            >
              <FaUser size={30} />
              <h5>{t("personalBuilds")}</h5>
            </Nav.Link>
            <Nav.Link
              as={Link}
              to="/profile"
              className="nav-item-mobile"
              disabled={isLogined}
            >
              <FaAddressCard size={30} />
              <h5>{t("profile")}</h5>
            </Nav.Link>
          </Nav>
        </Navbar.Collapse>
      </Container>
    </Navbar>
  );
};

export default NavBarMobile;
