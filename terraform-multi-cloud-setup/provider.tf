terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.30.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "eu-central-1"
}

provider "azurerm" {
  features {}
}
