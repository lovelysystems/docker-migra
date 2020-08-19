plugins {
    id("com.lovelysystems.gradle") version ("1.3.2")
}

// read the version from the requirements file
version = file("requirements.in").readLines().first { it.startsWith("migra==") }.substring(7)

lovely {
    pythonProject()
    dockerProject("lovelysystems/migra")
    dockerFiles.from("requirements.txt")
}

tasks["prepareDockerImage"].dependsOn("dev")
