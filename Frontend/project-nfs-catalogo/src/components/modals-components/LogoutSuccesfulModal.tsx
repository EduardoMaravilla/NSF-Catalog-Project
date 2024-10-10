import React from "react";
import { Button, Modal } from "react-bootstrap";
import { FaRegCheckCircle } from "react-icons/fa";
interface LoginSuccesfulProps {
  show: boolean;
  onHide: () => void;
  t: (key: string) => string;
}

export const LogoutSuccesful: React.FC<LoginSuccesfulProps> = ({show, onHide, t}) => {
  return (
    <Modal
      show={show}
      onHide={onHide}
      size="lg"
      aria-labelledby="contained-modal-title-vcenter"
      centered
    >
      <Modal.Header closeButton>
        <Modal.Title id="contained-modal-title-vcenter">
          {t('successfulLogout')}
        </Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <div className="check-icon-container text-center">
          <h1>
            <FaRegCheckCircle className="check-icon" />
          </h1>
        </div>
      </Modal.Body>
      <Modal.Footer>
        <Button onClick={onHide}>{t('closeModal')}</Button>
      </Modal.Footer>
    </Modal>
  );
};
