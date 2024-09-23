FROM gradle:jdk21 AS builder

RUN apt-get update && apt-get install -y unzip python3 python3-pip python3-venv
COPY . /opt/src/ghidra
WORKDIR /opt/src/ghidra
RUN gradle -I gradle/support/fetchDependencies.gradle
RUN gradle buildGhidra
RUN unzip build/dist/ghidra_*.zip -d /opt && mv /opt/ghidra_* /opt/ghidra

FROM python:alpine
RUN apk add --no-cache openjdk21 g++ build-base
ENV GHIDRA_INSTALL_DIR=/opt/ghidra
COPY --from=builder /opt/ghidra /opt/ghidra/
RUN pip install /opt/ghidra/Ghidra/Features/PyGhidra/pypkg/
CMD pyghidra
