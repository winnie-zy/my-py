#!/bin/sh
BASENAME="${0##*/}"
# Standard function to print an error and exit with a failing return code
error_exit () {
  echo "${BASENAME} - ${1}" >&2
  exit 1
}

usage () {
  if [ "${#@}" -ne 0 ]; then
    echo "* ${*}"
    echo
  fi
  cat <<ENDUSAGE
Usage:
export PY_FILE_S3_URL="s3://my-bucket/my-python-file"
ENDUSAGE

  exit 2
}
# parse PY_FILE_S3_URL
if [ -z "${PY_FILE_S3_URL}" ]; then
  usage "PY_FILE_S3_URL not set. No object to download."
fi

scheme="$(echo "${PY_FILE_S3_URL}" | cut -d: -f1)"
if [ "${scheme}" != "s3" ]; then
  usage "PY_FILE_S3_URL must be for an S3 object; expecting URL starting with s3://"
fi

ENRTY_FILE="entry.py"
aws s3 cp "${PY_FILE_S3_URL}" - > "${ENRTY_FILE}" || error_exit "Failed to download S3 python script."

python ${ENRTY_FILE}