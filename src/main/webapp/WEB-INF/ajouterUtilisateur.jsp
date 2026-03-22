<%@include file="inc/header.jsp" %>

<style>
body {
    font-family: 'Inter', 'Segoe UI', Arial, sans-serif;
    background-color: #f4f7f9;
    margin: 0;
    padding: 0;
    color: #333;
}

header {
    background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
    color: white;
    padding: 30px 20px;
    text-align: center;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

header h1 {
    margin: 0;
    font-size: 2.5em;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
}

nav {
    background-color: #3498db;
    padding: 12px 0;
}

nav ul {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
}

nav ul li a {
    color: white;
    text-decoration: none;
    font-size: 1.1em;
    font-weight: 500;
    padding: 8px 20px;
    transition: all 0.3s;
}

nav ul li a:hover {
    background-color: rgba(255,255,255,0.2);
    border-radius: 5px;
}

h2 {
    text-align: center;
    font-size: 2em;
    color: #2c3e50;
    margin: 40px 0 20px;
}

.container {
    width: 95%;
    max-width: 1000px;
    margin: 0 auto 50px;
    padding: 30px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

/* Tableaux */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th {
    background-color: #f8f9fa;
    color: #2c3e50;
    font-weight: 600;
    border-bottom: 2px solid #dee2e6;
    padding: 15px;
    text-align: left;
}

td {
    padding: 12px 15px;
    border-bottom: 1px solid #eee;
    color: #666;
}

tr:hover td {
    background-color: #f1f9ff;
}

/* Boutons */
.button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #3498db;
    color: white;
    text-decoration: none;
    border-radius: 4px;
    font-weight: 600;
    transition: background 0.3s;
    border: none;
}

.button:hover {
    background-color: #2980b9;
}

.button.delete {
    background-color: #e74c3c;
}

.button.delete:hover {
    background-color: #c0392b;
}

/* Formulaires */
form {
    max-width: 500px;
    margin: 0 auto;
    background: #fff;
}

form label {
    display: block;
    margin-bottom: 8px;
    font-weight: 600;
    color: #2c3e50;
}

form input[type="text"], 
form input[type="password"] {
    width: 100%;
    padding: 12px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box; /* Important pour la largeur */
}

form input[type="submit"] {
    width: 100%;
    background-color: #2ecc71;
    color: white;
    padding: 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1.1em;
    font-weight: bold;
}

form input[type="submit"]:hover {
    background-color: #27ae60;
}

/* Alertes */
.error { color: #721c24; background-color: #f8d7da; padding: 10px; border-radius: 4px; margin: 5px 0; display: block; font-size: 0.9em;}
.success { background-color: #d4edda; color: #155724; padding: 15px; border-radius: 4px; text-align: center; margin-bottom: 20px;}
</style>

<main class="container">
    <h2>Ajout d'un utilisateur</h2>

    <%-- Affichage des messages de session --%>
    <c:if test="${!empty sessionScope.statusMessage}">
        <div class="${sessionScope.status ? 'success' : 'error'}">${sessionScope.statusMessage}</div>
        <c:remove var="statusMessage" scope="session" />
        <c:remove var="status" scope="session" />
    </c:if>

    <%-- Affichage des messages de validation immédiate des champs --%>
    <c:if test="${!empty requestScope.statusMessage}">
        <div class="${requestScope.status ? 'success' : 'error'}">${requestScope.statusMessage}</div>
    </c:if>

    <form method="post" id="userForm">
        <label for="nom">Nom</label>
        <input type="text" name="nom" id="nom" value="${ utilisateur.nom }">
        <c:if test="${ !empty erreurs.nom }">
            <span class="error" id="error-nom">${ erreurs.nom }</span>
        </c:if>

        <label for="prenom">Prenom</label>
        <input type="text" name="prenom" id="prenom" value="${ utilisateur.prenom }">
        <c:if test="${ !empty erreurs.prenom }">
            <span class="error" id="error-prenom">${ erreurs.prenom }</span>
        </c:if>

        <label for="login">Login</label>
        <input type="text" name="login" id="login" value="${ utilisateur.login }">
        <c:if test="${ !empty erreurs.login }">
            <span class="error" id="error-login">${ erreurs.login }</span>
        </c:if>

        <label for="password">Mot de passe</label>
        <input type="password" name="password" id="password" value="${ utilisateur.password }">
        <c:if test="${ !empty erreurs.password }">
            <span class="error" id="error-password">${ erreurs.password }</span>
        </c:if>

        <label for="confirmation">Confirmer mot de passe</label>
        <input type="password" name="confirmation" id="confirmation">
        <c:if test="${ !empty erreurs.confirmation }">
            <span class="error" id="error-confirmation">${ erreurs.confirmation }</span>
        </c:if>

        <input type="submit" value="Ajouter">
    </form>

<script>
    // Fonction pour masquer les messages d'erreur dès que l'utilisateur commence à saisir
    function hideErrorOnInput(inputId, errorId) {
        const inputField = document.getElementById(inputId);
        const errorField = document.getElementById(errorId);

        if (inputField && errorField) {
            inputField.addEventListener('input', function () {
                if (errorField) {
                    errorField.remove(); // Supprime complètement l'élément de la page
                }
            });
        }
    }

    // Validation pour interdire les caractères spéciaux dans les champs "Nom" et "Prénom"
    function validateSpecialChars(inputId, errorId) {
        const inputField = document.getElementById(inputId);
        const specialCharsPattern = /[^a-zA-ZÀ-ÿ\s]/; // Permet seulement lettres et espaces

        inputField.addEventListener('input', function() {
            // Supprimer l'élément d'erreur si présent
            let errorField = document.getElementById(errorId);
            if (errorField) {
                errorField.remove();
            }

            // Si des caractères spéciaux sont détectés
            if (specialCharsPattern.test(inputField.value)) {
                // Créer l'élément d'erreur si nécessaire
                errorField = document.createElement('span');
                errorField.classList.add('error');
                errorField.id = errorId;
                errorField.textContent = "Ce champ ne doit contenir que des lettres.";
                inputField.insertAdjacentElement('afterend', errorField); // Insère l'élément d'erreur après le champ
                inputField.setCustomValidity("Ce champ ne doit contenir que des lettres.");
            } else {
                // Si le champ est valide, réinitialiser la validité
                inputField.setCustomValidity(""); // Réinitialise la validité
            }
        });
    }

    // Associer la fonction aux champs "Nom" et "Prénom"
    hideErrorOnInput('nom', 'error-nom');
    hideErrorOnInput('prenom', 'error-prenom');
    hideErrorOnInput('login', 'error-login');
    hideErrorOnInput('password', 'error-password');
    hideErrorOnInput('confirmation', 'error-confirmation');
    
    // Validation des caractères spéciaux pour "Nom" et "Prénom"
    validateSpecialChars('nom', 'error-nom');
    validateSpecialChars('prenom', 'error-prenom');
</script>



</main>


<%@include file="inc/footer.jsp" %>