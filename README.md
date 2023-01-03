# The SPAT Stack
A Secured (reverse-)Proxy with Auth & Traefik ( Prounced: /spæt/ )

## Notice
this is very early days, please use the docker swam version the others are works in progress

## Whats in The SPAT Stack?
- [Traefik](https://traefik.io/traefik/)
- [Authentik](https://goauthentik.io/)
- [Crowdsec](https://www.crowdsec.net/)
- [Postresql](https://www.postgresql.org/)
- [Redis](https://redis.io/)

## Why use spat over swag
- swag uses a nginx server for the reverse proxy and has to be configured manually for each proxyed app, without any automation.
- spat uses a traefik server that can be used as a load balancer and a reverse proxy it can also be automated with podman, docker or kubernetes
