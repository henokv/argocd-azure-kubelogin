FROM quay.io/argoproj/argocd:v2.7.2

USER root

RUN apt-get update && \
    apt-get install -y \
        curl \
        zip && \
    apt-get clean && \
    mkdir /tmp/kl && \
    curl -o /tmp/kl/kubelogin-linux-amd64.zip -L https://github.com/Azure/kubelogin/releases/download/v0.0.30/kubelogin-linux-amd64.zip && \
    unzip /tmp/kl/kubelogin-linux-amd64.zip -d /tmp/kl && \
    mv /tmp/kl/bin/linux_amd64/kubelogin /usr/local/bin/kubelogin && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Switch back to non-root user
USER $ARGOCD_USER_ID
