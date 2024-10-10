import { Card, Col, Row, Table } from "react-bootstrap";

const HomePage = () => {
  return (
    <>
      <Row>
        <Col className="text-center my-4">
          <h1>Bienvenido a NFS Catalog Unbound</h1>
          <hr />
          <p className="fs-5">
            Esta pagina ha sido creada, para que juntos como comunidad podamos
            compartir y guardar, nuestras configuraciones del juego, esperamos
            en un futuro poder añadir mas cosas.
          </p>
        </Col>
      </Row>
      <Row>
        <Col>
          <Card className="my-2">
            <Card.Header>El juego</Card.Header>
            <Card.Body>
              <p>
                Si bien empezo siendo muy criticado, también ha ido mejorando
                con el paso del tiempo, te exorto a comprar el juego, ya que se
                sale de lo común y tiene casi de todo
              </p>
            </Card.Body>
          </Card>
        </Col>
        <Col>
          <Card className="my-2">
            <Card.Header>Trucos</Card.Header>
            <Card.Body>
              <Table>
                <thead>
                  <tr>
                    <td>
                      <strong>Truco</strong>
                    </td>
                    <td>
                      <strong>Descripción</strong>
                    </td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Ganar dinero</td>
                    <td>
                      Si bien parece imposible, lo mejor que puedes hacer es
                      jugar en linea, hay un evento que te da mas dinero y
                      experiencia todos los dias
                    </td>
                  </tr>
                </tbody>
              </Table>
            </Card.Body>
          </Card>
        </Col>
        <Col>
          <Card className="my-2">
            <Card.Header>Tutorial</Card.Header>
            <Card.Body>
              <p>Hemos preparado un tutorial para que puedas usar esta pagina correctamente
                , puedas registrarte, ver configuraciones de los demás, crear tus propias configuraciones etc...
                </p>
                <p>Nos sentimos honrados de que inscribas y nos compartas tu conocimiento</p>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </>
  );
};

export default HomePage;
