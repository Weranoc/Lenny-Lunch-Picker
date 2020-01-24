import React from "react";
import lenny from "../../lennylogo.svg";

export class Login extends React.Component {

    constructor(props) {
        super(props);

        this.state = { email: "" , password: ""};
    }

    handleClick() {
        fetch("http://localhost:56773/login", { 
      method: "POST", 
      headers: { 
        Accept: "application/json", 
        "Content-Type": "application/json; charset=UTF-8" 
      }, 
      body: JSON.stringify({ 
        email: this.state.email, 
        password: this.state.password 
      }) 
    })
      .then(Response => Response.json()) 
      .then(data => { 
        if(data == null){ 
          alert('Fel E-post eller lösenord!')
        }else{ 
          this.props.loggedIn(data); 
          this.props.chosenPage("searchProfile");
        } 
      }) 
    };

    render() {
        return <div className="base-container" ref={this.props.containerRef}>
            <div className="header"></div>
            <div className="content">
                <div className="image">
                    <img src={lenny} alt="lennyLogo" />
                </div>
            <div className="form">
                <div className="form-group">
                    <label htmlFor="username">E-post</label>
                    <input type="text" name="username" placeholder="E-post" value={this.state.email} onChange={e => this.setState({email: e.target.value})} />
                </div>
                <div className="form-group">
                    <label htmlFor="password">Lösenord</label>
                    <input type="password" name="password" placeholder="Lösenord" value={this.state.password} onChange={e => this.setState({password: e.target.value})} />
                </div>
            </div>
            </div>
            <div className="footer">
                <button type="button" className="btn" value="Logga in" onClick={()=> this.handleClick(this.state.email, this.state.password)}>
                    Logga in
                </button>
            </div>
        </div>
    }
}