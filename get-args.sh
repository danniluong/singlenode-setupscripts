#!/bin/bash

while getopts ":i:d:v:c:l:u:p:o:k:s:f:n:a:b:" arg; do
    case "${arg}" in
      i)
        icp_inception=${OPTARG}
        ;;
      d)
        cluster_dir=${OPTARG}
        ;;
      v)
        log_verbosity=${OPTARG}
        ;;
      c)
        install_command=${OPTARG}
        ;;
      l)
        locations+=( ${OPTARG} )
        ;;
      u)
        username=${OPTARG}
        ;;
      p)
        password=${OPTARG}
        ;;
      o)
        docker_package_location=${OPTARG}
        ;;
      k)
        docker_image=${OPTARG}
        ;;
      f)
        image_file=${OPTARG}
        ;;
      s)
        ssh_pass=${OPTARG}
        ;;
      n)
        cluster_name=${OPTARG}
        ;;
      a)
        cluster_ca_domain=${OPTARG}
        ;;
      b)
	cluster_lb_address=${OPTARG}
	;;
      \?)
        echo "Invalid option : -$OPTARG in commmand $0 $*" >&2
        exit 1
        ;;
      :)
        echo "Missing option argument for -$OPTARG in command $0 $*" >&2
        exit 1
        ;;
    esac
done
