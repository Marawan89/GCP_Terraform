<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/brayanVaccaro/webProject">
    <img src="src/public/img/logo.png" alt="Logo" width="200">
  </a>

<h3 align="center">Astra</h3>

  <p align="center">
    Sul sito dell'hotel Astra, che si trova a Gallipoli, si possono prenotare stanze, scrivere recensioni e visualizzare quelle degli altri utenti, controllare il proprio profilo (visualizzare tutte le recensioni scritte e tutte le prenotazioni effettuate)
    <br />
    <a href="https://github.com/brayanVaccaro/webProject"><strong>Documento: »</strong></a>
    <br />
    <br />
    ·
    ·
  </p>
</div>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Indice:</summary>
  <ol>
    <li>
      <a href="#about-the-project">Il progetto:</a>
    </li>
    <li>
      <a href="#getting-started">Per Iniziare:</a>
      <ul>
        <li><a href="#installation">Installazione:</a></li>
      </ul>
    </li>
    <li><a href="#usage">Utilizzo</a></li>
    <li><a href="#roadmap">Passaggi da seguire</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- IL PROGETTO -->
## Il progetto:
<br />
<div align="center">
  <a href="https://github.com/brayanVaccaro/webProject">
    <img src="src/public/img/logo_transparent.png" alt="Logo" width="200">
  </a>
  <p align="center">
</div>
L'obbiettivo del progetto è quello di implementare una applicazione web in grado di scambiare dati con un DataBase dando la possibilità di inserire e visualizzare prenotazioni di stanze e inserire e visualizzare recensioni scritte dai clienti


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- PER INIZIARE -->
### Installazione

1. Clone the repo
   ```
   git clone https://github.com/brayanVaccaro/webProject.git
   ```
2. Fill .envtemplate with your custom variables. Rename it in .env
3. build it:
   ```
   npm i
   npm run dev
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ESEMPI DI UTILIZZO -->
### Utenti Cliente
Per utilizzare il servizio è necessario eseguire il login con le proprie credenziali o, se non le si hanno, eseguire la registrazione.
Senza effettuare l'autenticazione è possibile visualizzare esclusivamente, e senza possibilità di modifica (inserire una recensione), la pagina Home, la pagina Recensioni e la pagina di Login.
Ad autenticazione effettuata il nav cambia il proprio contenuto
<div align="center">
  <a href="https://github.com/brayanVaccaro/webProject">
    <img src="src/public/img/site.png" alt="Menu" height="500">
  </a>
</div>
Inserendo i dati nella pagina Prenotazioni vengono visualizzate le stanze disponibili
<div align="center">
  <a href="https://github.com/brayanVaccaro/webProject">
    <img src="src/public/img/site-1.png" alt="Menu" height="500">
  </a>
</div>
Premendo su prenota viene visualizzato il riepilogo della stanza scelta e premendo Conferma Prenotazione viene eseguita la prenotazione  

Andando nella pagina Recensioni è possibile eseguire una recensione ora che si è loggati (scegliendo la quantità di stelle che si vuole dare alla pulizia, ristorazione e accoglienza).
<div align="center">
  <a href="https://github.com/brayanVaccaro/webProject">
    <img src="src/public/img/site-2.png" alt="Menu" height="500">
  </a>
</div>
 E infine andando nella pagina Profilo è posssibile visualizzare i dati inseriti durante la registrazione, lo storico delle proprie recensioni e prenotazioni effettuate dal cliente.
 <div align="center">
  <a href="https://github.com/brayanVaccaro/webProject">
    <img src="src/public/img/site-3.png" alt="Menu" height="500">
  </a>
</div>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Utenti Gestore
Rispetto alla versione cliente la pagina Home non cambia molto, passando invece alla pagina Stanze si ha l'elenco delle stanze disponibili nel DataBase, ed è possibile, premendo il taso X, eliminarle. Sulla sinistra è possibile aggiungere una nuova stanza.
 <div align="center">
  <a href="https://github.com/brayanVaccaro/webProject">
    <img src="src/public/img/site-4.png" alt="Menu" height="500">
  </a>
</div>
Nella pagina Recensioni invece è possibile oltre a visualizzare le recensioni, rispondere.
 <div align="center">
  <a href="https://github.com/brayanVaccaro/webProject">
    <img src="src/public/img/site-5.png" alt="Menu" height="500">
  </a>
</div>
Infine nella pagina Gestisci è possibile oltre a visualizzare i dati del gestore visualizzare tutte le prenotazioni eseguite dai clienti
 <div align="center">
  <a href="https://github.com/brayanVaccaro/webProject">
    <img src="src/public/img/site-6.png" alt="Menu" height="500">
  </a>
</div>

<!-- ROADMAP -->
## Roadmap
Caratteristiche obbligatorie:
- [x] Progettare il Mockup
- [x] Costruire il progetto Logico del DataBase
- [x] Costruire il DataBase e le istruzioni SQL
- [x] Implementare l'autenticazioni(Registrazione e Login) 
- [x] Implementare le prenotazioni delle stanze
- [x] Implementare le recensioni
- [x] Implementare la pagina profilo con lo storico
- [x] Implementare la parte del gestore  
- [x] Scrivere il CSS
- [x] Scrivere la relazione 


Caratteristiche opzionali:
- [ ] login / logout tipo icona
- [ ] Calendario con colori che indicano la disponibilità o meno delle stanze 
- [ ] Calcolare il periodo di prenotazione totale 
- [ ] Calcolare il prezzo totale in base ai giorni
- [x] Risposta del gestore al cliente
- [x] Recensioni con le stelle al posto del testo

Per mancanza di tempo, alcune caratteristiche opzionali non sono state implementate. Vedremo di implementarle successivamente
<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->
## Licenza

Vedere `LICENSE` per ulteriori informazioni.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## Contatti

Marawan Emad - marawan.emadragab@studio.unibo.it <br />

Brayan Vaccaro - brayan.vaccaro@studio.unibo.it <br />


Project Link: [https://github.com/brayanVaccaro/webProject](https://github.com/brayanVaccaro/webProject)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

