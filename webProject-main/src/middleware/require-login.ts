// È la versione frontend di requireLogin in ~/server/utils/auth.ts
// Se una pagina utilizza questo middleware e l'utente che sta cercando di visitarla
// non è autenticato, allora viene reindirizzato alla pagina di login
// Vedi:
// - https://nuxt.com/docs/guide/directory-structure/middleware

export default defineNuxtRouteMiddleware(async function() {
    const utente = await $fetch("/api/auth/profilo")
    if (!utente) {
      return navigateTo("/login")
    }
  })
  