import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { MdCreateNewFolder } from "react-icons/md";
import { FaUser, FaAddressCard } from "react-icons/fa";

import { Nav } from "react-bootstrap";
import { BsBoxArrowInLeft, BsBoxArrowInRight } from "react-icons/bs";
import { IoIosPeople } from "react-icons/io";
import { useAuth } from "../../context/auth/useAuth";
import { AuthenticationContext } from "../../context/auth/AuthenticationContext";
import useCurrentPath from "../../hooks/useCurrentPath";


type SideBarLeftProps = {
  t: (key: string) => string;
};

const iconSize: number = 25;

const SideBarLeft: React.FC<SideBarLeftProps> = ({ t }) => {
  const { isLogined } = useAuth(AuthenticationContext);
  const [isCollapsed, setIsCollapsed] = useState(false);
  const currentPath = useCurrentPath();

  const handleToggle = () => {
    setIsCollapsed(!isCollapsed);
    localStorage.setItem("isCollapsed-left-bar", JSON.stringify(!isCollapsed));
  };

  useEffect(() => {
    const isCollapsedLocal = localStorage.getItem("isCollapsed-left-bar");
    if (isCollapsedLocal) {
      setIsCollapsed(JSON.parse(isCollapsedLocal));
    } else {
      localStorage.setItem("isCollapsed-left-bar", JSON.stringify(false));
    }
  }, [])
  

  return (
    <div className={`left-side-bar ${isCollapsed ? "" : "expanded"}`}>
      <div className="menu-toggle" onClick={handleToggle}>
        {!isCollapsed ? (
          <>
            <p className="fs-4 mx-2">{t("menu")}</p>
            <BsBoxArrowInLeft className="fs-4 mx-2" size={iconSize + 5} />
          </>
        ) : (
          <BsBoxArrowInRight className="fs-4 mx-2" size={iconSize + 5} />
        )}
      </div>
      <hr className="menu-toggle-hr" />
      <div className="left-side-bar-menu">
        <Nav.Link
          as={Link}
          to="/create-build"
          className={`menu-item ${
            currentPath === "/create-build" ? "active" : ""
          }`}
          disabled={isLogined}
        >
          <MdCreateNewFolder className="fs-4 mx-2" size={iconSize} />
          {!isCollapsed ? (
            <span className="fs-5 mx-2">{t("createBuild")}</span>
          ) : null}
        </Nav.Link>
        <Nav.Link
          as={Link}
          to="/community-builds"
          className={`menu-item ${
            currentPath === "/community-builds" ? "active" : ""
          }`}
          disabled={isLogined}
        >
          <IoIosPeople className="fs-4 mx-2" size={iconSize} />
          {!isCollapsed ? (
            <span className="fs-5 mx-2">{t("communityBuilds")}</span>
          ) : null}
        </Nav.Link>
        <Nav.Link
          as={Link}
          to="/personal-builds"
          className={`menu-item ${
            currentPath === "/personal-builds" ? "active" : ""
          }`}
          disabled={isLogined}
        >
          <FaUser className="fs-4 mx-2" size={iconSize} />
          {!isCollapsed ? (
            <span className="fs-5 mx-2">{t("personalBuilds")}</span>
          ) : null}
        </Nav.Link>
        <Nav.Link
          as={Link}
          to="/profile"
          className={`menu-item ${currentPath === "/profile" ? "active" : ""}`}
          disabled={isLogined}
        >
          <FaAddressCard className="fs-4 mx-2" size={iconSize} />
          {!isCollapsed ? (
            <span className="fs-5 mx-2">{t("profile")}</span>
          ) : null}
        </Nav.Link>
      </div>
    </div>
  );
};

export default SideBarLeft;