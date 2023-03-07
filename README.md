# k8s-aws-ecr-secret-updater

This repository contains a tool for automatically updating the password used to pull Docker images from AWS ECR, using a cron job. The tool is designed to work on Kubernetes clusters.

## How to install on k8s

 1. Clone this repo

 2. Set in install.yaml file the following values:
    - AWS_ACCOUNT
    - AWS_ACCESS_KEY_ID
    - AWS_SECRET_ACCESS_KEY
    - AWS_REGION

 3. Run the following command:
 ```shell
 kubectl apply -n <destination_namespace> -f install.yaml
 ```

## Contributing
If you have any issues or feature requests, please feel free to open an issue or pull request in this repository. I welcome contributions from the community!