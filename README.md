# opentsdb-practice

[블로그 글 OpenTSDB 사용하기 예제 프로젝트](https://github.com/mcauto/mcauto.github.io/blob/master/_posts/2019-01-08-how-to-use-opentsdb.md)

# 실행 방법
```bash
make run
docker logs -f opentsdb-docker_opentsdb_1 # 실행이 완벽히 끝날 때 까지 기다려야 함
make put && make query # write, read 테스트
```
