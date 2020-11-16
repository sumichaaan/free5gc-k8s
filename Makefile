# Makefile
F5GC_BASE_NAME           ?= f5gc-build-base
F5GC_GNBSIM_NAME         ?= f5gc-gnbsim
F5GC_AMF_NAME            ?= f5gc-amf
F5GC_SMF_NAME            ?= f5gc-smf
F5GC_UPF_NAME            ?= f5gc-upf
F5GC_NRF_NAME		 ?= f5gc-nrf
F5GC_AUSF_NAME           ?= f5gc-ausf
F5GC_NSSF_NAME           ?= f5gc-nssf
F5GC_PCF_NAME            ?= f5gc-pcf
F5GC_UDM_NAME            ?= f5gc-udm
F5GC_UDR_NAME            ?= f5gc-udr
F5GC_WEBUI_NAME		 ?= f5gc-webui

DOCKER_ENV              ?= DOCKER_BUILDKIT=1
DOCKER_TAG              ?= v3.0.4
DOCKER_REGISTRY         ?= ghcr.io
DOCKER_REPOSITORY       ?= sumichaaan/free5gc-k8s
DOCKER_BUILD_ARGS       ?= --rm

BASE_IMAGE_NAME         ?= ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_BASE_NAME}:${DOCKER_TAG}
GNBSIM_IMAGE_NAME       ?= ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_GNBSIM_NAME}:${DOCKER_TAG}
AMF_IMAGE_NAME          ?= ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_AMF_NAME}:${DOCKER_TAG}
SMF_IMAGE_NAME          ?= ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_SMF_NAME}:${DOCKER_TAG}
UPF_IMAGE_NAME          ?= ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_UPF_NAME}:${DOCKER_TAG}
NRF_IMAGE_NAME          ?= ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_NRF_NAME}:${DOCKER_TAG}
AUSF_IMAGE_NAME         ?= ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_AUSF_NAME}:${DOCKER_TAG}
NSSF_IMAGE_NAME         ?= ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_NSSF_NAME}:${DOCKER_TAG}
PCF_IMAGE_NAME          ?= ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_PCF_NAME}:${DOCKER_TAG}
UDM_IMAGE_NAME          ?= ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_UDM_NAME}:${DOCKER_TAG}
UDR_IMAGE_NAME          ?= ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_UDR_NAME}:${DOCKER_TAG}
WEBUI_IMAGE_NAME          ?= ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_WEBUI_NAME}:${DOCKER_TAG}



build-all: build-base build-gnbsim build-amf build-smf build-upf build-nrf build-ausf build-nssf build-pcf build-udm build-udr build-webui


.PHONY: build-base
build-base:
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${BASE_IMAGE_NAME} \
		--file ./images/${F5GC_BASE_NAME}/Dockerfile.alpine \
		./images/${F5GC_BASE_NAME}

.PHONY: build-gnbsim
build-gnbsim:
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${GNBSIM_IMAGE_NAME} \
		--file ./images/${F5GC_GNBSIM_NAME}/Dockerfile.ubuntu18 \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		--no-cache \
		./images/${F5GC_GNBSIM_NAME}

.PHONY: build-amf
build-amf: build-base
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${AMF_IMAGE_NAME} \
		--file ./images/${F5GC_AMF_NAME}/Dockerfile.alpine \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		./images/${F5GC_AMF_NAME}

.PHONY: build-smf
build-smf: build-base
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${SMF_IMAGE_NAME} \
		--file ./images/${F5GC_SMF_NAME}/Dockerfile.alpine \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		./images/${F5GC_SMF_NAME}

.PHONY: build-upf
build-upf: build-base
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${UPF_IMAGE_NAME} \
		--file ./images/${F5GC_UPF_NAME}/Dockerfile.ubuntu18 \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		./images/${F5GC_UPF_NAME}

.PHONY: build-nrf
build-nrf: build-base
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${NRF_IMAGE_NAME} \
		--file ./images/${F5GC_NRF_NAME}/Dockerfile.alpine \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		./images/${F5GC_NRF_NAME}

.PHONY: build-ausf
build-ausf: build-base
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${AUSF_IMAGE_NAME} \
		--file ./images/${F5GC_AUSF_NAME}/Dockerfile.alpine \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		./images/${F5GC_AUSF_NAME}

.PHONY: build-nssf
build-nssf: build-base
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${NSSF_IMAGE_NAME} \
		--file ./images/${F5GC_NSSF_NAME}/Dockerfile.alpine \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		./images/${F5GC_NSSF_NAME}

.PHONY: build-pcf
build-pcf: build-base
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${PCF_IMAGE_NAME} \
		--file ./images/${F5GC_PCF_NAME}/Dockerfile.alpine \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		./images/${F5GC_PCF_NAME}

.PHONY: build-udm
build-udm: build-base
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${UDM_IMAGE_NAME} \
		--file ./images/${F5GC_UDM_NAME}/Dockerfile.alpine \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		./images/${F5GC_UDM_NAME}

.PHONY: build-udr
build-udr: build-base
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${UDR_IMAGE_NAME} \
		--file ./images/${F5GC_UDR_NAME}/Dockerfile.alpine \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		./images/${F5GC_UDR_NAME}

.PHONY: build-nssf
build-nssf: build-base
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${NSSF_IMAGE_NAME} \
		--file ./images/${F5GC_NSSF_NAME}/Dockerfile.alpine \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		./images/${F5GC_NSSF_NAME}

.PHONY: build-pcf
build-pcf: build-base
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${PCF_IMAGE_NAME} \
		--file ./images/${F5GC_PCF_NAME}/Dockerfile.alpine \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		./images/${F5GC_PCF_NAME}

.PHONY: build-udm
build-udm: build-base
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${UDM_IMAGE_NAME} \
		--file ./images/${F5GC_UDM_NAME}/Dockerfile.alpine \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		./images/${F5GC_UDM_NAME}

.PHONY: build-udr
build-udr: build-base
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${UDR_IMAGE_NAME} \
		--file ./images/${F5GC_UDR_NAME}/Dockerfile.alpine \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		./images/${F5GC_UDR_NAME}

.PHONY: build-webui
build-webui: build-base
	${DOCKER_ENV} docker build ${DOCKER_BUILD_ARGS} \
		--tag ${WEBUI_IMAGE_NAME} \
		--file ./images/${F5GC_WEBUI_NAME}/Dockerfile.alpine \
		--build-arg REGISTRY=${DOCKER_REGISTRY} \
		--build-arg REPOSITORY=${DOCKER_REPOSITORY} \
		--build-arg TAG=${DOCKER_TAG} \
		./images/${F5GC_WEBUI_NAME}

clean:
	docker rmi ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_BASE_NAME}:${DOCKER_TAG}
	docker rmi ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_GNBSIM_NAME}:${DOCKER_TAG}
	docker rmi ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_AMF_NAME}:${DOCKER_TAG}
	docker rmi ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_SMF_NAME}:${DOCKER_TAG}
	docker rmi ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_UPF_NAME}:${DOCKER_TAG}
	docker rmi ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_NRF_NAME}:${DOCKER_TAG}
	docker rmi ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_AUSF_NAME}:${DOCKER_TAG}
	docker rmi ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_NSSF_NAME}:${DOCKER_TAG}
	docker rmi ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_PCF_NAME}:${DOCKER_TAG}
	docker rmi ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_UDM_NAME}:${DOCKER_TAG}
	docker rmi ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_UDR_NAME}:${DOCKER_TAG}
	docker rmi ${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}/${F5GC_WEBUI_NAME}:${DOCKER_TAG}
