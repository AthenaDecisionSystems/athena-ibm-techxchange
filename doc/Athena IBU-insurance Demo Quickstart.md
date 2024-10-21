# Athena IBU-Insurance Demo Quickstart
This demo showcases an Insurance Customer Service scenario where a chatbot, relying solely on pure LLM technology, including Retrieval-Augmented Generation (RAG), produces inaccurate responses that do not align with the insurance carrier's policy.  
It then demonstrates the solution: An agentic architecture that orchestrates a rule-based decision service built with IBM Operational Decision Manager ([IBM ODM](https://www.ibm.com/fr-fr/products/operational-decision-manager)) and LLM-based agents available through [watsonx.ai](https://www.ibm.com/products/watsonx-ai).

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Known Limitations](#known-limitations)
3. [Demo Setup in a Few Easy Steps](#demo-setup-in-a-few-easy-steps)
4. [Reading and understanding the business policy document](#reading-and-understanding-the-business-policy-document)
5. [Demo Script](#demo-script)
6. [Call to Action](#call-to-action)


## Prerequisites
Below are the prerequisites to install and run the demo:  

> **UNDER PROGRESS BEGIN**
> - Access to [IBM watsonx.ai](https://www.ibm.com/products/watsonx-ai).
>  - You can start a free trial by following the **Start your free trial** link in https://www.ibm.com/products/watsonx-ai. If you don't have an IBM Cloud account yet, you will be prompted to create one.  
> 
> **UNDER PROGRESS END**

- [Git](https://git-scm.com/) in order to get the bootstrap files on your machine
- [Docker Compose](https://docs.docker.com/compose/) in order to run the demo, which is a multi-container application.
  - On Windows, the simplest and recommended approach is to get [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/) as it includes both Docker Engine and Docker Compose required to run the demo
  - On Mac you can use either [Docker Desktop](https://docs.docker.com/desktop/install/mac-install/) or [Colima](https://github.com/abiosoft/colima)
- A web browser. The demo has been thoroughly tested using Google Chrome.

## Known Limitations
> **UNDER PROGRESS BEGIN**
> - Cannot change the rule
> - 777
> - Chat history erased
>
> **UNDER PROGRESS END**

## Demo Setup in a Few Easy Steps
### Clone the bootstrap files from GitHub
- Run `git clone https://github.com/AthenaDecisionSystems/athena-ibm-techxchange.git` from an empty directory.  This creates a subdirectory `athena-ibm-techxchange`
### Create your own environment file
> **UNDER PROGRESS BEGIN**
> - Copy the provided `athena-ibm-techxchange\#.env#` file to `athena-ibm-techxchange\.env`
> - Open that file and provide your own value for the following
> 1. **Create an IBM watsonx.ai account**  
>    Visit the [IBM watsonx.ai](https://www.ibm.com/products/watsonx-ai) page and follow the links to set up a Cloud instance.
>
> 2. **Generate an API key**  
>   In your IBM Cloud account, go to `Profile and settings` and generate an API key => WATSONX_APIKEY=
IBM_WATSONX_APIKEY=
>
> 4. **Copy your watsonx.ai configuration parameters**  
> Create a new watsonx.ai project and copy IBM_WATSONX_URL and IBM_WATSON_PROJECT_ID=
>
> **UNDER PROGRESS END**

### Start the Docker images
- In directory `athena-ibm-techxchange\.env` type `docker compose up -d`
- This will start the 5 containers required to run the demo
- The first time you run that command, this will first pull the Docker images and create the containers

Follow the progress of the pull/build/start process in Docker Desktop or in Colima. As soon as the CPU stabilizes, you can proceed to the following step.

### Upload the policy document to the vector store

The first step of the scenario relies on the Retrieval-Augmented Generation (RAG) mechanism. To prepare for this, you will need to upload the policy document, split it into chunks, and store the chunks in the vector database.  
Please follow the following steps:
1. Visit [the demo UI](http://localhost:3000/)
2. Click on the **Chatbot** option located in the top menu
3. Click on the **Documents** accordion located on the left-hand-side
4. Click on the **IBU Policies document** link  

Steps 2-4: [Please click](./1-DownloadPolicyDoc.png)  

5. This opens the **Complaint Management Customer Retention Policy** pdf document in a new tab
6. Click the Download link on your browser to store it locally

Steps 5-6: [Please click](./2-PolicyDocumentPDF.png)

7. Click on the **Documents** option located in the top menu
8. Click on the **Select a file to upload** link

Steps 7-8: [Please click](./3-UploadDoc.png)

9. Select the `IBUpolicies.pdf` file that you just uploaded  

As a result, the document is divided into chunks and stored in the vector store, making it ready for retrieval. 

## Reading and understanding the business policy document

Check the `IBUpolicies.pdf` document. Pay special attention to the two following rules, that will be eligible in the demo scenario:
- `AC-HOME-CONT-UP`. This rule stipulates that an upsell to the home policy should be proposed to customers under certain conditions
- `AC-HOME-CONT-VOUCHER` - That rule states that the CSR should offer a voucher for additional services from an affiliate provider under certain conditions

## Demo Script

### Chat in RAG/File Search only mode

In that first step of the demo, we will rely on pure LLM mechanisms and figure out what is going to happen.

Please follow the following script, as illustrated in the following image: [Please click](./4-RAG.png)
1. Visit [the demo UI](http://localhost:3000/)
2. Click on the **Chatbot** option located in the top menu
3. Make sure **IBU Insurance Agent 3.0 (Hybrid)** is selected in the **Agent** list on the left
4. Make sure the **Settings** buttons show
   - **Use File Search**: **Yes**  
   *This indicates that we are going to append the relevant chunks of the policy document to the prompt*
   - **Use Decision Services**: **No**  
   *This indicates that we are going to rely on the LLM (limitted) reasoning capabilities to handle the client complaint*
5. In the text input box, type `demo`; This is a shortcut for typing the following message from the Customer Service Representative:

> *I received this email from my customer. What should I answer?*
>
> **From**:  Sonya Smith (sonya.smith@thecure.org)
>
> **To**:  support@ibuinsurance.com
>
> **Subject**:  Covering my carpet cleaning
>
> Dear IBU,
>
> During the recent water leak at my house (cf claim 250303), my expensive Moroccan carpet was damaged by the water.  You told me that this damage is not covered by my policy. I’m very disappointed. What do you propose?
>
> Thank you!
>
> Yours,
>
> **Sonya Smith**

Press the **Enter** key

6. As a first outcome, the CSR message shows in the chat window
7. As a second outsome, the chatbot response shows in the chat window

Below is the output we are getting. LLM do not behave deterministically so you might have something rather different:

> **Step #1**: The identified motive of Sonya Smith's message is UnsatisfiedWithAppliedCoverages. She is disappointed because the damage to her carpet was not covered by her policy, which indicates she expected it to be covered.  
>
> **Step #2**: It appears that Sonya Smith has shown a possible intention to leave due to her dissatisfaction with the coverage applied to her claim. This could lead her to consider other insurance providers if her concerns are not addressed satisfactorily.  
>
> **Step #3**:
>
> - **Customer Details**: Sonya Smith, born on March 12, 1999, is a client with IBU Insurance. She has been a client since November 12, 2023, and her customer lifetime value percentile is 62, indicating a moderate level of engagement with the company.
> - **Current Policies**: Sonya holds a Home insurance policy (effective from June 6, 2023, to June 6, 2024) with coverages for water damage, fire, wind, and other damages, primarily focused on the building structure rather than contents.
Current Claims: Claim number 250303 is currently in process and verified. It includes damages from a water leak, specifically to wooden flooring and a carpet. The water damage coverage applies to the building but does not cover the contents, which is why the carpet damage was not reimbursed.  
>
> **Step #4**:
>
> - **Recommendations**: I recommend reaching out to Sonya to explain the specifics of her policy coverage, particularly that the water damage coverage does not extend to contents like carpets. It may also be beneficial to discuss potential options for upgrading her policy to include broader coverage for contents in the future. Additionally, expressing empathy for her situation and offering to assist her in understanding her policy better could help retain her as a customer.  
>
> Here’s a suggested response:
>
>> Dear Sonya,
>>
>> Thank you for reaching out to us regarding your recent claim (cf claim 250303). I understand your disappointment regarding the damage to your Moroccan carpet during the water leak.
>>
>> Unfortunately, as per your current Home insurance policy, the water damage coverage applies only to the structure of your home and does not extend to personal contents, such as carpets. I understand how frustrating this can be, and I sincerely apologize for any inconvenience this has caused.
>>
>> If you would like, I can assist you in exploring options to upgrade your policy to include broader coverage for personal belongings in the future. Please let me know how you would like to proceed, and I am here to help.
>>
>> Thank you for your understanding.
>>
>> Best regards,
>>
>> [Your Name]
>> IBU Insurance Support Team


### What happened in this pure LLM mode?

The agentic architecture underpinning the chatbot ensures the following flow:
- Step #1: Identify the motive of the customer's request
- Step #2: Assess the customer's risk of churn
- Step #3: Get the customer's detail from the external customer database
- Step #4: By reconcilliating the insight extracted from the email (Steps #1 and #2) and customer database data (Step #3), determine what rules from the policy document apply

While the outcome of Steps #1 to #3 is satisfactory, the LLM failed in Step #4 to recommend 

### Chat in RAG/File Search + Use Decision Service mode
### What happened in this Hybrid AI mode?

## Call to Action
- Reach out to us, as we'd love to have a conversation
  - Contact us https://athenadecisions.com/contact-us
  - Even better, schedule 