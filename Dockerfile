FROM ubuntu

ENV TERRAFORM_HOME=/terraform
ENV PATH=${PATH}:${TERRAFORM_HOME}

RUN apt update -qq && \
    apt install -y make curl openssh-client git python3-pip git && \
    pip3 install pre-commit && \
    mkdir ${TERRAFORM_HOME} && \
    curl -sL https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash -s -- -b ${TERRAFORM_HOME} && \
    curl -sL https://github.com/terraform-docs/terraform-docs/releases/download/v0.11.1/terraform-docs-v0.11.1-linux-amd64 -o ${TERRAFORM_HOME}/terraform-docs && \
    chmod +x ${TERRAFORM_HOME}/terraform-docs

COPY entrypoint.sh /entrypoint.sh
COPY Makefile /Makefile

ENTRYPOINT [ "/entrypoint.sh" ]
