# Monitoring Stack Installer

One-click installer to deploy a full monitoring stack using **Prometheus + Grafana + Loki + Promtail + Node Exporter + Portainer** with Docker Compose.  
Built for easy self-hosted monitoring, including auto dashboard provisioning & optional SSO/reverse proxy.

---

## Components

| Service         | Description                             |
|------------------|-----------------------------------------|
| Prometheus     | Metrics collection & alerting           |
| Grafana        | Visualization dashboard for everything  |
| Loki           | Centralized logging (via Promtail)      |
| Promtail       | Log shipper agent for Loki              |
| Node Exporter  | System-level metrics collector          |
| Portainer      | Web UI to manage Docker environments    |

---

## Quick Start

```bash
git clone https://github.com/znand-dev/monitoring-installer.git
cd monitoring-installer
cp .env.example .env       # Edit if needed
bash scripts/install.sh    # Run the installer
```

Then open Grafana at: [http://localhost:3000](http://localhost:3000)

---

## Features

- Docker Compose setup
- Auto dashboard import
- Configured datasources
- Optional SSO integration (planned)
- Reverse proxy ready (NGINX/Traefik)
- Volume persistence

---

## Stack Preview

| URL                   | Service       | Default Port        |
|------------------------|----------------|----------------------|
| http://localhost:3000  | Grafana        | `${GRAFANA_PORT}`    |
| http://localhost:9090  | Prometheus     | `${PROMETHEUS_PORT}` |
| http://localhost:3100  | Loki           | `${LOKI_PORT}`       |
| http://localhost:9000  | Portainer      | `${PORTAINER_PORT}`  |

---

## Folder Structure

```
monitoring-installer/
├── config/
│   ├── grafana/
│   │   ├── datasources/
│   │   ├── dashboards/
│   │   └── provisioning/dashboards/
│   ├── loki/
│   ├── prometheus/
│   └── promtail/
├── scripts/
│   ├── install.sh
│   └── uninstall.sh
├── docker-compose.yml
├── .env.example
└── README.md
```

---

## Dashboard Examples

- Node Exporter Full (ID: `1860`)
- Loki System Logs (ID: `15172`)
- Docker Container Monitoring

> Import manually or add your own to `config/grafana/dashboards/`

---

## Uninstall

To remove the entire stack:

```bash
bash scripts/uninstall.sh
```

---

## To Do

- [ ] 🔐 Add SSO support (Authelia / Keycloak)
- [ ] 🌐 Add NGINX/Traefik reverse proxy
- [ ] 🔄 Auto backup dashboard
- [ ] 🔁 Export metrics for AdGuard / PiHole

---

## Author

> 🧠 [znand-dev](https://github.com/znand-dev) – Made in Indonesia

---

## License

MIT
