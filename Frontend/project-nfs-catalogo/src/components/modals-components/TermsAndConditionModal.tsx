import { FC } from "react";
import { Button, Modal } from "react-bootstrap";

type TermsAndConditionModalProps = {
  show: boolean;
  onHide: () => void;
  t: (key: string) => string;
};

export const TermsAndConditionModal: FC<TermsAndConditionModalProps> = ({
  t,
  show,
  onHide,
}) => {
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
          {t("termsAndContitionsTitle")}
        </Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <ul>
          <li>
            <p>{t("termsAndContitionsIntro")}</p>
          </li>
          <li>
            <p>{t("termsAndContitionsAcceptance")}</p>
          </li>
          <li>
            <p>{t("termsAndContitionsChanges")}</p>
          </li>
        </ul>
      </Modal.Body>
      <Modal.Footer>
        <Button onClick={onHide}>{t("closeModal")}</Button>
      </Modal.Footer>
    </Modal>
  );
};
