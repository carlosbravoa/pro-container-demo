# Pro Container Demo

A demonstration of an Ubuntu Pro container with PHP, showcasing the benefits of Extended Security Maintenance (ESM) fixes for open-source libraries and dependencies available on Ubuntu Pro.

## Overview

This repository demonstrates how to build and run an Ubuntu Pro container with PHP. The container leverages Ubuntu Pro’s advanced features, such as ESM fixes, providing enhanced security and support for your software stack.

## Key Features of Ubuntu Pro Containers

 - Expanded Security Maintenance (ESM):
     - No CVEs containers: Apply security patches and updates for all your open-source libraries 
 - Long-Term Support:
     - Rely on the extended lifespan of Ubuntu Pro for enterprise environments.
 - Compliance:
     - Meet your compliance requirements with enabling FIPS for FedRAMP environments or assisted hardening with the Ubuntu Security Guide tool (usg).

## Prerequisites

Before building and running the container, ensure the following requirements are met:

1. **Ubuntu Pro on EC2**  
   - You must be running on an **EC2 instance** using the Ubuntu Pro Amazon Machine Image (AMI).
     ![Ubuntu Pro AMI](https://github.com/user-attachments/assets/89677c23-0be4-4872-9c85-4d0b8524e425)

   
2. **IMDS V2 Enabled**  
   - Configure **Instance Metadata Service v2 (IMDSv2)** with at least **two hops** enabled. This is necessary to expose the metadata to the container during the build process.
     ![metadata-jumps](https://github.com/user-attachments/assets/dbcb6a30-40c5-4e5d-86d2-1c918835e2b7)


3. **Ubuntu Pro Subscription**    
   - Ensure that the **Ubuntu Pro subscription** is active for all hosts or worker nodes in your environment:
     - For **EKS clusters**, every worker node must either:
       - Use the Ubuntu Pro AMI, or  
       - Be configured with Canonical tokens.  

   Without these configurations, the container will not function correctly with Ubuntu Pro features.

## Quick Start

Follow these steps to build and run the Ubuntu Pro container:

1. **Clone this repository**:
   ```bash
   git clone https://github.com/canonical/ubuntu-cloud-docs.git
   cd pro-container-demo
   ```
1. **Install Docker**:
   ```bash
   sudo snap install docker
   ```
1. **Build the container**:
   ```bash
   sudo docker build -t ubuntu-pro-php-demo .
   ```
1. **Run the container**:
   If you want to test directly using Docker:
   ```bash
   sudo docker run -it --rm ubuntu-pro-php-demo
   ```
   You can also push it to a public (online) repo such as Dockerhub or ECR and deploy it directly onto your clusters.

## IMPORTANT NOTES

- **Ubuntu Pro Subscription Requirement**:  
  Ubuntu Pro containers require that the underlying nodes (e.g., EC2 instances, Kubernetes worker nodes, or any host machine) have an active Ubuntu Pro subscription. Without this subscription, the container will run unlicensed and will be in violation of the [Ubuntu Pro terms of condition (TOS)](https://assets.ubuntu.com/v1/2b1d777a-Ubuntu%20Pro%20description%20-%20deploy%20May%202024%20(1).pdf).

  - For **standalone EC2 instances**: Use the Ubuntu Pro AMI or ensure the instance is subscribed to Ubuntu Pro.
  - For **Kubernetes clusters**: Every worker node in the cluster must:
    - [Use an Ubuntu Pro AMI](https://documentation.ubuntu.com/aws/en/latest/aws-how-to/kubernetes/deploy-ubuntu-pro-cluster-with-eks-pro-ami/), **or**
    - Be manually subscribed to Ubuntu Pro using Canonical tokens.

