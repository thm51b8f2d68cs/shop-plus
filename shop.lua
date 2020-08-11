function main()
    --Init
        --Check for updates and let user choose whether to install
        --Read contents of storage and store in a table
        --Get the prices of the items in storage that user has defined
        --Read config file to get user's configuration
    --Display
        --Title
        --List of pages
            --Browse
                --Display items based on popularity
                --When an item is clicked display a page for it
                    --Description
                    --Price
                    --Amount in stock
                    --Buy now button | show address to purchase immediately
                    --Add to cart button | add item to cart to purchase when user chooses
                    --Back button | maybe
            --Cart
                 --Cart is a shulker box where items are stored when they are added
                --User can remove n items from the cart
                --Cart displays a total
                --Checkout button provides a pseudo-item with an address of /pay cart@address.kst
            --Home
                --Returns to home page
            --Search | TBD
                --Show search bar and keyboard
                --Show results that contain what the user enters for the search
    --Keep records of purchases
        --Ask user if they want a receipt of their purchase
        --Log payment information
    --Track how popular each purchase is | TBD
        --Each time an item is bought increase it's popularity by one
    --Allow user to log in with UUID so multiple players can shop at once | TBD
end




main()
