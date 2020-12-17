# helloworld-lambda-container

build

```
docker build -t hello-lambda-world .
```

run @ local

```
docker run -p 9000:8080 hello-lambda-world:latest
```

test @ local

```
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```

register to ECR with AWS CLI

```
aws ecr create-repository --repository-name hello-lambda-world
```

tag your container image

```
docker tag hello-lambda-world:latest 123456789012.dkr.ecr.ap-northeast-1.amazonaws.com/hello-lambda-world:latest
```

login to ECR with Docker CLI

```
aws ecr get-login-password | \
docker login --username AWS --password-stdin 123456789012.dkr.ecr.ap-northeast-1.amazonaws.com
```

push container image to ECR with Docker CLI

```
docker push 123456789012.dkr.ecr.ap-northeast-1.amazonaws.com/hello-lambda-world:latest
```

then, create function on Lambda Console.
see https://aws.amazon.com/jp/blogs/aws/new-for-aws-lambda-container-image-support/
