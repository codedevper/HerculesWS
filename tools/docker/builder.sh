if [ ! -f /hercules/login-server ]; then
  export runBuild=1;
elif [ ! -f /hercules/char-server ]; then
  export runBuild=1;
elif [ ! -f /hercules/map-server ]; then
  export runBuild=1;
else
  export runBuild=0;
fi

if [ "${runBuild}" -eq "1" ]; then
  ### checking that ./configure has ran by looking for make file
  if [ ! -f /hercules/make ]; then
    echo "Warning: ./configure will be executed with provided values";
    echo "Make sure you have set the variables you want in the docker-compose.yml file";
    echo $BUILDER_CONFIGURE
    ./configure $BUILDER_CONFIGURE
  fi

  make clean && make sql;
fi
