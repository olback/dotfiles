for file in $(ls -d */); do

    target_dir=$file"target"
    # echo $target_dir

    if [ -d $target_dir ]; then
        echo "Removing $target_dir"
        rm -rf $target_dir
    fi

done
