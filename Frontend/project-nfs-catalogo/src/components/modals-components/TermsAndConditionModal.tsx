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
        <hr />
        <ol>
          <li>
            <strong>{t("termsAndContitionsSection1Title")}</strong>
            <p style={{textAlign: "justify"}}>{t("termsAndContitionsSection1Content")}</p>
          </li>
          <li>
            <strong>{t("termsAndContitionsSection2Title")}</strong>
            <p style={{textAlign: "justify"}}>{t("termsAndContitionsSection2Content")}</p>
          </li>
          <li>
            <strong>{t("termsAndContitionsSection3Title")}</strong>
            <p style={{textAlign: "justify"}}>{t("termsAndContitionsSection3Content")}</p>
          </li>
          <li>
            <strong>{t("termsAndContitionsSection4Title")}</strong>
            <p style={{textAlign: "justify"}}>{t("termsAndContitionsSection4Content")}</p>
          </li>
          <li>
            <strong>{t("termsAndContitionsSection5Title")}</strong>
            <p style={{textAlign: "justify"}}>{t("termsAndContitionsSection5Content")}</p>
          </li>
          <li>
            <strong>{t("termsAndContitionsSection6Title")}</strong>
            <p style={{textAlign: "justify"}}>{t("termsAndContitionsSection6Content")}</p>
          </li>
          <li>
            <strong>{t("termsAndContitionsSection7Title")}</strong>
            <p style={{textAlign: "justify"}}>{t("termsAndContitionsSection7Content")}</p>
          </li>
          <li>
            <strong>{t("termsAndContitionsSection8Title")}</strong>
            <p style={{textAlign: "justify"}}>{t("termsAndContitionsSection8Content")}</p>
          </li>
          <li>
            <strong>{t("termsAndContitionsSection9Title")}</strong>
            <p style={{textAlign: "justify"}}>{t("termsAndContitionsSection9Content")}</p>
          </li>
        </ol>
      </Modal.Body>
      <Modal.Footer>
        <Button onClick={onHide}>{t("closeModal")}</Button>
      </Modal.Footer>
    </Modal>
  );
};
