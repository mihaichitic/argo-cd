ARG ARGO_CLI_IMAGE=quay.io/argoproj/argocd
ARG ARGO_CLI_TAG=latest
FROM ${ARGO_CLI_IMAGE}:${ARGO_CLI_TAG} as argocd

FROM bitnami/kubectl:latest

ARG TTYD_VERSION=1.7.3

USER root
RUN apt-get update && apt-get install curl -y

RUN curl -sSL -o /usr/local/bin/ttyd https://github.com/tsl0922/ttyd/releases/download/${TTYD_VERSION}/ttyd.x86_64 \
    && chmod +x /usr/local/bin/ttyd

COPY --from=argocd /usr/local/bin/argocd /usr/local/bin/argocd
