FROM iojs:onbuild
MAINTAINER github.com/sammcj

ENV HUBOT_PORT 8000
ENV HUBOT_ADAPTER xmpp
ENV HUBOT_NAME ixbot
ENV HUBOT_XMPP_USERNAME hubot-login@your.org
ENV HUBOT_XMPP_PASSWORD <xmpp password here>
ENV HUBOT_XMPP_ROOMS room1@conference.your.org,room2@conference.your.org
ENV PORT ${HUBOT_PORT}

# Wolfram Alpha
# hubot question <question> - Searches Wolfram Alpha for the answer to the question
ENV HUBOT_WOLFRAM_APPID <wolfram api key>

# Gitlab CI
# Add gitlab webhook url: http://<hubot.url>/gitlabci
#ENV GITLABCI_CHANNEL room@conference.your.org

# Nagios
ENV HUBOT_NAGIOS_EVENT_NOTIFIER_ROOM room@conference.your.org

EXPOSE ${HUBOT_PORT}

COPY invoke /usr/src/app/

ENTRYPOINT ["./invoke"]
EXPOSE 8000
