## README

Code source du site des associations de Grenoble INP - Ensimag.

### Déploiement avec Dokku

Cette application supporte le déploiement via Dokku v0.8+, avec les plugins suivants:

* [dokku-postgres](https://github.com/dokku/dokku-postgres)
* [dokku-letsencrypt](https://github.com/dokku/dokku-letsencrypt) pour HTTPS

Un [app.json](app.json) est fourni, ainsi qu'un fichier CHECKS pour la vérification du déploiement.

```bash
### SUR LE SERVEUR DOKKU ###
# Création de l'app
dokku apps:create asso_ensimag
# Création de la BD
dokku postgres:create asso_ensimag
# Link app/BD
dokku postgres:link asso_ensimag asso_ensimag
# Création mountpoint pour uploads
dokku storage:mount asso_ensimag /var/lib/dokku/data/storage/asso_ensimag/public/uploads:/app/public/uploads
# Configuration du mail
dokku config:set asso_ensimag ASSO_SMTP_LOGIN=adresse.contact@gmail.com
dokku config:set asso_ensimag ASSO_SMTP_PASS=[app password pour adresse.contact@gmail.com]
dokku config:set asso_ensimag ASSO_SMTP_DOMAIN=gmail.com   # Car gmail utilisé pour les mails de contact
# Configuration de l'adresse canonique du site 
dokku config:set asso_ensimag ASSO_DOMAIN=asso-ensimag.com # Ou autre domaine configuré, numéro de port compris
# Indiquer que HTTPS est utilisé
dokku config:set asso_ensimag ASSO_HTTPS=1

### EN LOCAL ###
# "dokku" est le remote correspondant à l'app sur le serveur
git push dokku master

### SUR LE SERVEUR DOKKU ###
# Création/migration BD
dokku run asso_ensimag bundle exec rake db:create db:migrate
# Activation des checks
dokku checks:enable asso_ensimag
```
