cmake_minimum_required(VERSION 3.10)

project(coolgame VERSION 0.0.1)

include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/release-1.11.0.zip
)
FetchContent_MakeAvailable(googletest)

include_directories(../include)
add_subdirectory(common)

add_executable(coolgame main.cpp)

target_link_libraries(coolgame PUBLIC common)

target_include_directories(coolgame PUBLIC 
                           "${PROJECT_BINARY_DIR}" 
                           common
                           )

enable_testing()
add_executable(GameObjectTest test/test_GameObject.cpp)
target_link_libraries(GameObjectTest
  gtest_main
  common
)

include(GoogleTest)
gtest_discover_tests(GameObjectTest)