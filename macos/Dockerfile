FROM sickcodes/docker-osx
ARG TAGS
WORKDIR /tmp
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py --user && \
    python3 -m pip install --user ansible && \
    python3 -m pip install --user paramiko && \
    sudo python3 get-pip.py && \
    sudo python3 -m pip install ansible

COPY .. .
CMD ["sh", "-c", "ansible-playbook $TAGS macos/setup.yml"]