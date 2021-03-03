FROM alpine:3

ENV TERRAFORM_HOME=/terraform
ENV PATH=${PATH}:${TERRAFORM_HOME}

RUN apk add --no-cache curl make py3-pip libc6-compat git bash perl && \
    pip3 install pre-commit && \
    mkdir ${TERRAFORM_HOME} && \
    curl -sL https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash -s -- -b ${TERRAFORM_HOME} && \
    curl -sL https://github.com/terraform-docs/terraform-docs/releases/download/v0.11.1/terraform-docs-v0.11.1-linux-amd64 -o ${TERRAFORM_HOME}/terraform-docs && \
    chmod +x ${TERRAFORM_HOME}/terraform-docs

COPY entrypoint.sh /entrypoint.sh
COPY Makefile /Makefile

ENTRYPOINT [ "/entrypoint.sh" ]
