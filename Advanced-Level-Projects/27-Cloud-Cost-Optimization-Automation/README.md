# Cloud Cost Optimization Automation

## Overview

In this project, you will learn how to automate cloud cost optimization by monitoring resource usage and identifying underutilized resources. This project is designed for advanced-level DevOps engineers who want to gain hands-on experience with cost management and optimization strategies in cloud environments.

## Prerequisites

- Advanced knowledge of cloud platforms (e.g., AWS, Azure, GCP)
- Familiarity with cloud cost management tools and APIs
- A cloud account with access to cost management services
- A text editor (e.g., Vim, Nano, or VS Code)

## Project Structure

- `cost-monitoring-scripts`: This directory contains the scripts for monitoring cloud resource usage and cost.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Advanced-Level-Projects/27-Cloud-Cost-Optimization-Automation
   ```

2. Create a `cost-monitoring-scripts` directory in the project directory and add the scripts for monitoring cloud resource usage and cost.

## Example Cloud Cost Monitoring Scripts

### 1. AWS Cost Monitoring Script

This script monitors AWS resource usage and cost.

```python
import boto3

def get_aws_costs():
    client = boto3.client('ce', region_name='us-east-1')
    response = client.get_cost_and_usage(
        TimePeriod={
            'Start': '2021-01-01',
            'End': '2021-01-31'
        },
        Granularity='MONTHLY',
        Metrics=['BlendedCost']
    )
    return response['ResultsByTime'][0]['Total']['BlendedCost']['Amount']

if __name__ == "__main__":
    cost = get_aws_costs()
    print(f"AWS Cost for January 2021: ${cost}")
```

### 2. Azure Cost Monitoring Script

This script monitors Azure resource usage and cost.

```python
from azure.identity import DefaultAzureCredential
from azure.mgmt.costmanagement import CostManagementClient

def get_azure_costs():
    credential = DefaultAzureCredential()
    client = CostManagementClient(credential)
    scope = '/subscriptions/{subscription-id}'
    query = {
        'type': 'Usage',
        'timeframe': 'MonthToDate'
    }
    response = client.query.usage(scope, query)
    return response['properties']['rows'][0][0]

if __name__ == "__main__":
    cost = get_azure_costs()
    print(f"Azure Cost for Month-to-Date: ${cost}")
```

### 3. GCP Cost Monitoring Script

This script monitors GCP resource usage and cost.

```python
from google.cloud import billing_v1

def get_gcp_costs():
    client = billing_v1.CloudBillingClient()
    project_name = 'projects/{project-id}'
    response = client.get_billing_info(name=project_name)
    return response.billing_account_name

if __name__ == "__main__":
    cost = get_gcp_costs()
    print(f"GCP Billing Account: {cost}")
```

## Conclusion

By completing this project, you will have gained a solid understanding of how to automate cloud cost optimization by monitoring resource usage and identifying underutilized resources. Feel free to modify the example scripts and create your own cost monitoring scripts to further enhance your skills.
