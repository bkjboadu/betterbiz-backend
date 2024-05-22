from .quickbooks import provider_classes as quickbooks_provider_classes

# Optionally, you can aggregate all provider classes if there are multiple providers
provider_classes = []
provider_classes.extend(quickbooks_provider_classes)
