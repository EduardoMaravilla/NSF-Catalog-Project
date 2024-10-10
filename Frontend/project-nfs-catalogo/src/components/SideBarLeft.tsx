import React, { useState } from "react";
import { TiThMenu } from "react-icons/ti";
import { Link } from "react-router-dom";
import { MdCreateNewFolder } from "react-icons/md";
import { IoIosPeople } from "react-icons/io";
import { FaUser, FaAddressCard } from "react-icons/fa";
import { useAuth } from "../context/auth/useAuth";
import { AuthenticationContext } from "../context/auth/AuthenticationContext";
import { Nav } from "react-bootstrap";

type SideBarLeftProps = {
  t: (key: string) => string;
};

const SideBarLeft: React.FC<SideBarLeftProps> = ({ t }) => {
  const { isLogined } = useAuth(AuthenticationContext);
  const [isCollapsed, setIsCollapsed] = useState(false);

  const handleToggle = () => {
    setIsCollapsed(!isCollapsed);
  };

  return (
    <div
      className={`left-side-bar bg-dark ${
        isCollapsed ? "collapsed" : "expanded"
      }`}
    >
      <button onClick={handleToggle} className="menu-toggle">
        <TiThMenu size={30} />
        {!isCollapsed && <h5>{t("menu")}</h5>}
      </button>
      <hr style={{ color: "white" }} />
      <div className="left-side-bar-menu">
        <Nav.Link
          as={Link}
          to="/create-build"
          className="menu-item"
          disabled={isLogined}
        >
          <MdCreateNewFolder size={25} />
          {!isCollapsed && <h5>{t("createBuild")}</h5>}
        </Nav.Link>
        <Nav.Link
          as={Link}
          to="/community-builds"
          className="menu-item"
          disabled={isLogined}
        >
          <IoIosPeople size={25} />
          {!isCollapsed && <h5>{t("communityBuilds")}</h5>}
        </Nav.Link>
        <Nav.Link
          as={Link}
          to="/personal-builds"
          className="menu-item"
          disabled={isLogined}
        >
          <FaUser size={25} />
          {!isCollapsed && <h5>{t("personalBuilds")}</h5>}
        </Nav.Link>
        <Nav.Link
          as={Link}
          to="/profile"
          className="menu-item"
          disabled={isLogined}
        >
          <FaAddressCard size={25} />
          {!isCollapsed && <h5>{t("profile")}</h5>}
        </Nav.Link>
      </div>
    </div>
  );
};

export default SideBarLeft;
