FROM opensecurity/mobile-security-framework-mobsf

LABEL version="1.1.0"
LABEL repository="https://github.com/JohnBellSageCom/mobsf-action"
LABEL homepage="https://github.com/JohnBellSageCom/mobsf-action"
LABEL maintainer="John.Bell@sage.com"

LABEL com.github.actions.name="GitHub Action for MobSF"
LABEL com.github.actions.description="Wraps the MobSF docker to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

USER root
RUN apt-get update -y && \
  apt-get install -y curl jq

USER mobsf
COPY LICENSE README.md /
COPY "entrypoint.sh" "/home/mobsf/Mobile-Security-Framework-MobSF/entrypoint_github.sh"

ENTRYPOINT ["/home/mobsf/Mobile-Security-Framework-MobSF/entrypoint_github.sh"]
CMD ["--help"]
