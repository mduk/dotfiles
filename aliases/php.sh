alias cu="composer update"
alias ecj="e composer.json"

function pe {
  files=()
  for arg in "$@"; do
    dir=$( echo "${arg}" | awk -F/ '{print $1}' )

    filename=$(basename "${arg}")
    extension="${filename##*.}"

    if [ ${extension} = "php" ]; then
      if [ "${dir}" = "src" ]; then
        testFile=$( echo "${arg}" | sed -e 's/src/test/' -e 's/.php/Test.php/' )
        srcFile=${arg}
      fi

      if [ "${dir}" = "test" ]; then
        srcFile=$( echo "${arg}" | sed -e 's/test/src/' -e 's/Test.php/.php/' )
        testFile=${arg}
      fi
    else
      files+=( ${arg} )
    fi

    files+=( ${srcFile} ${testFile} )
  done

  e ${files[*]}
}

function pu {
	if [ -e "vendor/bin/phpunit" ]; then
		./vendor/bin/phpunit
	fi

	if [ -e "vendor/composer/bin/phpunit" ]; then
		./vendor/composer/bin/phpunit
	fi
}
