FROM python:3.8.2-alpine3.11
RUN apk add build-base
RUN apk add postgresql-dev=12.2-r0
RUN mkdir /wheels
COPY requirements.txt requirements.txt

RUN pip wheel --disable-pip-version-check --no-deps --wheel-dir /wheels -r requirements.txt

FROM python:3.8.2-alpine3.11
RUN apk --update --no-cache add postgresql-libs=12.2-r0
COPY --from=0 /wheels /wheels
RUN pip install --disable-pip-version-check --no-index --no-deps /wheels/* && rm -rf /wheels
