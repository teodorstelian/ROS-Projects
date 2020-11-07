execute_process(COMMAND "/home/teodor/catkin_ws/build/pico_zense_camera/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/teodor/catkin_ws/build/pico_zense_camera/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
