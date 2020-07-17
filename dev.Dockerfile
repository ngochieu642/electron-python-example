FROM nikolaik/python-nodejs:python3.6-nodejs12

RUN useradd --create-home appuser
WORKDIR /home/appuser

COPY pycalc/requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt

COPY package.json .
COPY install-packages.sh .

RUN ./install-packages.sh && \
    npm install && \
    npm install electron-rebuild && \
    ./node_modules/.bin/electron-rebuild

ADD . .

RUN rm -rf pycalcdist/ && \
    rm -rf api.spec && \
    pyinstaller --hidden-import='pkg_resources.py2_warn' pycalc/api.py --distpath pycalcdist -y && \
    ./node_modules/.bin/electron-packager . --overwrite --ignore="pycalc$" --ignore="\.venv" --ignore="old-post-backup"

USER appuser
CMD ["./pretty-calculator-linux-x64/pretty-calculator"]