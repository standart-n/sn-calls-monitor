
SN_CSS = ./css/sn.css
SN_LESS = ./less/sn.less
BOOTSTRAP_CSS = ./css/bootstrap.css
BOOTSTRAP_LESS = ./bootstrap/less/bootstrap.less
BOOTSTRAP_RESPONSIVE_CSS = ./css/bootstrap-responsive.css
BOOTSTRAP_RESPONSIVE_LESS = ./bootstrap/less/responsive.less
DATE=$(shell date +%I:%M%p)
CHECK=\033[32m✔\033[39m
HR=\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#\#


#
# BUILD DOCS
#

build:

	@echo "\n${HR}"
	@echo "Building Standart-N..."
	@echo "${HR}\n"

	@jshint ./script/*.js --config ./script/.jshintrc
	@echo "Running JSHint on javascript...             ${CHECK} Done"

	@recess --compile ${SN_LESS} > ${SN_CSS}
	@echo "Compiling LESS with Recess...               ${CHECK} Done"

	@cat ./script/sn.js ./script/sn.ajax.js ./script/sn.conf.js ./script/sn.events.js ./script/sn.triggers.js > ./js/sn.js
	@uglifyjs ./js/sn.js -nc > ./js/sn.min.js
	@echo "Compiling and minifying javascript...       ${CHECK} Done"

	@echo "Successfully built."


	@echo "\n\n${HR}"
	@echo "Building Bootstrap..."
	@echo "${HR}\n"

	@jshint ./bootstrap/js/*.js --config ./bootstrap/js/.jshintrc
	@echo "Running JSHint on javascript...             ${CHECK} Done"

	@recess --compile ${BOOTSTRAP_LESS} > ${BOOTSTRAP_CSS}
	@recess --compile ${BOOTSTRAP_RESPONSIVE_LESS} > ${BOOTSTRAP_RESPONSIVE_CSS}
	@echo "Compiling LESS with Recess...               ${CHECK} Done"
	
	@cp ./bootstrap/img/* ./img/
	
	@cat ./bootstrap/js/bootstrap-transition.js ./bootstrap/js/bootstrap-alert.js ./bootstrap/js/bootstrap-button.js ./bootstrap/js/bootstrap-carousel.js ./bootstrap/js/bootstrap-collapse.js ./bootstrap/js/bootstrap-dropdown.js ./bootstrap/js/bootstrap-modal.js ./bootstrap/js/bootstrap-tooltip.js ./bootstrap/js/bootstrap-popover.js ./bootstrap/js/bootstrap-scrollspy.js ./bootstrap/js/bootstrap-tab.js ./bootstrap/js/bootstrap-typeahead.js ./bootstrap/js/bootstrap-affix.js > ./js/bootstrap.js
	@uglifyjs ./js/bootstrap.js -nc > ./js/bootstrap.min.tmp.js

	@echo "/**\n* Bootstrap.js v2.2.2 by @fat & @mdo\n* Copyright 2012 Twitter, Inc.\n* http://www.apache.org/licenses/LICENSE-2.0.txt\n*/" > ./bootstrap/copyright
	@cat ./bootstrap/copyright ./js/bootstrap.min.tmp.js > ./js/bootstrap.min.js
	@rm ./bootstrap/copyright ./js/bootstrap.min.tmp.js

	@echo "Compiling and minifying javascript...       ${CHECK} Done"
	@echo "\n${HR}"


	@echo "Successfully built at ${DATE}."

#	@echo "${HR}\n"
#	@echo "Thanks for using Bootstrap,"

#
# RUN JSHINT & QUNIT TESTS IN PHANTOMJS
#


#.PHONY: docs watch gh-pages
