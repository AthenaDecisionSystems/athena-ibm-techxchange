# How to Create your Watsonx API Keys

Follow these steps to create your Watsonx API keys:

### 1. Create a Watsonx.ai Account
   - Visit [Watsonx.ai](https://watsonx.ai) and click **Start your free trial**.
   - Complete the sign-up process and log in.

### 2. Create a Project
   - From the IBM Watsonx dashboard, open the navigation panel and go to **Projects > View all projects**.
   - Click **New project**.
   - Provide a name and description for your project.
   - Choose a data storage option.
   - Click **Create**.

### 3. Copy the Project ID
   - In the new project, go to the **Manage** tab.
   - Under **General**, copy the **Project ID**.
   - This is the key to be used in your `.env` file for **IBM_WATSON_PROJECT_ID**.

### 4. Create a Deployment Space
   - From the Watsonx dashboard, click **Deployments**.
   - Click **New deployment space**.
   - For the **Select machine learning service** option, choose **Create a new machine learning service**.
   - Select the **Lite** pricing plan for testing. You can upgrade later to **Essentials** or **Standard** if needed.
   - Click **Create**.

### 5. Link the Machine Learning Service to the Project
   - From the Watsonx dashboard, go to **Projects**.
   - In your project, go to the **Manage** tab.
   - Select **Services & integrations**, then click **Associate services**.
   - Find and select the machine learning service you created.

### 6. Set Up the API Key
   - From the Watsonx dashboard, click **Access (IAM)**, which will redirect you to the IBM Cloud site.
   - Select **Service IDs** and choose the Service ID you created.
   - Go to the **API Keys** tab and click **Create**.
   - Provide a name and description, then create the API key.
   - Copy or download the API key for future reference. This is the key to be used in your `.env` file for **WATSONX_APIKEY** and **IBM_WATSONX_APIKEY**.
   - To learn more about the API key, see [Managing the user API key](https://dataplatform.cloud.ibm.com/docs/content/wsj/admin/admin-apikeys.html?context=wx&audience=wdp)

### 7. Identify your service endpoint URL
   - Use the following URL as the base for the Watsonx.ai API endpoints. Choose the URL that matches the region of your data center, which corresponds to the location you selected during account registration.
      - Dallas: `https://us-south.ml.cloud.ibm.com`
      - Frankfurt: `https://eu-de.ml.cloud.ibm.com`
      - London: `https://eu-gb.ml.cloud.ibm.com`
      - Tokyo: `https://jp-tok.ml.cloud.ibm.com`
   - This endpoint URL must be set in your `.env` file for **IBM_WATSONX_URL**.

### What to Do Next
   - Double check what you saved for the **API Key**, **Project ID**, and **Watsonx.ai Endpoint URL** in your `.env` file for easy access to Watsonx.ai foundation models.

For more details, refer to the [Introduction to IBM Watsonx.ai as a Service](https://www.ibm.com/docs/en/watsonx) documentation.
