FROM public.ecr.aws/spacelift/runner-terraform
USER root
WORKDIR /home/spacelift
RUN apk add --update --no-cache curl py-pip
RUN apk -v --no-cache --update add \
    musl-dev \
    gcc \
    python3 \
    python3-dev
RUN python3 -m ensurepip --upgrade \
    && pip3 install --upgrade pip
RUN pip3 install --upgrade awscli aws-sam-cli
RUN pip3 uninstall --yes pip \
    && apk del python3-dev gcc musl-dev
RUN sam --version
USER spacelift
