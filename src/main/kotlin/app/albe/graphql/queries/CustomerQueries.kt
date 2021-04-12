package app.albe.graphql.queries

import app.albe.graphql.types.Customer
import com.expediagroup.graphql.server.operations.Query

class CustomerQueries : Query{
    fun getCustomers() : List<Customer> {
        return listOf()
    }
}