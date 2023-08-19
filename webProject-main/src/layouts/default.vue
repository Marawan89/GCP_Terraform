<script lang="ts">
import { Utente } from "~/types"
useHead({
  htmlAttrs: {
    lang: 'it'
  },
  title: 'Astra' 
})
export default defineComponent({
  // Fornisce l'oggetto utente a tutti i componenti dell'applicativo
  provide() {
    return {
      user: computed(() => this.utente)
    }
  },
  data() {
    return {
      utente: null as Utente | null
    }
  },
  methods: {
    async getUtente() {
      const user = await $fetch("/api/auth/profilo")
      this.utente = user
    },
    async logout() {
      await $fetch("/api/auth/logout").then((response) => alert(response.message)).then(() => window.location.href = "/")
      this.getUtente()
    }
  },
  mounted() {
    this.getUtente()
  }
})
</script>

<template>

 
  <nav id="nav">
    <ul>
      <li class="nav-buttons">
        <NuxtLink class="nuxt-link" to="/">Home</NuxtLink>
      </li>

      <li class="nav-buttons" v-if="utente?.ruolo == 'gestore'">
        <NuxtLink class="nuxt-link" to="/reservation">Stanze</NuxtLink>
      </li>

      <li class="nav-buttons" v-else v-if="utente">
        <NuxtLink class="nuxt-link" to="/reservation">Prenotazione</NuxtLink>
      </li>
      

      <li class="nav-buttons">
        <NuxtLink class="nuxt-link" to="/reviews">Recensioni</NuxtLink>
      </li>

      <li class="nav-buttons" v-if="utente?.ruolo == 'gestore'">
        <NuxtLink class="nuxt-link" to="/account">Gestisci</NuxtLink>
      </li>

      <li class="nav-buttons" v-else v-if="utente">
        <NuxtLink class="nuxt-link" to="/account">Profilo</NuxtLink>
      </li>
    </ul>
    <ul>
      <li class="nav-buttons" v-if="!utente">
        <NuxtLink class="nuxt-link" to="/login">Login</NuxtLink>
      </li>

      <li class="nav-buttons" v-else>
        <NuxtLink class="nuxt-link" to="/" @click.prevent="logout">Logout</NuxtLink>
      </li>
    </ul>
  </nav>


  <main id="centerPage">
    <slot></slot>
  </main>
  <footer class="footer">Contatti: astraHotel@gmail.com +393888958648</footer>
</template>


<style lang="scss">
@import '../assets/styles/global.scss';
nav {
  display: grid;
  border: 1px solid darkblue;
  margin-bottom: 2%;
  padding: 1%;

  ul {
    display: flex;
    justify-content: space-evenly;
    margin: 0;

    li {
      display: flex;
      flex-direction: row;
      list-style: none;
      padding: 1%;
      background-color: whitesmoke;
      box-shadow: 50px;
      background-color: #eee;;

    }
  }
}

footer {
  margin-top: 2%;
}

</style>