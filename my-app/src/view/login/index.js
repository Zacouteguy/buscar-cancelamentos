import React from 'react';
import './login.css';

function Login(){
    return(

<div className ="login-content d-flex align-items-center">

    <form className="form-signin mx-auto">
        <div class="text-center mb-4">
            <img className="mb-4" src="/docs/4.4/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"/>
            <h1 className="h3 mb-3 font-weight-normal text-white font-weight-bold">Login</h1>
        </div>

     
            <input type="email" id="inputEmail" class="form-control my-2" placeholder="Email"/>
            <input type="password" id="inputPassword" class="form-control my-2" placeholder="Senha"/>
        

            <button class="btn btn-lg btn-login btn-block" type="submit">Sign in</button>

            <div className="msg-login text-white text-center my-2">
                <span><strong>WOW!</strong> Você está conectado!</span>
                <span><strong>OPS!</strong> VOCÊ ESTA CONECTADO!</span>


            </div>


            <div className="opcoes-login text-center mt-4">
            <a href="#"className="mx-2">Recuperar senha</a>
            <span className="text-white">&#9733;</span>
            <a href="#"className="mx-2">Quero cadastrar</a>
           

        </div>

    </form>
</div>
    )

}

export default Login;
