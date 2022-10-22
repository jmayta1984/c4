workspace {

    model {


        user = person "Payment System User"
        
        mobileApp = softwareSystem "Mobile Payment Application"{
           app = container "Mobile Application" {
                user -> this "Access to"
            }

            businessLogic = container "Business Logic"{
                app -> this "Exposes functionalities"

                backend = component {
                    app -> this "Expose funcionalities"
                }

                integration = component 

                dataMapper = component 
            }
           
            database = container "Database"{
              businessLogic -> this "Reads and writes to"
              dataMapper -> this "Reads and writes to"
            }

            user -> this "Access to" 
        }

        crmSytem = softwareSystem "CRM" {
            mobileApp -> this "Retrieve user profile"
            businessLogic -> this "Retrive user profile"
            integration - > this "Retrive user profile"

        }

        bankingSytem = softwareSystem "Core Banking"{
            mobileApp -> this "Store and retrieve payments"
            businessLogic -> this "Store and retrieve payments"

        }

        reportingSystem = softwareSystem "Reporting" {
            mobileApp -> this "Store and retrieve transaction history"
            database -> this "Store and retrieve transaction history"
        }
        
        
        
    }

    views {
        systemContext mobileApp {
            include *
            autolayout lr
        }

        container mobileApp {
            include *
            autolayout lr
        }

        component businessLogic {
            include *
            autolayout lr
        }

        theme default
        
    }

}