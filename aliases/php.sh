alias cu="composer update"
alias ecj="e composer.json"

alias pcsf="php-cs-fixer fix ."

function pe {
  files=()
  for arg in "$@"; do
    dir=$( echo "${arg}" | awk -F/ '{print $1}' )

    filename=$(basename "${arg}")
    extension="${filename##*.}"

    if [ ${extension} = "php" ]; then
      srcFile=""
      testFile=""

      if [ "${dir}" = "src" ]; then
        srcFile=${arg}
        testFile=$( echo "${arg}" | sed -e 's/src/test/' -e 's/.php/Test.php/' )
      fi

      if [ "${dir}" = "test" ]; then
        srcFile=$( echo "${arg}" | sed -e 's/test/src/' -e 's/Test.php/.php/' )
        testFile=${arg}
      fi

      files+=( ${srcFile} ${testFile} )
    else
      files+=( ${arg} )
    fi
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
