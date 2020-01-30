import React from "react";
import 'bootstrap/dist/css/bootstrap.css';
import { Form, InputGroup, Button, Navbar } from 'react-bootstrap';
import lenny from "../../lennylogo.svg";
import Map from "./GoogleMap/map"
import MapAutoComplete from "./GoogleMap/map_auto_complete"

export class LogoutNav extends React.Component {
  constructor(props) { 
    super(props); 
    this.state = { };
    }
    handleLogOut(){
        this.props.loggedIn({})
        this.props.chosenPage("login")
    }
  
    render() {
      return <div> <Navbar style={{backgroundColor: "#E6F2EB", height: "6rem"}}>
      <Form inline>
        <img src={lenny} alt="lennylogo" style={{borderRadius: "100%", height: "80px", paddingLeft: "3rem"}}></img>
        <h3 style={{paddingLeft: "2rem"}}>Dags för lunch? Sök efter ditt närmaste ställe nedan!</h3>
        <InputGroup>
        </InputGroup>
      </Form>
      <Form inline style={{paddingLeft: "22rem"}}>
        <Button className="outBtn" style={{backgroundColor: "#0e9637", border: "#0e9637"}} type="submit">Logga ut</Button>
      </Form>
    </Navbar>
    <Map/>
    <MapAutoComplete/>
    </div>
  }
}
