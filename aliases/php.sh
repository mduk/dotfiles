alias cu="composer update"
alias ecj="e composer.json"

function pu {
	if [ -e "vendor/bin/phpunit" ]; then
		./vendor/bin/phpunit
	fi

	if [ -e "vendor/composer/bin/phpunit" ]; then
		./vendor/composer/bin/phpunit
	fi
}
