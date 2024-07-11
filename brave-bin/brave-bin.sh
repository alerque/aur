#!/usr/bin/env bash

if
	test -z "${XDG_CONFIG_HOME}"
then
	XDG_CONFIG_HOME="${HOME}/.config"
fi

CONF_FILE="${XDG_CONFIG_HOME}/brave-flags.conf"

if
	test -f "${CONF_FILE}"
then
	mapfile -t CONF_LIST < "${CONF_FILE}"
fi

for CONF_LINE in "${CONF_LIST[@]}"
do
	if
		grep -Evq '^[[:space:]]*(#|$)' <<< "${CONF_LINE}"
	then
		FLAG_LIST+=("${CONF_LINE}")
	fi
done

export CHROME_VERSION_EXTRA='stable'

exec /opt/brave-bin/brave "${FLAG_LIST[@]}" "${@}"
