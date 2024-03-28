
FROM oziproject/supported-python:2023
COPY ./pyc_wheel .
RUN chmod +x action.sh
RUN set -ex \
  && apt-get update \
  && apt-get install -y --no-install-recommends git \
  && rm -rf /var/lib/apt/lists/* \
  && rm -f /var/cache/apt/archives/*.deb
RUN /root/.pyenv/versions/$(/root/.pyenv/bin/pyenv latest 3.12)/bin/python -m venv .venv
ENTRYPOINT bash -c "source .venv/bin/activate && python -m pip install . && bash action.sh"
