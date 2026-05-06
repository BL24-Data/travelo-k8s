# Travelo Kubernetes Deployment

Volet 2 du projet de Conteneurisation et Orchestration — Master Data & IA, INPT 2025/2026.

Déploiement de l'application Travelo (React + Spring + MySQL) sur Kubernetes.

## Structure du projet
travelo-k8s/
├── 00-namespace/      # Namespace travelo
├── 01-config/         # ConfigMaps & Secrets
├── 02-database/       # MySQL StatefulSet, PVC, Service
├── 03-backend/        # Spring Boot Deployment & Service
├── 04-frontend/       # React Deployment & Service
├── 05-ingress/        # Ingress pour travelo.local
├── 06-security/       # RBAC, ResourceQuota, PodDisruptionBudget
└── screenshots/       # Captures d'écran pour le rapport
## Prérequis

- Docker Desktop
- Minikube v1.x+
- kubectl v1.28+

## Démarrage rapide

```bash
# 1. Démarrer le cluster
minikube start --driver=docker --memory=4096 --cpus=2
minikube addons enable ingress
minikube addons enable metrics-server

# 2. Déployer dans l'ordre
kubectl apply -f 00-namespace/
kubectl apply -f 01-config/
kubectl apply -f 02-database/
kubectl apply -f 03-backend/
kubectl apply -f 04-frontend/
kubectl apply -f 05-ingress/
kubectl apply -f 06-security/

# 3. Vérifier
kubectl get all -n travelo
```

## Architecture

- **Frontend** (React) — 2 réplicas — Deployment
- **Backend** (Spring Boot) — 2 réplicas — Deployment
- **Database** (MySQL 8.0) — 1 réplica — StatefulSet avec stockage persistant

## Auteure

Boutaina Lakhlit — INPT Master Data & IA
