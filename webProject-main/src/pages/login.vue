<script lang="ts">
// / Applica a questa pagina il middleware creato in ~/middleware/require-logout
// / Vedi:
// / - https://nuxt.com/docs/api/utils/define-page-meta
definePageMeta({
  middleware: ["require-logout"]
})

export default defineComponent({
  data() {
    return {
      loginEmail: "",
      loginPassword: "",
      registerName: "",
      registerSurname: "",
      registerEmail: "",
      registerDateBirth: "",
      registerPassword: "",
    }
  },
  methods: {
    onLoginSubmit() {
      $fetch("/api/auth/login", {
        method: "POST",
        body: {
          email: this.loginEmail,
          password: this.loginPassword,
        }
      })
        .then(() => window.location.href = "/")
        .catch((e) => alert(e))
    },
    onRegisterSubmit() {
      $fetch("/api/auth/register", {
        method: "POST",
        body: {
          name: this.registerName,
          surname: this.registerSurname,
          email: this.registerEmail,
          dateBirth: this.registerDateBirth,
          password: this.registerPassword,
        }

      })
        .then((response) => { alert(response.message) })
        .then(() => { window.location.href = "/"; })
        .catch((e) => alert(e))
    }
  }
})
</script>
<template>
  <section>
    <div class="enter animatedElement">
      <input type="checkbox" id="chk" aria-hidden="true" checked>

      <div class="signup">
        <form id="signUp" @submit.prevent="onRegisterSubmit">
          <label for="chk">Registrazione</label>
          <ul>
            <li>
              <label for="register-name">Nome:</label>
              <input required type="text" id="register-name" name="register-name" v-model="registerName" />
            </li>
            <li>
              <label for="register-surname">Cognome:</label>
              <input required type="text" id="register-surname" name="register-surname" v-model="registerSurname" />
            </li>
            <li>
              <label for="register-dateBirth">Data di Nascita:</label>
              <input required type="date" id="register-dateBirth" name="register-dateBirth" v-model="registerDateBirth">
            </li>
            <li>
              <label for="register-email">Email</label>
              <input required type="text" id="register-email" name="register-email" v-model="registerEmail">
            </li>
            <li>
              <label for="register-password">Password:</label>
              <input required type="password" id="register-password" name="register-password" v-model="registerPassword" />
            </li>
          </ul>
          <li>
            <button>Registrati</button>
          </li>
          <p>Già registrato?
            <label for="chk" class="moveMenu">
              <h3> Fai il login</h3>
            </label>
          </p>
        </form>


      </div>

      <div class="login">
        <form id="login" @submit.prevent="onLoginSubmit">
          <label for="chk">Login</label>
          <ul>
            <li>
              <label for="login-email">Email:</label>
              <input required  type="text" id="login-email" name="login-username" v-model="loginEmail" />
            </li>
            <li>
              <label for="login-password">Password:</label>
              <input required type="password" id="login-password" name="login-password" v-model="loginPassword" />
            </li>
            <li>
              <button>Accedi</button>
            </li>
          </ul>
          <p>Non ancora registrato?
            <label for="chk" class="moveMenu">
              <h3>Registrati</h3>
            </label>
          </p>
        </form>
      </div>
    </div>
  </section>
</template>

<style lang="scss" scoped>
// @keyframes backgroundAnimation {
//   0% {
//     background-color: red;
//   }

//   50% {
//     background-color: purple;
//   }

//   100% {
//     background-color: blue;
//   }
// }

.animatedElement {
  animation: backgroundAnimation 10s linear infinite;
}

section {
  display: flex;
  justify-content: center;
  margin: 2% auto;
  background-color: white;
}


.enter {
  width: 550px;
  height: 850px;
  background: white;
  overflow: hidden;
  border-radius: 10px;
  box-shadow: 5px 10px 50px rgba(0,0,0,0.8);

}

#chk {
  display: none;
}

ul {
  margin: 5% 0%;
  height: 100%;
  padding: 0 15%;
}

li {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
}

label {
  color: #000;
  font-size: 1.5em;
  justify-content: left;
  display: flex;
  margin: 1%;
  font-weight: bold;
  cursor: pointer;
  transition: .5s ease-in-out;
}


#signUp>label:nth-child(1) {
  padding-top: 3%;
  justify-content: center;
  font-size: 2em;

}

#login>label:nth-child(1) {
  padding-top: 3%;
  justify-content: center;
  font-size: 1em;

}

input {
  width: 40%;
  height: 0px;
  background: #e0dede;
  padding: 10px;
  outline: none;
  border-radius: 5px;
}

button {
  width: 60%;
  height: 40px;
  margin: 10px auto;
  justify-content: center;
  display: block;
  color: #fff;
  background: #573b8a;
  font-size: 1em;
  margin-top: 10px;
  outline: none;
  border: none;
  border-radius: 5px;
  transition: .2s ease-in;
  cursor: pointer;
}

button:hover {
  background: #6d44b8;
}

p {
  text-align: center;
  font-size: 1em;
  text-align: right;
  padding: 0 5%;
  line-height: 1.5;

}

.login {
  height: 850px;
  background: #eee;
  border-radius: 60% / 7%;
  transform: translateY(28%);
  transition: .6s ease-in-out;
}

//regolo l'altezza del login quando da registrati voglio andare su login
#chk:checked~.login {
  transform: translateY(-57%);
}


#chk:checked~.login form:nth-child(1)>label {
  transform: scale(2);
}

#chk:checked~.signup form:nth-child(1)>label {
  transform: scale(.5);

}

#chk:checked~.login {
  transition: .6 ease-in-out;

}

.moveMenu {
  justify-content: right;
  color: black;

  h3 {
    margin: 0;
  }

}

</style>