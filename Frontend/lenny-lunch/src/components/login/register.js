import React from "react";
import lenny from "../../lennylogo.svg";

export class Register extends React.Component {

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
                    <label htmlFor="username">För -och efternamn</label>
                    <input type="text" name="username" placeholder="För -och efternamn" />
                </div>
                <div className="form-group">
                    <label htmlFor="email">E-post</label>
                    <input type="email" name="email" placeholder="E-post" />
                </div>
                <div className="form-group">
                    <label htmlFor="password">Välj lösenord</label>
                    <input type="password" name="password" placeholder="Välj lösenord" />
                </div>
            </div>
            </div>
            <div className="footer">
                <button type="button" className="btn">
                    Registrera
                </button>
            </div>
        </div>
    }
}