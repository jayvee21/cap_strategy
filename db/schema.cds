namespace cap.strategy.db;

entity Products {
    key ID          : Integer;
        Name        : String(100);
        Description : String(500);
        Price       : Decimal(10, 2);
        Stock       : Integer;
}

entity Orders {
    key ID         : Integer;
        ProductID  : Association to Products;
        Quantity   : Integer;
        OrderDate  : DateTime;
        Status     : String(20);
        Customer   : Association to Customers;
        OrderItems : Association to many OrderItems
                         on OrderItems.Order = $self;
}

entity Customers {
    key ID      : Integer;
        Name    : String(100);
        Email   : String(100);
        Phone   : String(20);
        Address : String(200);
        Orders  : Association to many Orders
                      on Orders.Customer = $self;
}

entity OrderItems {
    key ID       : Integer;
        Order    : Association to Orders;
        Product  : Association to Products;
        Quantity : Integer;
        Price    : Decimal(10, 2);
}
