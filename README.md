# Ubuntu Hardening AIS v4.0

Framework professionnel de durcissement Ubuntu/Debian pour un dossier **Administrateur d'Infrastructures Sécurisées (AIS)**.

## Objectifs

- Automatiser le hardening Linux avec Bash.
- Déployer les configurations avec Ansible.
- Générer des rapports d'audit.
- Vérifier la qualité avec GitHub Actions.
- Documenter la conformité ANSSI/CIS.

## Utilisation rapide

```bash
sudo ./install.sh
sudo ./audit.sh
sudo ./report.sh
```

## Tests

```bash
make test
```

## Ansible

```bash
cd ansible
ansible-playbook site.yml -K
```

## Modules inclus

SSH, UFW, Fail2ban, AppArmor, Auditd, AIDE, ClamAV, Sysctl, PAM, sudo, journald, logrotate, chrony, tmpfs, fstab, USB, Docker, Lynis, OpenSCAP, monitoring, reporting, backup et rollback.
