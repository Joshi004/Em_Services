import React, { Component } from 'react'
import { withRouter } from 'react-router'
import './login-component.css'
import axios from 'axios'
import '../emConstants'

class LoginComponent extends Component {
    constructor(prop) {
        super(prop)
        this.state = {
            user_id: '',
            password: '',
        }
        console.log('In Login Component props recived are',this.props)
        console.log('Constructor initiated forf Login comp')
    }

   

    handleInputChange = (event) => {
        console.log('Value changed', event.target.value)
        const val = event.target.value
        const key = event.target.name
        this.setState({ [key]: val })
    }

    reqLogin = () => {
        const data = {
            user_id:this.state.user_id,
            password: this.state.password,
            }

        const config = {
            method: 'post',
            url: urls.login,
            data: JSON.stringify(data),
            headers: { 'Content-type': 'application/json' }
        }
        console.log("Making call with",config)
        axios(config)
            .then((response) => {
                console.log('Login response is ', response)
                sessionStorage.token=response.data.jwt
                this.props.history.push('/expenses')
            })
            .catch((err) => {
                console.log("Following error response from server : ", err)
            })
    }


componentDidMount(){
 
}



    render() {
        console.log('Render initiated for Login comp',this.props)
        return (<div className='container'>
            <div className='formHeader'> Provide Login details</div>
            <form className='form form-vertical'>
                <div className='form-group'>
                    <label>USer ID</label>
                    <input className="form-control" type='text' name='user_id' onChange={this.handleInputChange} value={this.state.user_id}></input>
                </div>
             
                <div className='form-group'>
                    <label>Password</label>
                    <input className="form-control" type='password' name='password' onChange={this.handleInputChange} value={this.state.password}></input>
                </div>
                
            </form>
            <button onClick={this.reqLogin} className='btn btn-primary'>Login</button>
        </div>)
    }
}

export default withRouter (LoginComponent)