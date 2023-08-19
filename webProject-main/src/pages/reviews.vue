<script lang="ts">

import { Recensione, Utente, Review } from '../types'

export default defineComponent({
    setup() {
        return {
            user: inject("user") as Utente | null
        }
    },
    data() {
        return {
            review: [] as Review[],
            utente: [] as Utente[],
            recensione: [] as Recensione[],
            dataRecensione: '' as string,
            votoPulizia: '',
            votoRistorazione: '',
            votoAccoglienza: '',
            rispostaRecensione: '' as string,
            scelte: [
                { value: '5stellina' },
                { value: '4stellina' },
                { value: '3stellina' },
                { value: '2stellina' },
                { value: '1stellina' },
            ],
        }
    },
    methods: {
        getReviews() {
            $fetch("/api/reviews/getReviews").then((data) => { this.review = data as Review[] })
        },

        insertReviews() {
            $fetch("/api/reviews/insertReviews", {
                method: "POST",
                body: {
                    votoPulizia: this.votoPulizia + '.png',
                    votoRistorazione: this.votoRistorazione + '.png',
                    votoAccoglienza: this.votoAccoglienza + '.png',
                    idUser: this.user?.idUtente
                }

            })
                .then(() => { window.location.href = "/reviews"; })
                .catch((e) => alert(e))
        },
        formatDate(time: string) {

            const data = new Date(time)
            const year = data.toLocaleString("default", { year: "numeric" });
            const month = data.toLocaleString("default", { month: "2-digit" });
            const day = data.toLocaleString("default", { day: "2-digit" });

            return `${day}/${month}/${year}`;
        },
        reviewsAnswer(idRecensione: number, rispostaRecensione: string) {
            $fetch("/api/reviews/reviewsAnswer", {
                method: "POST",
                body: {
                    rispostaRecensione: rispostaRecensione,
                    idRecensione: idRecensione,
                }
            })
                .then((response) => (alert(response.message)))
                .then(() => window.location.href = "/reviews")
                .catch((e) => (alert(e)))

        }
    },
    beforeMount() {
        this.getReviews();

    },
    mounted() {
    }
})

</script>

<template>

    <div class="grid-1">

        <div v-for="x in review" class="review-preview">
            <div>
                <div class="review-valutation">
                    <div class="element">
                        <p class="">Pulizia:</p>
                        <img class="stars" alt="vote" :src="'img/stars/' + x.votoPulizia">
                    </div>
                    <div class="element">
                        <p class="">Ristorazione:</p>
                        <img class="stars" alt="vote" :src="'img/stars/' + x.votoRistorazione">
                    </div>
                    <div class="element">
                        <p class="">Accoglienza:</p>
                        <img class="stars" alt="vote" :src="'img/stars/' + x.votoAccoglienza">
                    </div>
                </div>
                <div class="send-answer" v-if="user?.ruolo == 'gestore' && x.rispostaRecensione == ''">
                    <input v-model="rispostaRecensione" type="text">
                    <button @click="reviewsAnswer(x.idRecensione, rispostaRecensione)">
                        Rispondi
                    </button>
                </div>
                <div class="get-answer" v-else-if="x.rispostaRecensione != ''">
                    <h3>Riposta del gestore </h3>
                    <p>
                        {{ x.rispostaRecensione }}
                    </p>
                </div>

            </div>
            <div class="review-profile">
                <img class="profile-img" alt="profile" :src="'img/' + x.imgProfilo">

                <p class="video-title">
                    {{ x.nome + " " + x.cognome }}
                </p>
                <p class="video-stats">
                    {{ formatDate(x.dataRecensione) }}
                </p>
            </div>
        </div>
    </div>

    <div class="grid-2" v-if="user?.ruolo == 'cliente'">
        <h3>Aiutaci con un feedback!</h3>
        <div class="review-insert">
            <div class="review-profile">
                <img class="profile-img" alt="profile" :src="'img/' + user.imgProfilo">
                <p class="profile-name">{{ user?.nome + ' ' + user?.cognome }}</p>
            </div>
            <div class="review-insertion">
                <p>Come valuti la nostra pulizia?</p>
                <select v-model="votoPulizia">
                    <option v-for="option in scelte" :key="option.value" :value="option.value">
                        {{ option.value }}
                    </option>
                </select>
                <p>Come valuti la nostra Ristorazione?</p>
                <select v-model="votoRistorazione">
                    <option v-for="option in scelte" :key="option.value" :value="option.value">
                        {{ option.value }}
                    </option>
                </select>
                <p>Come valuti la nostra Accoglienza?</p>
                <select v-model="votoAccoglienza">
                    <option v-for="option in scelte" :key="option.value" :value="option.value">
                        {{ option.value }}
                    </option>
                </select>
                <button @click.prevent="insertReviews()">
                    Invia
                </button>
            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped>
.grid-1 {
    display: grid;


    .review-preview {
        display: grid;
        grid-template-rows: auto auto;
        grid-template-columns: 50% auto;
        margin: 1%;
        flex-direction: row;
        justify-content: space-evenly;
        border-collapse: separate;

        .get-answer {
            display: flex;
            flex-direction: column;

            h3 {
                margin: 0;
                background-color: aquamarine;
                font-size: smaller;
            }

            p {
                font-size: smaller;
            }
        }

        .review-valutation {

            .element {
                display: flex;
                flex-direction: row;
                align-items: center;

                p {
                    font-size: 0.9em;
                }

            }


        }
    }

    .review-profile {
        display: flex;
        flex-direction: column;
        align-items: center;

        .video-title {
            margin-top: 0;
            font-size: 150%;
            font-weight: 500;
            line-height: 1.5;
        }

        font-size: 12px;
        color: rgb(96, 96, 96);


    }
}

.grid-2 {
    

    .review-insert {
        display: flex;
        justify-content: center;



        .review-insertion {
            display: flex;
            flex-direction: column;
            padding-left: 2%;

            select {
                width: 30%;
            }

            button {
                align-self: flex-start;
            }
        }
    }

    .review-profile {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
}











p {
    margin: 0;
    padding: 0;
    line-height: 1.5;
}







.profile-img {
    border-radius: 50px;
    width: 70px;
    height: 70px;
    object-fit: cover;
}
</style>