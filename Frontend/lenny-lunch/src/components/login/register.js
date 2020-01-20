import React from "react";
import lenny from "../../lennylogo.svg";

export class Register extends React.Component {

    constructor(props) { 
        super(props); 
        var today = new Date(); 
        var dd = String(today.getDate()).padStart(2, '0'); 
        var mm = String(today.getMonth() + 1).padStart(2, '0'); 
        var yyyy = today.getFullYear(); 
     
        today = mm + '/' + dd + '/' + yyyy; 
        this.state = { email: "" , password: "", firstName: "", lastName: "", phoneNumber: "", joinDate: today, /*restaurantId: 1,*/ address:"", username:"" }; 
      } 

      handleClick = () => { 
        fetch("http://localhost:56773/api/users", { 
          method: "POST", 
          headers: { 
            Accept: "application/json", 
            "Content-Type": "application/json; charset=UTF-8" 
          }, 
          body: JSON.stringify({ 
            email: this.state.email, 
            password: this.state.password, 
            fName: this.state.firstName, 
            lName: this.state.lastName, 
            phone: this.state.phoneNumber, 
            joinDate: this.state.joinDate, 
            /*restaurantId: this.state.restaurantId,*/
            address: this.state.address,
            userName: this.state.username
          }) 
        }).then(Response => { 
            console.log('registatrion res', Response) 
        }).catch(error => { 
            console.log('regostration error', error) 
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
                    <label htmlFor="username">Förnamn</label>
                    <input type="text" name="username" placeholder="Förnamn" value={this.state.firstName} onChange={e => this.setState({firstName: e.target.value})} />
                </div>
                <div className="form-group">
                    <label htmlFor="username">Efternamn</label>
                    <input type="text" name="username" placeholder="Efternamn" value={this.state.lastName} onChange={e => this.setState({lastName: e.target.value})} />
                </div>
                <div className="form-group">
                    <label htmlFor="email">E-post</label>
                    <input type="email" name="email" placeholder="E-post" value={this.state.email} onChange={e => this.setState({email: e.target.value})} />
                </div>
                <div className="form-group">
                    <label htmlFor="password">Välj lösenord</label>
                    <input type="password" name="password" placeholder="Välj lösenord" value={this.state.password} onChange={e => this.setState({password: e.target.value})} />
                </div>
            </div>
            </div>
            <div className="footer">
                <button type="button" className="btn" value="Registrera" onClick={()=> this.handleClick()} >
                    Registrera
                </button>
            </div>
        </div>
    }
}