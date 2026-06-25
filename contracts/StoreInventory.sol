// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/**
 * @title StoreInventory
 * @dev Склад інтернет-магазину
 */
contract StoreInventory {

    enum ProductStatus { NewIncome, OutOfStock, LowStock, InStock }

    struct Product {
        string name;
        uint quantity;
        ProductStatus status;
    }

    mapping(string => Product) public inventory;

    event LogProduct(Product product);

    constructor() {
        // 6. Статичний масив нових продуктів
        Product[3] memory newProducts;
        newProducts[0] = Product("Apple",   30,  ProductStatus.NewIncome);
        newProducts[1] = Product("Apple",   150, ProductStatus.NewIncome);
        newProducts[2] = Product("Bananas", 50,  ProductStatus.NewIncome);

        // 7-10. Цикл по newProducts
        for (uint i = 0; i < newProducts.length; ) {

            string memory pName = newProducts[i].name;

            // 9. Додати або збільшити quantity
            if (bytes(inventory[pName].name).length == 0) {
                inventory[pName] = newProducts[i];
            } else {
                inventory[pName].quantity += newProducts[i].quantity;
            }

            // 10. Оновити статус по quantity
            if (inventory[pName].quantity == 0) {
                inventory[pName].status = ProductStatus.OutOfStock;
            } else if (inventory[pName].quantity <= 100) {
                inventory[pName].status = ProductStatus.LowStock;
            } else {
                inventory[pName].status = ProductStatus.InStock;
            }

            unchecked { i++; }
        }

        // 11. Вивести Apple та Bananas
        emit LogProduct(inventory["Apple"]);
        emit LogProduct(inventory["Bananas"]);
    }
}
