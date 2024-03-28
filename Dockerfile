
FROM oziproject/supported-python:2023
RUN mkdir /pyc_wheel
WORKDIR /pyc_wheel
COPY action.sh /pyc_wheel/action.sh
COPY . /pyc_wheel/
RUN chmod +x /pyc_wheel/action.sh
ENV PATH /root/.pyenv/versions/$(/root/.pyenv/bin/pyenv latest 3.12)/bin:${PATH}
RUN python3.12 -m pip install .
ENTRYPOINT ["bash", "/pyc_wheel/action.sh" ]
