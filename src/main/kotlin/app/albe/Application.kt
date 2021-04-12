package app.albe

import app.albe.graphql.queries.CustomerQueries
import io.ktor.server.engine.*
import io.ktor.server.netty.*
import app.albe.plugins.*
import com.expediagroup.graphql.generator.SchemaGenerator
import com.expediagroup.graphql.generator.SchemaGeneratorConfig
import com.expediagroup.graphql.generator.TopLevelObject
import com.expediagroup.graphql.generator.hooks.SchemaGeneratorHooks
import com.expediagroup.graphql.generator.toSchema
import graphql.GraphQL


fun main() {

    val config = SchemaGeneratorConfig(supportedPackages = listOf("app.albe.graphql.queries", "app.albe.graphql.types"))
    val queries = listOf(
        TopLevelObject(CustomerQueries())
    )
    val graphQLSchema = toSchema(config, queries)

    embeddedServer(Netty, port = 8080, host = "0.0.0.0") {
        configureRouting()
    }.start(wait = true)

}
