###############
# BUILD IMAGE #
###############
FROM python:3.8.7-buster AS build

# virtualenv
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# add and install requirements
RUN pip install --no-cache-dir --upgrade pip wheel
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


#################
# RUNTIME IMAGE #
#################
FROM python:3.8.7-slim-buster AS runtime

# setup user and group ids
ARG USER_ID=1000
ENV USER_ID $USER_ID
ARG GROUP_ID=1000
ENV GROUP_ID $GROUP_ID
ENV GROUP_NAME mlflowgrp
ENV USER_NAME mlflowusr

# add non-root user and give permissions to workdir
RUN groupadd --gid $GROUP_ID $GROUP_NAME && \
          adduser $USER_NAME --ingroup $GROUP_NAME --gecos '' --disabled-password --uid $USER_ID && \
          mkdir -p /var/mlflow && \
          chown -R $USER_NAME:$GROUP_NAME /var/mlflow

# copy from build image
COPY --chown=$USER_NAME:$GROUP_NAME --from=build /opt/venv /opt/venv

# set working directory
WORKDIR /var/mlflow

# switch to non-root user
USER $USER_NAME

# disables lag in stdout/stderr output
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
# Path
ENV PATH="/opt/venv/bin:$PATH"

# Run mlflow server
ENTRYPOINT ["mlflow", "server"]
