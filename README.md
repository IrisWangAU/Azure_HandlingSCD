# Handling-Slowly-Changed-Dimentions
Example to show how to deal with Slowly Changed Dimentions Using Azure Synapse Anlaytics

"Slowly Changed Dimentions" refers to a scenario where the value in your database (e.g. relational tables) can change ocassionally. For example, the customer address can change someday. There are several ways to handle the situation:

1. Type 1 SCD means that the old values are not saved, the database only shows the latest values.
2. Type 2 SCD means you store a new copy of a record whenever one of its fields changes. New columns (StartDate, EndDate, IsCurrent) need to be derived and Surrogate Key need to be created for same customers with different details copies.
3. Type 3 SCD contains two version of the data, the old value and the latest value. But are suitbale for only two versions of the field's value.
4. Type 6 SCD is a combination of Type 2 and Type 3. It adds a new record whenever the field changes, and it also has extra columns to keep track of the previous version of the field

In this example, the Type 1 method is demonstarted using Azure Synapse Analytics.

The source dataset contains information for Customers. The destination dataset is required to be updated if there are any changes for the existing customers and details for new customers to be inserted.

The steps are as follows:
1. create extra column `HashKey` in source table `CustomerSource`
2. find rows with the `HashKey` that are not in the destination table `CustomerSink`
3. outerjoin the data from step 2 with the destination table `CustomerSink` based on `CustomerID`
4. update the `InsertedDate` and `ModifiedDate`: update the `ModifiedDate` and `InsertedDate` to current date when the entry is new; keep the `InsertedDate` and update the  `ModifiedDate` to current date for existing customers
5. allow upserts option in the destination table for pipeline run
