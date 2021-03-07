FROM alpine:3.13

LABEL author="Daniel Winks"

ENV GIT_SSH_COMMAND='ssh -oStrictHostKeyChecking=accept-new'

RUN apk --no-cache add git openssh-client

CMD ["/bin/ash"]
