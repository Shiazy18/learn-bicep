Bicep files are idempotent, which means that you can deploy the same file many times and get the same resource types in the same state.

You don't have to worry about the complexities of ordering operations. Azure Resource Manager orchestrates the deployment of interdependent resources so that they're created in the correct order. When possible, Resource Manager deploys resources in parallel, which helps your deployments to finish faster than serial deployments. You deploy the file through one rather than multiple imperative commands.

Preview changes: You can use the what-if operation to preview changes before deploying the Bicep file. 

No state or state files to manage: Azure stores all states. You can collaborate with others and be confident that your updates are handled as expected.

No cost and open source: Since Bicep is free, you don't pay for premium capabilities. Microsoft Support supports it.

## Waht-if in bicep

Running the what-if operation

- az deployment group what-if for resource group deployments
- az deployment sub what-if for subscription level deployments
- az deployment mg what-if for management group deployments
- az deployment tenant what-if for tenant deployments

You can use the --confirm-with-what-if switch (or its short form -c) to preview the changes and get prompted to continue with the deployment. Add this switch to:

az deployment group create
az deployment sub create.
az deployment mg create
az deployment tenant create