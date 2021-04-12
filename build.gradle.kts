val ktor_version: String by project
val kotlin_version: String by project
val logback_version: String by project

plugins {
    application
    kotlin("jvm") version "1.4.32"
    id("com.expediagroup.graphql") version "4.0.0-rc.1"
}

group = "app.albe"
version = "0.0.1"
application {
    mainClass.set("app.albe.ApplicationKt")
}

repositories {
    mavenCentral()
    gradlePluginPortal()
    jcenter()
}

dependencies {
    implementation("com.expediagroup", "graphql-kotlin-spring-server", "4.0.0-rc.1")
    implementation("io.ktor:ktor-server-core:$ktor_version")
    implementation("io.ktor:ktor-server-netty:$ktor_version")
    implementation("ch.qos.logback:logback-classic:$logback_version")
    testImplementation("io.ktor:ktor-server-tests:$ktor_version")
}

val graphqlGenerateSDL by tasks.getting(com.expediagroup.graphql.plugin.gradle.tasks.GraphQLGenerateSDLTask::class) {
    packages.set(listOf("app.albe.graphql.types", "app.albe.graphql.queries"))
}

tasks.build {
    dependsOn(graphqlGenerateSDL)
}
