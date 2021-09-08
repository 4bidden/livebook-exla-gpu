docker run -d \
  --name=livebook-gpu \
  -v /home/claudiu/work/training_audio:/data \
  -v tmp:/cache \
  -p 8080:8080 \
  -e TEST_TMP=/cache/tmp/bazel_cache \
  -e EXLA_CACHE=/cache/tmp/exla_cache \
  -e EXLA_FLAGS=--config=cuda \
  -e EXLA_TARGET=cuda \
  --gpus=all \
  livebook-gpu
docker logs -f --tail=100 livebook-gpu
