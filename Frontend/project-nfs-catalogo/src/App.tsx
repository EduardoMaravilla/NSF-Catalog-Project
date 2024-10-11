import FooterComponent from "./components/FooterComponent";
import NavBarTop from "./components/NavBarTop";
import SideBarLeft from "./components/SideBarLeft";
import HomePage from "./pages/HomePage";
import AboutPage from "./pages/AboutPage";
import ContactPage from "./pages/ContactPage";
import { Navigate, Route, Routes } from "react-router-dom";
import CommunityBuildsPage from "./pages/CommunityBuildsPage";
import CreateBuildPage from "./pages/CreateBuildPage";
import PersonalBuildsPage from "./pages/PersonalBuildsPage";
import ProfilePage from "./pages/ProfilePage";
import NavBarMobile from "./components/NavBarMobile";
import { LoginPage } from "./pages/LoginPage";
import CreateAccountPage from "./pages/CreateAccountPage";
import ForgotPasswordPage from "./pages/ForgotPasswordPage";
import { useTranslation } from "react-i18next";

import { AuthenticationContext } from "./context/auth/AuthenticationContext";

import { useAuth } from "./context/auth/useAuth";
import ProtectedRoute from "./context/auth/ProtectedRoute";
import { VerifyEmailPage } from "./pages/VerifyEmailPage";

function App() {
  const { t, i18n } = useTranslation();
  const { isAuthenticated } = useAuth(AuthenticationContext);

  const changeLanguage = (lng: string) => {
    i18n.changeLanguage(lng);
  };
  return (
    <>
      <div className="d-flex flex-column vh-100">
        <nav>
          <NavBarTop t={t} changeLanguage={changeLanguage} />
          {isAuthenticated ? (
            <div className="mobile-only">
              <NavBarMobile t={t} />
            </div>
          ) : null}
        </nav>
        <main className="d-flex flex-grow-1">
          {isAuthenticated ? (
            <div className="web-only bg-dark p-3">
              <SideBarLeft t={t} />
            </div>
          ) : null}
          <div className="content p-3 flex-grow-1">
            <Routes>
              {/* public routes */}
              <Route
                path="/login"
                element={
                  isAuthenticated ? <Navigate to="Home" /> : <LoginPage t={t} />
                }
              />
              <Route
                path="/create-account"
                element={
                  isAuthenticated ? (
                    <Navigate to="Home" />
                  ) : (
                    <CreateAccountPage t={t} />
                  )
                }
              />
              <Route
                path="/forgot-password"
                element={
                  isAuthenticated ? (
                    <Navigate to="Home" />
                  ) : (
                    <ForgotPasswordPage t={t} />
                  )
                }
              />

              <Route
                path="/verify-email"
                element={
                  isAuthenticated ? (
                    <Navigate to="Home" />
                  ) : (
                    <VerifyEmailPage t={t} />
                  )
                }
              />

              <Route path="/Home" element={<HomePage />} />
              <Route path="/about" element={<AboutPage />} />
              <Route path="/contact" element={<ContactPage />} />

              {/* private routes */}
              <Route element={<ProtectedRoute />}>
                <Route
                  path="/create-build"
                  element={<CreateBuildPage t={t} />}
                />
                <Route
                  path="/community-builds"
                  element={<CommunityBuildsPage />}
                />
                <Route
                  path="/personal-builds"
                  element={<PersonalBuildsPage />}
                />
                <Route path="/profile" element={<ProfilePage t={t} />} />
              </Route>
              <Route
                path="*"
                element={<Navigate to={isAuthenticated ? "/home" : "/login"} />}
              />
            </Routes>
          </div>
        </main>
        <footer className="bg-dark text-center py-3 mt-auto">
          <FooterComponent />
        </footer>
      </div>
    </>
  );
}

export default App;
