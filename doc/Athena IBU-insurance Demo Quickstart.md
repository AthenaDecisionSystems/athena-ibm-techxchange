# Athena IBU-Insurance Demo Quickstart
This demo showcases an Insurance Customer Service scenario where a chatbot, relying solely on pure LLM technology, including Retrieval-Augmented Generation (RAG), produces inaccurate responses that do not align with the insurance carrier's policy.  
It then demonstrates the solution: An agentic architecture that orchestrates a rule-based decision service built with IBM Operational Decision Manager ([IBM ODM](https://www.ibm.com/fr-fr/products/operational-decision-manager)) and LLM-based agents available through [watsonx.ai](https://www.ibm.com/products/watsonx-ai).

## Prerequisites
Below are the prerequisites to install and run the demo:  

**UNDER PROGRESS BEGIN**
- Access to [IBM watsonx.ai](https://www.ibm.com/products/watsonx-ai).
  - You can start a free trial by following the **Start your free trial** link in https://www.ibm.com/products/watsonx-ai. If you don't have an IBM Cloud account yet, you will be prompted to create one.  

**UNDER PROGRESS END**

- [Git](https://git-scm.com/) in order to get the bootstrap files on your machine
- An IBM account (an IBMid)
- [Docker Compose](https://docs.docker.com/compose/) in order to run the demo, which is a multi-container application.
  - On Windows, the simplest and recommended approach is to get [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/) as it includes both Docker Engine and Docker Compose required to run the demo
  - On Mac you can use either [Docker Desktop](https://docs.docker.com/desktop/install/mac-install/) or [Colima](https://github.com/abiosoft/colima)
- A web browser. The demo has been thoroughly tested using Google Chrome.

## Demo Setup in a Few Easy Steps
### Clone the bootstrap files from GitHub
- Run `git clone https://github.com/AthenaDecisionSystems/athena-ibm-techxchange.git` from an empty directory.  This creates a subdirectory `athena-ibm-techxchange`
### Create your own environment file

**UNDER PROGRESS BEGIN**
- Copy the provided `athena-ibm-techxchange\#.env#` file to `athena-ibm-techxchange\.env`
- Open that file and provide your own value for the following
1. **Create an IBM watsonx.ai account**  
   Visit the [IBM watsonx.ai](https://www.ibm.com/products/watsonx-ai) page and follow the links to set up a Cloud instance.

2. **Generate an API key**  
   In your IBM Cloud account, go to `Profile and settings` and generate an API key => WATSONX_APIKEY=
IBM_WATSONX_APIKEY=

4. **Copy your watsonx.ai configuration parameters**  
Create a new watsonx.ai project and copy IBM_WATSONX_URL and IBM_WATSON_PROJECT_ID=

   ```
   (API_)WATSONX_URL=<your watsonx.ai URL> # example value = https://us-south.ml.cloud.ibm.com/
   WATSONX_APIKEY=<your watsonx.ai API Key>
   (SANS X)WATSONX_PROJECT_ID=<your watsonx.ai Project ID>

**UNDER PROGRESS END**

### Start the Docker images
- In directory `athena-ibm-techxchange\.env` type `docker compose up -d`
- This will start the 5 containers required to run the demo
- The first time you run that command, this will first pull the Docker images and create the containers

Follow the progress of the pull/build/start process in Docker Desktop or in Colima. As soon as the CPU stabilizes, you can proceed to the following step.

### Upload the policy document to the vector store

The first step of the scenario relies on the Retrieval-Augmented Generation (RAG) mechanism. To prepare for this, you will need to upload the policy document, split it into chunks, and store the chunks in the vector database.  
Please follow the steps:
- 

## Demo Execution
- Visit 

## Alternate Scenario

## What You Have Seen

## Known issues

## Call to Action
- Reach out to us, as we'd love to have a conversation
  - Contact us https://athenadecisions.com/contact-us
  - Even better, schedule 