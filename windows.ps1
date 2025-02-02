function Set-ROS2 {
    $location = "$(Get-Location)"
    $env:VOLUME_MAPPING = "${location}:/ros2_ws"
    $env:ROS2_DOCKER_ENV = "C:\Users\iamat\Documents\repos\ros2-docker"
    $env:ROS2_DOCKER_COMPOSE_START_COMMAND = "docker compose -f docker-compose.windows.yml up -d --build"
    $env:ROS2_DOCKER_COMPOSE_STOP_COMMAND = "docker compose down"
    $env:ROS2_DOCKER_SHELL_COMMAND = "docker exec -it ros2 /bin/bash"

    Write-Host "ROS2 development env-variables are set:"
    Write-Host "VOLUME_MAPPING: $env:VOLUME_MAPPING"
    Write-Host "ROS2_DOCKER_COMPOSE_START_COMMAND: $env:ROS2_DOCKER_COMPOSE_START_COMMAND"
    Write-Host "ROS2_DOCKER_COMPOSE_STOP_COMMAND: $env:ROS2_DOCKER_COMPOSE_STOP_COMMAND"
}

function Start-ROS2 {
    Set-ROS2
    Push-Location $env:ROS2_DOCKER_ENV
    Invoke-Expression $env:ROS2_DOCKER_COMPOSE_START_COMMAND
    Pop-Location
    Write-Host "ROS2 development environment started."
    Write-Host "Use the command Enter-ROS2 to enter it."
}

function Enter-ROS2 {
    Set-ROS2
    Write-Host "Creating ROS2 Shell"
    Invoke-Expression $env:ROS2_DOCKER_SHELL_COMMAND
}

function Stop-ROS2 {
    Set-ROS2
    Write-Host "Shutting down ROS2 container"
    Push-Location $env:ROS2_DOCKER_ENV
    Invoke-Expression $env:ROS2_DOCKER_COMPOSE_STOP_COMMAND
    Pop-Location
}

function ROS2 {
    Write-Host "ROS2 Utilities Help menu"
    Write-Host "- Start-ROS2"
    Write-Host "- Enter-ROS2"
    Write-Host "- Stop-ROS2"
}
