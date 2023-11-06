FROM python:3.12-bookworm

WORKDIR /mydir

RUN curl -sSL https://install.python-poetry.org | python3 -

RUN apt-get -y update
RUN apt-get install -yqq unzip
RUN apt-get install -yqq libnss3-dev libgdk-pixbuf2.0-dev libgtk-3-dev libxss-dev
RUN apt-get install -yqq libasound2

RUN wget https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/118.0.5993.70/linux64/chrome-linux64.zip
RUN unzip chrome-linux64.zip -d /usr/local/bin/

RUN wget https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/118.0.5993.70/linux64/chromedriver-linux64.zip
RUN unzip chromedriver-linux64.zip -d /usr/local/bin/

ENV DISPLAY=:99
ENV PATH="/root/.local/bin:/usr/local/bin/chromedriver-linux64:/usr/local/bin/chrome-linux64:$PATH"

CMD bash

# docker build . --no-cache -t mluukkai/poetry-robot
# docker run -it --volume="$PWD:/mydir" -p 5001:5001 mluukkai/poetry-robot
