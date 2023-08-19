
<script lang="ts">
import { Utente } from "~/types"

export default defineComponent({

    data() {
        return {
            utente: null as Utente | null
        }
    },
    methods: {
        async getUtente() {
            const utente = await $fetch("/api/auth/profilo")
            this.utente = utente
        },
        async logout() {
            await $fetch("/api/auth/logout")
            this.getUtente()
        }
    },
    mounted() {
        this.getUtente()
    }
})
</script> 

<template>
    <div id="index">
        <div id="row-1">

            <img class="logo-img" alt="logo-astra" src="/img/logo_transparent.png">
            <div class="grid-container-head">

                <h1 class="head-element" v-if="!utente">Benvenuto nel sito dell'hotel Astra</h1>
                <h1 class="head-element" v-if="utente?.ruolo == 'gestore'">Bentornato gestore {{ utente?.nome + " " +
                utente?.cognome }}</h1>
                <h1 class="head-element" v-if="utente?.ruolo == 'cliente'">Bentornato {{
                    utente.ruolo + " " + utente?.nome + " " + utente?.cognome
                }}</h1>
                <p class="head-element" v-if="(!utente)">
                    Prenota con noi e passa il miglior tempo della tua estate qui a Gallipoli, la città del divertimento
                </p>
                <p class="head-element" v-if="utente?.ruolo == 'cliente'">Per vedere le nostre stanze
                    disponibili e passare il miglior tempo delle
                    tue vacanze premi qui:<a class="link" href="\reservation"> <br> Prenotazioni</a> <br>
                    Se invece hai già eseguito una prenotazione e vuoi controllare i tuoi dati personali premi qui:
                    <br><a class="link" href="\account "> Profilo</a>
                </p>
                <p v-else-if="utente?.ruolo == 'gestore'" class="head-element">Per gestire le stanze premi qui:<a class="link"
                        href="\reservation"><br>Stanze</a><br>
                    Per gestire le prenotazioni premi qui:<br><a class="link" href="\account ">Profilo</a>
                </p>
            </div>

        </div>
        <div id="row-2">
            <div class="history-container">
                <p>
                    La nostra storia:
                </p>
                <p>
                    Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                    Aperiam placeat illum enim, corrupti fuga provident nostrum aliquid vero molestiae aut omnis ab!
                    Illo minus temporibus rem consequuntur aspernatur voluptates? Iste commodi officiis magni porro
                    cumque ullam repellat repellendus nobis, in, saepe qui! Blanditiis placeat accusantium deserunt nam
                    pariatur consectetur eius earum excepturi, sint modi dicta impedit expedita vitae culpa eaque illo?
                    Vero aspernatur, asperiores cumque possimus soluta culpa beatae reprehenderit repellat, officiis
                    non, eos illo delectus mollitia. Eligendi reiciendis voluptatem impedit ratione iste dicta soluta
                    est nobis, saepe inventore, nesciunt voluptas. Ipsum nulla corrupti perferendis labore modi, cumque
                    debitis? Maxime.
                </p>
            </div>
            <div class="map-container">
                <p>Dove ci troviamo?</p>
                <iframe width="100%" height="100%" scrolling="no" marginheight="0" marginwidth="0"
                    title="Mappa del Hotel"
                    src="https://maps.google.com/maps?width=100%25&amp;height=100%&amp;hl=en&amp;q=gallipolli,%20via%20xx%20settembre%20numero%2015+(My%20Business%20Name)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed">
                </iframe>
            </div>
        </div>
    </div>

</template>

<style lang="scss" scoped>
#index {

    h1 {
        font-size: 1.5em;
    }


    #row-1 {
        display: flex;

        .grid-container-head {
            display: flex;
            flex-direction: column;

            .head-element {
                text-align: center;
                margin: 0;
            }
        }


    }

    #row-2 {
        display: flex;

        .history-container {
            display: flex;
            flex-direction: column;

            p:nth-child(1) {
                margin: 2%;
            }

            p:nth-child(2) {
                margin: 0% 0% 2% 5%;
            }
        }

        .map-container {
            display: flex;
            flex-direction: column;

            p:nth-child(1) {
                margin: 2%;
            }
        }

    }

    p {
        color: hsl(0, 50%, 25%);
        background-color: white;
    }

    .nuxt-link {
        text-decoration: none;
        color: hsl(232, 50%, 25%);
        background-color: white;
    }

    .nuxt-link:hover,
    .nuxt-link:focus {
        text-decoration: underline;
    }


    p {
        line-height: 1.5;
        color: hsl(0, 50%, 25%);
        background-color: white;

    }

    .link {
        text-decoration: none;
        color: hsl(232, 50%, 25%);
        background-color: white;
        display: contents;
    }

    .link:hover,
    .link:focus {
        text-decoration: underline;
    }

}
</style> 