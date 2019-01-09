OPENTSDB=opentsdb-docker

all: run

opentsdb:
ifneq ($(wildcard $(OPENTSDB)),)
	echo "already exist $(OPENTSDB)"
else
	git clone https://github.com/mcauto/opentsdb-docker.git
endif

run: opentsdb	
	cd opentsdb-docker && docker-compose up -d

web-ui:
	curl -X GET http://localhost:4242

# write
put:
	curl -X POST -H "Content-Type: application/json; charset=utf-8" -d \
	'{"metric": "sys.cpu.nice", "timestamp": 1546957946, "value": 18, "tags": {"host": "deo"}}' \
	http://localhost:4242/api/put?details

# read
query:
	curl -X GET -H "Content-Type: application/json; charset=utf-8" "http://localhost:4242/api/query?start=1546957946&m=sum:sys.cpu.nice"

.PHONY: all run opentsdb web-ui put query