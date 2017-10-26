FROM alpine:3.6

RUN apk add --no-cache \
    ca-certificates \
    libffi-dev \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install gunicorn httpbin \
  && echo '#!/bin/sh' > run.sh \
  && echo 'gunicorn --bind=0.0.0.0:80 httpbin:app' >> run.sh \
  && chmod +x run.sh \
  && apk del python-dev \
     build-base \
     ca-certificates \ 
     libffi-dev 

EXPOSE 80

CMD ["./run.sh"]
