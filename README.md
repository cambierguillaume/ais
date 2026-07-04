# Ubuntu Hardening AIS v2.1

Version améliorée du framework de hardening Ubuntu pour dossier Administrateur d'Infrastructures Sécurisées.

## Nouveautés v2.1

- journalisation centralisée ;
- rollback par module ;
- vérification de syntaxe Bash ;
- tests rapides ;
- génération de rapport Markdown ;
- structure prête pour GitHub Actions ;
- documentation de soutenance.

## Utilisation

```bash
unzip ubuntu-hardening-ais-v2.1.zip
cd ubuntu-hardening-ais-v2.1
sudo ./install.sh
sudo ./audit.sh
sudo ./rollback.sh
./tests/smoke-test.sh
```
