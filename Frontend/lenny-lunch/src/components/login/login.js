import React from "react";
import lenny from "../../lennylogo.svg";

export class Login extends React.Component {

    constructor(props) {
        super(props);
    }

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
                    <input type="text" name="username" placeholder="E-post" />
                </div>
                <div className="form-group">
                    <label htmlFor="password">Lösenord</label>
                    <input type="password" name="password" placeholder="Lösenord" />
                </div>
            </div>
            </div>
            <div className="footer">
                <button type="button" className="btn">
                    Logga in
                </button>
            </div>
        </div>
    }
}