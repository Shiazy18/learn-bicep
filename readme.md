# Bicep

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

### Short-circuiting

The what-if operation in Bicep deployments may encounter "short-circuiting," a scenario where the service cannot fully analyze a module or resource due to the deployment's structure or dependencies on external state.

You can use the --confirm-with-what-if switch (or its short form -c) to preview the changes and get prompted to continue with the deployment. Add this switch to:

az deployment group create
az deployment sub create.
az deployment mg create
az deployment tenant create

## Deploy Bicep file

Using azure cli with below command

```az
az group create --name myContainerRegRG --location centralus
az deployment group create --resource-group myContainerRegRG --template-file main.bicep --parameters acrName={your-unique-name}
```

or using powershell with below command

```pwsh

New-AzResourceGroup -Name myContainerRegRG -Location centralus
New-AzResourceGroupDeployment -ResourceGroupName myContainerRegRG -TemplateFile ./main.bicep -acrName "{your-unique-name}"
```

## Bicep CLI commands

`build`: The build command converts a Bicep file to a JSON Azure Resource Manager template (ARM template). Typically, you don't need to run this command because it runs automatically when you deploy a Bicep file. Run it manually when you want to see the JSON ARM template that's created from your Bicep file.

`decompile`: converts a JSON ARM template to a Bicep file:
bicep decompile main.json
az bicep decompile --file main.json

`format`: formats a Bicep file so that it follows the recommended style conventions. 
az bicep format --file main.bicep
bicep format main.bicep

`install`: adds the Bicep CLI to your local environment,
az bicep install

`publish`: adds a module to a registry
bicep publish <bicep-file> --target br:<registry-name>.azurecr.io/<module-path>:<tag> --documentationUri <documentation-uri>
az bicep publish --file <bicep-file> --target br:<registry-name>.azurecr.io/<module-path>:<tag> --documentationUri <documentation-uri>

## Azure Resource Manager template specs in Bicep

A template spec is a resource type for storing an Azure Resource Manager template (ARM template) to deploy it later. 

## to delete

``` bash
az group delete \
  --name rg-myapp-dev \
  --yes \
  --no-wait
```
