FROM jenkins/jenkins:lts

USER root

RUN jenkins-plugin-cli --plugins \
  git \
  workflow-aggregator \
  pipeline-stage-view \
  sonar \
  sonar-quality-gates \
  docker-workflow \
  github