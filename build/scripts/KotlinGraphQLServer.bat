@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  KotlinGraphQLServer startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and KOTLIN_GRAPH_QL_SERVER_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\KotlinGraphQLServer-0.0.1.jar;%APP_HOME%\lib\graphql-kotlin-spring-server-4.0.0-rc.1.jar;%APP_HOME%\lib\ktor-server-netty-jvm-1.5.3.jar;%APP_HOME%\lib\ktor-server-host-common-jvm-1.5.3.jar;%APP_HOME%\lib\ktor-server-core-jvm-1.5.3.jar;%APP_HOME%\lib\graphql-kotlin-server-4.0.0-rc.1.jar;%APP_HOME%\lib\graphql-kotlin-federation-4.0.0-rc.1.jar;%APP_HOME%\lib\graphql-kotlin-schema-generator-4.0.0-rc.1.jar;%APP_HOME%\lib\jackson-module-kotlin-2.11.4.jar;%APP_HOME%\lib\kotlin-reflect-1.4.32.jar;%APP_HOME%\lib\kotlinx-coroutines-jdk8-1.4.3.jar;%APP_HOME%\lib\kotlinx-coroutines-reactor-1.4.3.jar;%APP_HOME%\lib\kotlin-stdlib-jdk8-1.4.32.jar;%APP_HOME%\lib\ktor-http-cio-jvm-1.5.3.jar;%APP_HOME%\lib\ktor-http-jvm-1.5.3.jar;%APP_HOME%\lib\ktor-network-jvm-1.5.3.jar;%APP_HOME%\lib\ktor-utils-jvm-1.5.3.jar;%APP_HOME%\lib\kotlin-stdlib-jdk7-1.4.32.jar;%APP_HOME%\lib\kotlinx-coroutines-reactive-1.4.3.jar;%APP_HOME%\lib\ktor-io-jvm-1.5.3.jar;%APP_HOME%\lib\kotlinx-coroutines-core-jvm-1.4.3.jar;%APP_HOME%\lib\kotlin-stdlib-1.4.32.jar;%APP_HOME%\lib\spring-boot-starter-webflux-2.4.4.jar;%APP_HOME%\lib\spring-boot-starter-json-2.4.4.jar;%APP_HOME%\lib\spring-boot-starter-2.4.4.jar;%APP_HOME%\lib\spring-boot-starter-logging-2.4.4.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\kotlin-stdlib-common-1.4.32.jar;%APP_HOME%\lib\annotations-13.0.jar;%APP_HOME%\lib\reactor-kotlin-extensions-1.1.3.jar;%APP_HOME%\lib\federation-graphql-java-support-0.6.3.jar;%APP_HOME%\lib\graphql-java-16.2.jar;%APP_HOME%\lib\log4j-to-slf4j-2.13.3.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.30.jar;%APP_HOME%\lib\slf4j-api-1.7.30.jar;%APP_HOME%\lib\config-1.3.1.jar;%APP_HOME%\lib\spring-boot-starter-reactor-netty-2.4.4.jar;%APP_HOME%\lib\reactor-netty-http-1.0.5.jar;%APP_HOME%\lib\netty-codec-http2-4.1.60.Final.jar;%APP_HOME%\lib\alpn-api-1.1.3.v20160715.jar;%APP_HOME%\lib\netty-transport-native-kqueue-4.1.54.Final.jar;%APP_HOME%\lib\reactor-netty-core-1.0.5.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.60.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.60.Final-linux-x86_64.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\spring-webflux-5.3.5.jar;%APP_HOME%\lib\spring-web-5.3.5.jar;%APP_HOME%\lib\reactor-core-3.4.4.jar;%APP_HOME%\lib\netty-handler-proxy-4.1.60.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.60.Final.jar;%APP_HOME%\lib\netty-resolver-dns-native-macos-4.1.60.Final-osx-x86_64.jar;%APP_HOME%\lib\netty-resolver-dns-4.1.60.Final.jar;%APP_HOME%\lib\netty-handler-4.1.60.Final.jar;%APP_HOME%\lib\netty-codec-dns-4.1.60.Final.jar;%APP_HOME%\lib\netty-codec-socks-4.1.60.Final.jar;%APP_HOME%\lib\netty-codec-4.1.60.Final.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.60.Final.jar;%APP_HOME%\lib\netty-transport-4.1.60.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.60.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.60.Final.jar;%APP_HOME%\lib\netty-common-4.1.60.Final.jar;%APP_HOME%\lib\classgraph-4.8.103.jar;%APP_HOME%\lib\protobuf-java-3.9.0.jar;%APP_HOME%\lib\spring-boot-autoconfigure-2.4.4.jar;%APP_HOME%\lib\spring-boot-2.4.4.jar;%APP_HOME%\lib\jakarta.annotation-api-1.3.5.jar;%APP_HOME%\lib\spring-context-5.3.5.jar;%APP_HOME%\lib\spring-aop-5.3.5.jar;%APP_HOME%\lib\spring-beans-5.3.5.jar;%APP_HOME%\lib\spring-expression-5.3.5.jar;%APP_HOME%\lib\spring-core-5.3.5.jar;%APP_HOME%\lib\snakeyaml-1.27.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.11.4.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.11.4.jar;%APP_HOME%\lib\jackson-module-parameter-names-2.11.4.jar;%APP_HOME%\lib\jackson-databind-2.11.4.jar;%APP_HOME%\lib\reactive-streams-1.0.3.jar;%APP_HOME%\lib\java-dataloader-2.2.3.jar;%APP_HOME%\lib\antlr4-runtime-4.8.jar;%APP_HOME%\lib\jackson-annotations-2.11.4.jar;%APP_HOME%\lib\spring-jcl-5.3.5.jar;%APP_HOME%\lib\jackson-core-2.11.4.jar;%APP_HOME%\lib\log4j-api-2.13.3.jar


@rem Execute KotlinGraphQLServer
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %KOTLIN_GRAPH_QL_SERVER_OPTS%  -classpath "%CLASSPATH%" app.albe.ApplicationKt %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable KOTLIN_GRAPH_QL_SERVER_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%KOTLIN_GRAPH_QL_SERVER_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
