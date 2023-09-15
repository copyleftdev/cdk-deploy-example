# My AWS CDK Project

This project utilizes the AWS Cloud Development Kit (CDK) to deploy a Docker-based MySQL instance on an EC2 instance, which is publicly accessible.

## Prerequisites

- **AWS CLI**: Ensure you have the AWS CLI installed and configured with the necessary access rights.
  
  Installation:
  ```bash
  pip install awscli
  aws configure
  ```

- **Node.js and npm**: The AWS CDK is developed in TypeScript, which runs on Node.js. Ensure you have both installed.

  Installation (for most platforms):
  ```bash
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
  sudo apt-get install -y nodejs
  ```

## Setup

### 1. Install AWS CDK Globally:

```bash
npm install -g aws-cdk
```

### 2. Clone and Navigate to the Project:

```bash
git clone [your-git-repo-url]
cd [your-project-directory]
```

### 3. Install Project Dependencies:

Inside the project directory:

```bash
npm install
```

## Deployment

### 1. Bootstrap (Only Required the First Time):

If you've never used AWS CDK with your AWS account and region, you'll need to run the bootstrap command:

```bash
cdk bootstrap
```

### 2. Deploy the Stack:

To deploy your AWS resources:

```bash
cdk deploy
```

## Teardown

To remove the resources created by the CDK:

```bash
cdk destroy
```

## Important Notes

- Be cautious about AWS costs. Make sure to destroy resources when not in use to avoid incurring unnecessary charges.
- Exposing a database instance to the public is risky. Always ensure that you've considered security best practices, such as IP whitelisting, strong passwords, and using secure connections.

