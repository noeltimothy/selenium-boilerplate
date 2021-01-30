FROM ubuntu:18.04
RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y \
xorg python3-pip chromium-chromedriver xvfb

RUN pip3 install selenium webdriver_manager pandas flask
RUN pip3 install bs4 lxml
WORKDIR selenium

ENTRYPOINT ["tail", "-f", "/dev/null"]
