cmake_minimum_required(VERSION 3.27)
project(a2_3_alexzmmv C)

set(CMAKE_C_STANDARD 11)

add_executable(a2_3_alexzmmv
        ../Domain/domain.c
        ../Domain/domain.h
        ../Dynamic_arr/dynamic_array.c
        ../Dynamic_arr/dynamic_array.h
        ../Repo/repository.c
        ../Repo/repository.h
        ../Controller/Controller.c
        ../Controller/Controller.h
        ../UI/UI.c
        ../!Run.c
        ../UI/UI.h
        ../UI/UI.h
        ../Controller/Controller.c
        ../Controller/MementoController/MementoController.c
        ../Controller/MementoController/MementoController.h
        ../Controller/CommandController/CommandController.c
        ../Controller/CommandController/CommandController.h
        ../Controller/VoidDynamicalArray/DynamicalvArray.c
        ../Controller/VoidDynamicalArray/DynamicalvArray.h
)