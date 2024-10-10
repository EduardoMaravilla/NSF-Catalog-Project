import { Container, Row, Col, Form, Button } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';

const ForgotPasswordPage = () => {
  return (
    <Container 
      className="d-flex justify-content-center align-items-center" 
      style={{ height: '70vh' }}
    >
      <Row className="w-100">
        <Col md={6} lg={4} className="mx-auto">
          <h2 className="text-center mb-4">Olvidé mi Contraseña</h2>
          <Form>
            <Form.Group controlId="formBasicEmail">
              <Form.Label>Correo Electrónico</Form.Label>
              <Form.Control type="email" placeholder="Ingrese su correo electrónico" required />
              <Form.Text className="text-muted">
                Recibirá un enlace para restablecer su contraseña en su correo electrónico.
              </Form.Text>
            </Form.Group>
            
            <Button variant="primary" type="submit" className="w-100 mt-3">
              Enviar Enlace de Restablecimiento
            </Button>
          </Form>
        </Col>
      </Row>
    </Container>
  );
};

export default ForgotPasswordPage;
